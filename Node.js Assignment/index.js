import express from 'express';
import bodyParser from 'body-parser'; //Express body-parser is an npm library used to process data sent through an HTTP request body.
import usersRoutes from './routes/users.js';

const app = express();
const PORT = 8080; // The port we are going to use 

app.use(bodyParser.json());

app.use('/users', usersRoutes);

app.get('/', (req,res) =>
    res.send('Hello from Jaydeep.')
);

app.listen(PORT,  () => console.log(`The server is executing on port : http://localhost:${PORT}`)); 

