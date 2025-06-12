require('dotenv').config();
const express = require('express');
const app = express();
const PORT = process.env.PORT;

// Ruta raíz
app.get('/', (req, res) => {
  res.send('Hello World desde DevOps Kata!');
});

// Ruta de estado
app.get('/status', (req, res) => {
  res.json({ status: 'OK', timestamp: new Date().toISOString() });
});

// Ruta de salud
app.get('/health', (req, res) => {
  res.sendStatus(204); // No Content
});

app.listen(PORT, () => {
  console.log(`App corriendo en http://localhost:${PORT}`);
});
