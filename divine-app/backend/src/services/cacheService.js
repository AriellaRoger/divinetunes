const redisClient = require('../config/redis');

const get = async (key) => {
  if (!redisClient || typeof redisClient.get !== 'function' || redisClient.status !== 'ready') {
    console.error(`Redis client not available or not connected. Cannot GET key: ${key}. Status: ${redisClient ? redisClient.status : 'N/A'}`);
    return null;
  }
  try {
    const value = await redisClient.get(key);
    return value ? JSON.parse(value) : null;
  } catch (error) {
    console.error(`Error getting key ${key} from Redis:`, error);
    return null; // Or throw error, depending on desired error handling
  }
};

const set = async (key, value, expirationInSeconds) => {
  if (!redisClient || typeof redisClient.set !== 'function' || redisClient.status !== 'ready') {
    console.error(`Redis client not available or not connected. Cannot SET key: ${key}. Status: ${redisClient ? redisClient.status : 'N/A'}`);
    return false;
  }
  try {
    const stringValue = JSON.stringify(value);
    if (expirationInSeconds) {
      await redisClient.set(key, stringValue, 'EX', expirationInSeconds);
    } else {
      await redisClient.set(key, stringValue);
    }
    return true;
  } catch (error) {
    console.error(`Error setting key ${key} in Redis:`, error);
    return false; // Or throw error
  }
};

const del = async (key) => {
  if (!redisClient || typeof redisClient.del !== 'function' || redisClient.status !== 'ready') {
    console.error(`Redis client not available or not connected. Cannot DEL key: ${key}. Status: ${redisClient ? redisClient.status : 'N/A'}`);
    return false;
  }
  try {
    await redisClient.del(key);
    return true;
  } catch (error) {
    console.error(`Error deleting key ${key} from Redis:`, error);
    return false; // Or throw error
  }
};

const disconnect = () => {
    if (redisClient && typeof redisClient.quit === 'function') {
        redisClient.quit();
        console.log("Redis client quit command issued via cacheService.");
    } else {
        console.warn("Attempted to disconnect via cacheService, but Redis client or quit function is unavailable.");
    }
};

module.exports = {
  get,
  set,
  del,
  disconnect, // mainly for testing or graceful shutdown
  redisClient // Export client directly if needed for advanced operations or status checking
};
