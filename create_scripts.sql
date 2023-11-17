CREATE TABLE directors (
  director_id SERIAL PRIMARY KEY,
  first_name VARCHAR(30),
  last_name VARCHAR(30) NOT NULL,
  data_of_birth DATE,
  nationality VARCHAR(20)
);
SELECT *
FROM directors;
CREATE TABLE actors (
  actor_id SERIAL PRIMARY KEY,
  first_name VARCHAR(30),
  last_name VARCHAR(30) NOT NULL,
  gender CHAR(1),
  data_of_birth DATE
);
SELECT *
FROM actors;
CREATE TABLE movies (
  movie_id SERIAL PRIMARY KEY,
  movie_name VARCHAR(50) NOT NULL,
  movie_length INT,
  movie_lang VARCHAR(20),
  release_date DATE,
  age_certificate VARCHAR(5),
  director_id INT REFERENCES directors (director_id)
);
SELECT *
FROM movies;
CREATE TABLE movie_revenues (
  revenue_id SERIAL PRIMARY KEY,
  movie_id INT REFERENCES movies (movie_id),
  domestic_takings NUMERIC(6, 2),
  international_takings NUMERIC(6, 2)
);
SELECT *
FROM movie_revenues;
CREATE TABLE movies_actors (
  movie_id INT REFERENCES movies (movie_id),
  actor_id INT REFERENCES actors (actor_id),
  PRIMARY KEY (movie_id, actor_id)
);
SELECT *
FROM movies_actors;

CREATE TABLE examples (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(30),
  last_name VARCHAR(30)
);

SELECT *
FROM examples;

ALTER TABLE examples
ADD COLUMN age VARCHAR(50) NOT NULL;
ADD COLUMN nationality VARCHAR(50);
ADD COLUMN email VARCHAR(50) UNIQUE;

ALTER TABLE examples
ALTER COLUMN nationality TYPE CHAR(3);