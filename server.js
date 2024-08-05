const express = require('express');
const bodyParser = require('body-parser');

const app = express();
const PORT = 80;

// Middleware to parse JSON bodies
app.use(bodyParser.json());

// Serve the HTML page
app.get('/', (req, res) => {
    res.sendFile(__dirname + '/index.html');
});

// Serve the HTML page
app.get('/cookies', (req, res) => {
    res.sendFile(__dirname + '/cookies.html');
});

app.get('/cors', (req, res) => {
    res.sendFile(__dirname + '/cors.html');
});


app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
