# Create a new database 
CREATE DATABASE movie_db;

#Show all databases
SHOW DATABASES;

#use our new database
USE movie_db;

#Show existing tables
SHOW TABLES;

#Create table directors
CREATE TABLE directors_tbl(
   id int NOT NULL AUTO_INCREMENT,
   name varchar(255),
   year_of_birth int,
   PRIMARY KEY (id)
);

#Get information about the table 
#DESCRIBE <Table_name>
DESCRIBE directors_tbl;

#Add a new entry to the table 
INSERT INTO directors_tbl VALUES
(null,"Christopher Nolan",1970),
(null,"Patty Jenkins", 1971),
(null, "Chloe Zhaos", 1982);

#Show all data from table
# SELECT
# FROM
# <WHERE> 
SELECT * FROM directors_tbl;

# Create our Movie table
CREATE TABLE movies_tbl(
    id int NOT NULL AUTO_INCREMENT,
    title varchar(255),
    release_year int,
    director_id int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (director_id) REFERENCES directors_tbl (id)

);

# Add new movie in Movie table
INSERT INTO movies_tbl VALUES(
    null,
    "Titanic",
    1997,
    (SELECT id FROM directors_tbl WHERE name like "James Cameron")
);
INSERT INTO movies_tbl VALUES(
    null,
    "Wonder Woman",
    2017,
    (SELECT id FROM directors_tbl WHERE name like "Patty Jenkins")
);
INSERT INTO movies_tbl VALUES(    
    null,
    "Avatar",
    2009,
    (SELECT id FROM directors_tbl WHERE name like "James Cameron")
);
INSERT INTO movies_tbl VALUES(   
    null,
    "Aliens",
    1986,
    (SELECT id FROM directors_tbl WHERE name like "James Cameron")
);
INSERT INTO movies_tbl VALUES(
  
    null,
    "Inception",
    2010,
    (SELECT id FROM directors_tbl WHERE name like "Christopher Nolan")

);
INSERT INTO movies_tbl VALUES(
    
    null,
    "Terminator",
    1984,
    (SELECT id FROM directors_tbl WHERE name like "James Cameron")
);
(
    null,
    "Cleopatra",
    2023,
    (SELECT id FROM directors_tbl WHERE name like "Patty Jenkins")
);


INSERT INTO movies_tbl VALUES(
   
    null,
    "Eternals",
    2021,
    (SELECT id FROM directors_tbl WHERE name like "Chloe Zhaos")

);

INSERT INTO movies_tbl VALUES(
  
    null,
    "The Dark Knight",
    2008,
    (SELECT id FROM directors_tbl WHERE name like "Christopher Nolan")

);




# Selecting from multiple tables
SELECT *  movies_tbl.title, directors_tbl.name
FROM movies_tbl JOIN directors_tbl ON movies_tbl.director_id = directors_tbl.id
WHERE movies_tbl.title LIKE "Inception";

# Create your Actors table
CREATE TABLE main_actors_tbl(
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255),
    year_of_birth int,
    sex varchar(1),
    PRIMARY KEY (ID)

);

INSERT INTO main_actors_tbl VALUES(null, "Arnold Schwarzenegger", 1947, "M");
INSERT INTO main_actors_tbl VALUES(null, "Gal Gadot",             1985, "F");
INSERT INTO main_actors_tbl VALUES(null, "Sigourney Weaver",      1949, "F");
INSERT INTO main_actors_tbl VALUES(null, "Christian Bale",        1974, "M");
INSERT INTO main_actors_tbl VALUES(null, "Leonardo DiCaprio",     1974, "M");
INSERT INTO main_actors_tbl VALUES(null, "Angelina Jolie",        1975, "F");
INSERT INTO main_actors_tbl VALUES(null, "Zoe Saldaña",           1978, "F");
INSERT INTO main_actors_tbl VALUES(null, "Gemma Chan",            1982, "F");



# Create your Movie-Actors table
CREATE TABLE movie_actors_tbl(
    movie_id int NOT NULL,
    main_actors_id int NOT NULL,
    PRIMARY KEY (movie_id, main_actors_id),
    FOREIGN KEY (movie_id) REFERENCES movies_tbl(id),
    FOREIGN KEY (main_actors_id) REFERENCES main_actors_tbl(id)
);

INSERT INTO movie_actors_tbl VALUES
(
    (SELECT id FROM movies_tbl WHERE title LIKE "Avatar")
    (SELECT id FROM main_actors_tbl WHERE name LIKE "%Zoe Saldaña%")

);

#Examples
SELECT *
FROM movies_tbl 
WHERE title LIKE "T%";

SELECT COUNT(*)
FROM movies_tbl 
WHERE title LIKE "T%";

SELECT *
FROM movies_tbl
SORT BY DESC
ORDER BY release_year ASC;
ORDER BY release_year DESC;

SELECT title, release_year
FROM movies_tbl;

SELECT year_of_birth
FROM main_actors_tbl;
SELECT * FROM main_actors_tbl WHERE year_of_birth < 1980;



