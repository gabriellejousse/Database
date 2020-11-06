CREATE TABLE candidates ( 
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
first_name VARCHAR(30), 
surname VARCHAR(30), 
dob DATE, 
salary INT NOT NULL, 
portfolio VARCHAR(100), 
github VARCHAR(100) 
)

CREATE TABLE languages (
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
name VARCHAR(30), 
candidate INT NOT NULL, 
FOREIGN KEY(candidate) REFERENCES candidates(id) 
)

CREATE TABLE programming ( 
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
name VARCHAR(30), 
candidate INT NOT NULL, 
FOREIGN KEY(candidate) REFERENCES candidates(id) 
)



INSERT INTO `languages`(`name`) VALUES ('JS'), ('Python'), ('Java')