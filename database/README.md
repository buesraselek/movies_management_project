
Question 1
List all the actors born before 1980.



```sql

SELECT * FROM main_actors_tbl WHERE year_of_birth < 1980;
+----+-----------------------+---------------+------+
| id | name                  | year_of_birth | sex  |
+----+-----------------------+---------------+------+
|  1 | Arnold Schwarzenegger |          1947 | M    |
|  3 | Sigourney Weaver      |          1949 | F    |
|  4 | Christian Bale        |          1974 | M    |
|  5 | Leonardo DiCaprio     |          1974 | M    |
|  6 | Angelina Jolie        |          1975 | F    |
|  7 | Zoe Saldaña           |          1978 | F    |
+----+-----------------------+---------------+------+


```
Question 2
How many movies did Nolan direct ?

SELECT * FROM movies_tbl WHERE director_id = 2;

```sql

SELECT * FROM movies_tbl WHERE director_id = 2;
+----+-----------------+--------------+-------------+
| id | title           | release_year | director_id |
+----+-----------------+--------------+-------------+
|  8 | Inception       |         2010 |           2 |
| 12 | The Dark Knight |         2008 |           2 |
+----+-----------------+--------------+-------------+

```
```sql 
SELECT COUNT(*)
FROM movies_tbl 
WHERE director_id = 2;

+----------+
| COUNT(*) |
+----------+
|        2 |
+----------+

```

Question 3

Among all the movies of James Cameron, how many were female actors ?


```sql
SELECT main_actors_tbl.name, sex, directors_tbl.name
FROM directors_tbl
CROSS JOIN main_actors_tbl
ORDER BY sex ASC
LIMIT 5;

+------------------+------+---------------+
| name             | sex  | name          |
+------------------+------+---------------+
| Gemma Chan       | F    | James Cameron |
| Zoe Saldaña      | F    | James Cameron |
| Angelina Jolie   | F    | James Cameron |
| Gal Gadot        | F    | James Cameron |
| Sigourney Weaver | F    | James Cameron |
+------------------+------+---------------+

```

Question 4

How many directors did Leonardo DiCaprio worked with ?


```sql

SELECT directors_tbl.name, main_actors_tbl.name
FROM directors_tbl
CROSS JOIN main_actors_tbl
WHERE main_actors_tbl.name = "Leonardo DiCaprio"
ORDER BY directors_tbl.name ASC;
+-------------------+-------------------+
| name              | name              |
+-------------------+-------------------+
| Chloe Zhaos       | Leonardo DiCaprio |
| Christopher Nolan | Leonardo DiCaprio |
| James Cameron     | Leonardo DiCaprio |
| Patty Jenkins     | Leonardo DiCaprio |
+-------------------+-------------------+

```

Question 5
Who is the oldest director ?

```sql

SELECT name, year_of_birth
FROM directors_tbl
ORDER BY year_of_birth ASC
LIMIT 1;
+---------------+---------------+
| name          | year_of_birth |
+---------------+---------------+
| James Cameron |          1954 |
+---------------+---------------+

```


Question 6

What is the earliest movie of the oldest director ?


```sql
SELECT name,year_of_birth,release_year,title
FROM movies_tbl
CROSS JOIN directors_tbl
ORDER BY year_of_birth ASC, release_year ASC
LIMIT 1;
+---------------+---------------+--------------+------------+
| name          | year_of_birth | release_year | title      |
+---------------+---------------+--------------+------------+
| James Cameron |          1954 |         1984 | Terminator |
+---------------+---------------+--------------+------------+


```

Question 7

What is the latest movie of the youngest actor ?


```sql

SELECT  title, release_year,year_of_birth,name
FROM movies_tbl
CROSS JOIN main_actors_tbl
ORDER BY  release_year DESC, year_of_birth DESC
LIMIT 1;
+-----------+--------------+---------------+-----------+
| title     | release_year | year_of_birth | name      |
+-----------+--------------+---------------+-----------+
| Cleopatra |         2023 |          1985 | Gal Gadot |
+-----------+--------------+---------------+-----------+



