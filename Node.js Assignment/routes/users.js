import express from 'express';
import { v4 as uuidv4 } from 'uuid'; // will create a unique id for each and every user

const router = express.Router();

let users = []; // It is empty, because the adding of user data is done using postman directly. So whenever we execute our whole code it automatically be empty and we need to enter the data again using postman

// All routes in here are starting with /users
router.get('/', (req, res) => {
    res.send(users);
});


// Add user to the database via POST request
router.post('/', (req, res) => {
    const user = req.body; //The req.body property contains key-value pairs of data submitted in the request body.
    users.push({ ...user, id: uuidv4() });
    res.send(`User with the name ${user.name} added to the database!`);
});

// Find user in database with the help of GET method
router.get('/:id', (req, res) => {
    const { id } = req.params;
    const foundUser = users.find((user) => user.id == id);
    res.send(foundUser);
});

// Delete user from database via DELETE method
router.delete('/:id', (req, res) => {
    const { id } = req.params;
    users = users.filter((user) => user.id != id);
    res.send(`User with the id ${id} deleted from the database.`);
});

// Generally we use PATCH and PUT in order to update our data.
// In case, you want to update the whole information of the user, you can use the PUT method. 
// But Here in our case, we just want to update the DOB and age of the user, so we are using the PATCH method.
router.patch('/:id', (req, res) => {
    const { id } = req.params;
    const { name, password, birthdate, age, country, phone } = req.body;
    const user = users.find((user) => user.id == id);
    if (name) {
        user.name = name;
    }
    if (password) {
        user.password = password;
    }
    if (birthdate) {
        user.birthdate = birthdate;
    }
    if (age) {
        user.age = age;
    }
    if (country) {
        user.country = country;
    }
    if (phone) {
        user.phone = phone;
    }

    res.send(`User with the id ${id} has been updated`);
});

export default router;