// server.js
const express = require('express');
const app = express();
const PORT = 3000;

// Middleware to parse JSON bodies
app.use(express.json());

// GET route
app.get('/', (req, res) => {
  res.send('🌐 Hello from Express over a domain!');
});

// POST route
app.post('/submit', (req, res) => {
  res.json({ message: '✅ POST received!', data: req.body });
});

// PUT route
app.put('/update', (req, res) => {
  res.json({ message: '✅ PUT received!', data: req.body });
});

// Start the server on 0.0.0.0 to make it accessible on domain/IP
app.listen(PORT, '0.0.0.0', () => {
  console.log(`✅ Express server running at http://yourdomain.com:${PORT}/`);
});
