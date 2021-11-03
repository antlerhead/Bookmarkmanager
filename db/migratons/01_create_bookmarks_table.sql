CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));

INSERT INTO bookmarks VALUES(1, 'http://www.adobe.com');
INSERT INTO bookmarks (url) VALUES ('http://www.google.com');

CREATE DATABASE "bookmark_manager_test";
CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));


