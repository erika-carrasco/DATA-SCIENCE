###################################### SESIÓN 7 ###########################################

########################### RETO 1 ########################################################

CREATE DATABASE quinoa_test;

USE quinoa_test;

CREATE TABLE users (
	User_id INT PRIMARY KEY,
    Gender CHAR(1),
    Age INT,
    Occupation INT,
    Zip_code VARCHAR(20)
    );
    
CREATE TABLE ratings (
	User_id INT PRIMARY KEY,
    Movie_id INT,
    Rating INT,
    Time BIGINT 
);

CREATE TABLE movies (
	Movie_id INT PRIMARY KEY,
    Title VARCHAR(100),
    Genres VARCHAR(100)
);

########################### RETO 2 ########################################################

SELECT* FROM users;
SELECT* FROM movies;








