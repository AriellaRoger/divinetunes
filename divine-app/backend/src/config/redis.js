require('dotenv').config({ path: '../../../.env' }); // Load .env from root /app/divine-app/.env
const IORedis = require('ioredis');

const redisConfig = {
  host: process.env.REDIS_HOST || '127.0.0.1',
  port: parseInt(process.env.REDIS_PORT, 10) || 6379, // Ensure port is an integer
  password: process.env.REDIS_PASSWORD || undefined, // Set to undefined if empty or not provided
  db: parseInt(process.env.REDIS_DB, 10) || 0,       // Ensure db is an integer
  // Add other options like retryStrategy if needed
  retryStrategy(times) {
    const delay = Math.min(times * 50, 2000); // delay will be 50, 100, 150, ... up to 2s
    console.log(`Redis: Retrying connection attempt ${times}, delay ${delay}ms`);
    return delay;
  },
  maxRetriesPerRequest: 3, // Important for handling transient errors
  showFriendlyErrorStack: process.env.NODE_ENV === 'development', // Show detailed errors in dev
};

let redisClient;

try {
  redisClient = new IORedis(redisConfig);

  redisClient.on('connect', () => {
    console.log(`Successfully connected to Redis. Host: ${redisConfig.host}:${redisConfig.port}, DB: ${redisConfig.db}`);
  });

  redisClient.on('error', (err) => {
    console.error(`Redis connection error: ${err}. Config: Host: ${redisConfig.host}:${redisConfig.port}, DB: ${redisConfig.db}`);
    // Depending on the error, you might want to implement more robust error handling
    // For example, if it's an auth error, you might not want to retry indefinitely.
  });

  redisClient.on('reconnecting', (delay) => {
    console.log(`Reconnecting to Redis... next attempt in ${delay}ms`);
  });

  redisClient.on('end', () => {
    console.log('Connection to Redis has ended.');
  });

  // Graceful shutdown for the main application signals
  const gracefulShutdown = (signal) => {
    console.log(`${signal} received. Closing Redis connection...`);
    if (redisClient && redisClient.status === 'ready') { // Check if client exists and is connected
        redisClient.quit(() => {
          console.log('Redis connection closed gracefully.');
          process.exit(0);
        });
    } else if (redisClient) { // If client exists but not connected, try to disconnect
        redisClient.disconnect();
        console.log('Redis client disconnected.');
        process.exit(0);
    } else {
        process.exit(0); // No client to close
    }
  };

  process.on('SIGINT', () => gracefulShutdown('SIGINT'));
  process.on('SIGTERM', () => gracefulShutdown('SIGTERM'));

} catch (error) {
  console.error("Failed to initialize Redis client:", error);
  // Fallback or mock client if Redis is optional and app can run without it
  // For this setup, we assume Redis is essential if configured.
  // So, if new IORedis() itself throws (e.g. invalid options), we log and potentially exit or disable Redis features.
  // Create a mock client that always fails or returns null for cache operations
  redisClient = {
    get: async () => { console.error("Redis is not connected (initialization failed). GET failed."); return null; },
    set: async () => { console.error("Redis is not connected (initialization failed). SET failed."); return false; },
    del: async () => { console.error("Redis is not connected (initialization failed). DEL failed."); return false; },
    on: () => {}, // No-op for event listeners
    quit: () => {},
    disconnect: () => {},
    status: 'uninitialized_error'
  };
  console.warn("Redis client could not be initialized. Cache operations will be unavailable.");
}


module.exports = redisClient;
