const express = require('express');
const app = express();
const PORT = 3000;

app.use(express.static('app'));
app.use(express.static('build/contracts'));

// define routes
app.get('/', (req, res) => {
    res.sendFile(`${__dirname}./app/index.html`);
});
// route that catches everything else
app.get('*', (req, res) => {
    res.status(404);
    res.send('Ooppsss... this URL does not exist');
});

// listener
app.listen(PORT, () => {
    console.log(`Ethereum ToDo List App running on port ${PORT}`);
});