DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists(
    id SERIAL8 PRIMARY KEY,
    artist_name VARCHAR(255)
);

CREATE TABLE albums(
    id SERIAL8 PRIMARY KEY,
    album_name VARCHAR(255),
    creator_artist VARCHAR(255) REFERENCES artists(id)
);
