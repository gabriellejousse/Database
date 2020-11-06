/* TABLE STUDENTS */

CREATE TABLE `school`.`students` ( 
    `ID` INT NOT NULL , 
    `name` VARCHAR(30) NOT NULL , 
    `city` VARCHAR(30) NOT NULL ,
     UNIQUE (`ID`)) ENGINE = InnoDB;

INSERT INTO `students`(ID, name, city) VALUES 
(1, 'Véronique', 'Paris'),
(2, 'Steeven', 'Lyon'),
(3, 'Marc', 'Marseille'),
(4, 'Nour', 'Lyon'),
(5, 'Romain', 'Paris'),
(6, 'Sophie', 'Paris')


/* TABLE LANGUAGES */

CREATE TABLE `school`.`languages` ( 
    `ID` INT NOT NULL , 
    `name` VARCHAR(30) NOT NULL , 
    UNIQUE (`ID`)) ENGINE = InnoDB

INSERT INTO `languages`(`ID`, `name`) VALUES 
(1, 'French'),
(2, 'English'),
(3, 'German'),
(4, 'Spanish'),
(5, 'Mandarin')


/* TABLE FAVORITES */

CREATE TABLE `school`.`favorites` ( 
    `ID` INT NOT NULL , 
    `class` VARCHAR(30) NOT NULL , 
    `sport` VARCHAR(30) NOT NULL , 
    `student_id` INT NOT NULL , 
    UNIQUE (`ID`)) ENGINE = InnoDB;

INSERT INTO `favorites`(`ID`, `class`, `sport`, `student_id`) VALUES 
(1,'Maths','Cricket', 2), 
(2,'Music', 'Hip-hop', 6), 
(3,'Arts','Boxing', 1), 
(4, 'Literature','Tennis', 3), 
(5, 'Computer science', 'Tennis', 5),
(6,'Arts', 'Baseball', 4)


/* TABLE STUDENTS_LANGUAGES */

CREATE TABLE `school`.`students_languages` ( 
    `ID` INT NOT NULL , 
    `student_id` INT NOT NULL , 
    `language_id` INT NOT NULL , 
    UNIQUE (`ID`)) ENGINE = InnoDB;

INSERT INTO `students_languages`(`ID`, `student_id`, `language_id`) VALUES 
(1, 1, 1), 
(2, 1, 2), 
(3, 2, 1), 
(4, 2, 3), 
(5, 3, 1), 
(6, 4, 1), 
(7, 4, 2), 
(8, 4, 4), 
(9, 4, 5), 
(10, 5, 1), 
(11, 5, 5), 
(12, 6, 1), 
(13, 6, 2), 
(14, 6, 3)

/* RAPPORT LVL 1 */

SELECT * FROM school.students WHERE ID=3

SELECT * FROM school.students WHERE ID=6

SELECT `name`, `city` FROM `students` WHERE ID=1

SELECT `name` FROM `students` WHERE ID=2

SELECT * FROM `students` WHERE city='Paris'

SELECT `name` FROM `students` WHERE city='Lyon'


/* RAPPORT LVL 2 */

SELECT * FROM `students` 
JOIN `favorites` ON students.ID = favorites.student_id 
WHERE students.ID=5

SELECT `name`, `sport` FROM `students` 
JOIN `favorites` ON students.ID=favorites.student_id 
WHERE students.ID=4

SELECT `name`, `class` FROM `students` 
JOIN `favorites` ON students.ID=favorites.student_id 
WHERE students.ID=1

SELECT * FROM students 
JOIN favorites ON students.ID = favorites.student_id 
WHERE favorites.class='Music'

SELECT `name` FROM `students` 
JOIN `favorites` ON students.ID=favorites.student_id 
WHERE favorites.sport='Tennis'

SELECT `name` FROM `students` 
JOIN `favorites` ON students.ID=favorites.student_id 
WHERE favorites.class='Arts'

SELECT COUNT(*) FROM `students` 
WHERE students.city='Paris'


/* RAPPORT LVL 3 */

SELECT students.*, languages.name
FROM students 
JOIN students_languages ON students.ID=students_languages.student_id 
JOIN languages ON languages.ID=students_languages.language_id 
WHERE students.ID=1

SELECT students.*, languages.name
FROM students 
JOIN students_languages ON students.ID=students_languages.student_id 
JOIN languages ON languages.ID=students_languages.language_id 
WHERE students.ID=4

SELECT students.name, languages.name 
FROM students 
JOIN students_languages ON students.ID = students_languages.student_id 
JOIN languages ON languages.ID = students_languages.language_id 
WHERE students.ID = 5

SELECT students.name, COUNT(students_languages.language_id) as 'total' 
FROM students 
JOIN students_languages ON students.ID = students_languages.student_id 
GROUP BY students.name


/* BONUS */

SELECT name FROM students 
WHERE name LIKE '%e%'

SELECT favorites.sport FROM favorites 
JOIN students ON students.ID = favorites.student_id 
WHERE students.name LIKE '%e%'

SELECT favorites.class FROM favorites 
JOIN students ON favorites.student_id = students.ID 
WHERE students.city LIKE '%i%'


/* essai lvl2 part 4 */
SELECT * FROM students 
JOIN favorites ON students.ID = favorites.student_id 
JOIN students_languages ON students.ID = students_languages.student_id 
JOIN languages ON languages.ID = students_languages.language_id WHERE favorites.class='Music'
