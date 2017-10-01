DROP TABLE IF EXISTS post;

CREATE TABLE post (
	id SERIAL PRIMARY KEY,
	title VARCHAR,
	description TEXT,
	url VARCHAR,
	genre TEXT

);

INSERT INTO post (title, description, url, genre) VALUES ('Meme 1', 'meme 1 is great', 'www.meh.com', 'comedy');
INSERT INTO post (title, description, url, genre) VALUES ('Meme 2', 'meme 2 is great', 'www.meh.com', 'comedy');
INSERT INTO post (title, description, url, genre) VALUES ('Meme 3', 'meme 3 is great', 'www.meh.com', 'comedy');
INSERT INTO post (title, description, url, genre) VALUES ('Meme 4', 'meme 4 is great', 'www.meh.com', 'comedy');
INSERT INTO post (title, description, url, genre) VALUES ('Meme 5', 'meme 5 is great', 'www.meh.com', 'comedy');
