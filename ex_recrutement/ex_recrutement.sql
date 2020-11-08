CREATE TABLE candidates ( 
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
first_name VARCHAR(30), 
surname VARCHAR(30), 
dob DATE, 
salary INT NOT NULL, 
portfolio VARCHAR(100), 
github VARCHAR(100) 
)

INSERT INTO `candidates`( `first_name`, `surname`, `dob`, `salary`, `portfolio`, `github` ) 
VALUES ('Gabrielle', 'Jousse', '1994-09-24', 2000, 'http://gabriellejousse.com', 'http://github.com/gabriellejousse'), 
('Yacine', 'Amesrouy', '1990-05-14', 1500, 'http://yacine.com', 'http://github.com/yacineamesrouy'), 
('Juliette', 'Jousse', '1996-07-03', 4000, 'http://juliette-j-e.com', 'http://github.com/juliettejousse')


CREATE TABLE languages (
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
name VARCHAR(30), 
candidate_id INT NOT NULL, 
FOREIGN KEY(candidate_id) REFERENCES candidates(id) 
)

INSERT INTO `languages`(`name`, `candidate.id`) 
VALUES 
('Java', 2), 
('Python', 3), 
('PHP', 1)


CREATE TABLE programming ( 
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
name VARCHAR(30), 
candidate_id INT NOT NULL, 
FOREIGN KEY(candidate_id) REFERENCES candidates(id) 
)

INSERT INTO `programming`(`name`, `candidate`) 
VALUES 
('React', 3),
('Express', 2), 
('Angular', 1)




SELECT * FROM candidates

SELECT COUNT(*) FROM candidates

SELECT candidates.first_name 
FROM candidates 
WHERE candidates.dob >= '1991-01-01'

SELECT candidates.first_name, candidates.salary 
FROM candidates 
WHERE candidates.salary <= 50000

SELECT candidates.first_name, candidates.portfolio 
FROM candidates 
WHERE candidates.portfolio != ''

SELECT candidates.first_name, candidates.github 
FROM candidates 
WHERE candidates.github != ''

???

SELECT candidates.first_name, programming.name 
FROM candidates 
JOIN programming ON candidates.id = programming.candidate_id 
WHERE programming.name = 'React'

