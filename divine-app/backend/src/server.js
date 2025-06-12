const app = require('./app');

// Ensure .env is loaded, especially if not done by app.js or for other potential direct uses in server.js
// Redundant if app.js already loads it and server.js only uses app.
// require('dotenv').config({ path: '../../.env' });


const PORT = process.env.PORT || 3001; // Default to 3001 as per .env.example

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
  if (process.env.NODE_ENV === 'development' || process.env.NODE_ENV === undefined) {
    console.log(`Development mode is ON. Health check: http://localhost:${PORT}/health`);
  }
});
