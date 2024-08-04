const express = require('express');
const axios = require('axios');
const bodyParser = require('body-parser');

const app = express();
const PORT = 80;

// Middleware to parse JSON bodies
app.use(bodyParser.json());

// Serve the HTML page
app.get('/', (req, res) => {
    res.sendFile(__dirname + '/index.html');
});

// Handle the POST request
app.post('/send-post', async (req, res) => {
    const { payload } = req.body;

    try {
        // Replace 1.1.1.1 with the actual server address
        const response = await axios.post('http://1.1.1.1/endpoint', {
            payload: payload,
        }, {
            headers: {
                'Client-Id': 'your-client-id',
                'Client-Secret': 'your-client-secret',
            },
        });

        res.json({
            success: true,
            data: response.data,
        });
    } catch (error) {
        console.error('Error sending POST request:', error);
        res.status(500).json({
            success: false,
            message: 'Error sending POST request',
        });
    }
});

app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
