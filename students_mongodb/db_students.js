/*utiliser db_students*/
//use "db_students"

/*créer collection(table) et insérer des données */
db.students.insert({ id: 1, name: 'veronique', city: 'paris' })
db.students.insert({ id: 2, name: 'steeven', city: 'lyon' })
db.students.insert({ id: 3, name: 'marc', city: 'marseille' })
db.students.insert({ id: 4, name: 'nour', city: 'lyon' })
db.students.insert({ id: 5, name: 'romain', city: 'paris' })
db.students.insert({ id: 6, name: 'sophie', city: 'paris' })

db.languages.insert({ id: 1, name: 'french' })
db.languages.insert({ id: 2, name: 'english' })
db.languages.insert({ id: 3, name: 'german' })
db.languages.insert({ id: 4, name: 'spanish' })
db.languages.insert({ id: 5, name: 'mandarin' })

db.favorites.insert({ id: 1, class: 'maths', sport: 'criket', studentsID: 2 })
db.favorites.insert({ id: 2, class: 'music', sport: 'hit-hop', studentsID: 6 })
db.favorites.insert({ id: 3, class: 'arts', sport: 'boxing', studentsID: 1 })
db.favorites.insert({ id: 4, class: 'litterature', sport: 'tennis', studentsID: 3 })
db.favorites.insert({ id: 5, class: 'computer sciences', sport: 'tennis', studentsID: 5 })
db.favorites.insert({ id: 6, class: 'arts', sport: 'baseball', studentsID: 4 })

db.students_languages.insert({ id: 1, studentsID: 1, languageID: 1 })
db.students_languages.insert({ id: 2, studentsID: 1, languageID: 2 })
db.students_languages.insert({ id: 3, studentsID: 2, languageID: 1 })
db.students_languages.insert({ id: 4, studentsID: 2, languageID: 3 })
db.students_languages.insert({ id: 5, studentsID: 3, languageID: 1 })
db.students_languages.insert({ id: 6, studentsID: 4, languageID: 1 })
db.students_languages.insert({ id: 7, studentsID: 4, languageID: 2 })
db.students_languages.insert({ id: 8, studentsID: 4, languageID: 4 })
db.students_languages.insert({ id: 9, studentsID: 4, languageID: 5 })
db.students_languages.insert({ id: 10, studentsID: 5, languageID: 1 })
db.students_languages.insert({ id: 11, studentsID: 5, languageID: 5 })
db.students_languages.insert({ id: 12, studentsID: 6, languageID: 1 })
db.students_languages.insert({ id: 13, studentsID: 6, languageID: 2 })
db.students_languages.insert({ id: 14, studentsID: 6, languageID: 3 })

/* requêtes lvl 1 */
db.students.find({ id: 3 })

db.students.find({ id: 6 })

/* la premiere accolade dans le find est l'équivalent du WHERE (condition) */
db.students.find({ id: 1 }, { name: 1, city: 1, _id: 0 })

db.students.find({ id: 2 }, { name: 1, _id: 0 })

db.students.find({ city: "paris" })

db.students.find({ city: "lyon" }, { name: 1, _id: 0 })

/* requêtes lvl 2 */

db.students.aggregate([
  {
    $match: {
      "id": 5
    }
  },
  {
    $lookup:
    {
      from: "favorites",
      localField: "id",
      foreignField: "student_id",
      as: "favorites_new"
    }
  },
  { $project: { "favorites_new.sport": 1, "favorites_new.class": 1 } }

])

//

db.students.aggregate([
  {
    $match: {
      "id": 4
    }
  },
  {
    $lookup:
    {
      from: "favorites",
      localField: "id",
      foreignField: "student_id",
      as: "favorites_new"
    }
  },
  { $project: { "favorites_new.sport": 1, "name": 1 } }

])

//

db.students.aggregate([
  {
    $match: {
      "id": 1
    }
  },
  {
    $lookup:
    {
      from: "favorites",
      localField: "id",
      foreignField: "student_id",
      as: "favorites_new"
    }
  },
  { $project: { "favorites_new.class": 1, "name": 1 } }

])

//

db.favorites.aggregate([
  {
    $match: {
      "class": "music"
    }
  },
  {
    $lookup:
    {
      from: "students",
      localField: "student_id",
      foreignField: "id",
      as: "students_new"
    }
  },
  { $project: { "class": 1, "students_new.name": 1, } }

])

//

db.favorites.aggregate([
  {
    $match: {
      "sport": "tennis"
    }
  },
  {
    $lookup:
    {
      from: "students",
      localField: "student_id",
      foreignField: "id",
      as: "students_new"
    }
  },
  { $project: { "class": 1, "students_new.name": 1, } }

])

//

db.favorites.aggregate([
  {
    $match: {
      "class": "arts"
    }
  },
  {
    $lookup:
    {
      from: "students",
      localField: "student_id",
      foreignField: "id",
      as: "students_new"
    }
  },
  { $project: { "class": 1, "students_new.name": 1, } }

])


//

db.students.aggregate([

  {
    $match: {
      city: "paris"
    }
  },
  {
    $count: "paris citizens"
  }

])

/* OU */

db.students.count({"city":"paris"})


/* requêtes lvl 3 */











///////////////
db.favorites.aggregate([
  {
    $match: {
      "class": "music"
    }
  },
  {
    $lookup:
    {
      from: "students",
      localField: "student_id",
      foreignField: "id",
      as: "students_new"
    }
  },
  {
    $lookup:
    {
      from: "students_languages",
      localField: "student_id",
      foreignField: "student_id",
      as: "students_languages_new"
    }
  },
  {
    $lookup:
    {
      from: "languages",
      localField: "student_id",
      foreignField: "id",
      as: "languages_new"
    }
  },
  { $project: { "class": 1, "students_new": 1, "students_languages_new": 1, "languages_new": 1 } }

])