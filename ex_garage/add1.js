/* étape 1 */

const mongoose = require('mongoose');

mongoose.connect('mongodb://localhost:27017/garage', {
        useNewUrlParser: true,
        useUnifiedTopology: true
    }).catch(err => console.log(err))

/* étape 2 */

const car = new mongoose.Schema({
    //_id:String,
    brand: String,
    model: String,
    year: Number,
    created: Date
})

const Car = mongoose.model('Car', car);

/* étape 3 */

// const espace= new Car({
//     brand: "Renault",
//     model: "Espace",
//     year: 1999
// })
// espace.save().then(res => console.log(res))

// const scenic = new Car({
//     brand:"Renault",
//     model:"Scenic",
//     year:2004
// });
// scenic.save().then(res => console.log(res))

// const peugeot308 = new Car({
//     brand:"Peugeot",
//     model:"308",
//     year:2017
// });
// peugeot308.save().then(res => console.log(res))




