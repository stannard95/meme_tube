DROP TABLE IF EXISTS post;

CREATE TABLE post (
	id SERIAL PRIMARY KEY,
	title VARCHAR,
	description TEXT,
	url VARCHAR,
	genre TEXT

);

INSERT INTO post (title, description, url, genre) VALUES ('Meme 1', 'meme 1 is great', 'pxFZYIeUuyg', 'comedy');
INSERT INTO post (title, description, url, genre) VALUES ('Meme 2', 'meme 2 is great', 'CbeDksV2OS4', 'comedy');
INSERT INTO post (title, description, url, genre) VALUES ('Meme 3', 'meme 3 is great', 'zJqEkLpeIz0', 'comedy');

