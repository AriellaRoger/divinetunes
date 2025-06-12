// divine-app/backend/src/config/database.js
require('dotenv').config({ path: '../../../.env' }); // Adjusted path to root .env from backend/src/config

module.exports = {
  development: {
    client: 'pg',
    connection: {
      host: process.env.DB_HOST || '127.0.0.1',
      port: process.env.DB_PORT || 5432,
      user: process.env.DB_USER || 'dbuser',
      password: process.env.DB_PASSWORD || 'dbpassword',
      database: process.env.DB_NAME || 'divine_db_dev',
    },
    migrations: {
      directory: '../database/migrations',
    },
    seeds: {
      directory: '../database/seeders',
    },
  },
  production: {
    client: 'pg',
    connection: {
      host: process.env.DB_HOST,
      port: process.env.DB_PORT,
      user: process.env.DB_USER,
      password: process.env.DB_PASSWORD,
      database: process.env.DB_NAME || 'divine_db_prod',
    },
    migrations: {
      directory: '../database/migrations',
    },
    seeds: {
      directory: '../database/seeders',
    },
  }
  // You can add other environments like 'test', 'staging'
};
