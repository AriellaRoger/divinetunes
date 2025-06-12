require('dotenv').config({ path: '../../../.env' }); // Load .env from root /app/divine-app/.env
const express = require('express');
const cors = require('cors');
const helmet = require('helmet');
const morgan = require('morgan');

const app = express();

// Middleware
app.use(cors()); // Enable CORS for all routes
app.use(helmet()); // Set security-related HTTP response headers
app.use(express.json()); // Parse JSON request bodies
app.use(express.urlencoded({ extended: true })); // Parse URL-encoded request bodies

// HTTP request logger middleware (only in development)
if (process.env.NODE_ENV === 'development' || process.env.NODE_ENV === undefined) { // Default to dev logging if NODE_ENV is not set
  app.use(morgan('dev'));
}

// Health Check Endpoint
app.get('/health', (req, res) => {
  res.status(200).json({
    status: 'ok',
    timestamp: new Date().toISOString(),
  });
});

// Placeholder for future routes
// app.use('/api/users', require('./routes/users')); // Example

// Basic Error Handling Middleware
// Not found handler (404)
app.use((req, res, next) => {
  res.status(404).json({
    error: {
      message: 'Not Found',
      path: req.originalUrl,
    },
  });
});

// Generic error handler (500)
app.use((err, req, res, next) => {
  console.error(err.stack); // Log error stack for debugging
  res.status(err.status || 500).json({
    error: {
      message: err.message || 'Internal Server Error',
      // Optionally include stack in development
      ...((process.env.NODE_ENV === 'development' || process.env.NODE_ENV === undefined) && { stack: err.stack }),
    },
  });
});

module.exports = app; // Export app for server.js or testing
