const mongoose = require('mongoose');

mongoose.connect('mongodb://localhost:27017/garage', {
        useNewUrlParser: true,
        useUnifiedTopology: true
    }).catch(err => console.log(err))


const car = new mongoose.Schema({
    brand: String,
    model: String,
    year: Number,
    created: Date
})

//console.log(car)