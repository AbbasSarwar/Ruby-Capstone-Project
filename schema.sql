CREATE TABLE genre(
id serial PRIMARY KEY,
name varchar(30)
)


CREATE TABLE MusicAlbum(
	id serial PRIMARY KEY,
	on_spotify BOOLEAN NOT NULL,
	publish_date date,
	archived BOOLEAN NOT NULL,
	genre_id int,
	CONSTRAINT genre_FK FOREIGN KEY(genre_id) REFERENCES genre(id)
)

CREATE TABLE label
(
    id    SERIAL PRIMARY KEY,
    title VARCHAR(100),
    color VARCHAR(100)
)

CREATE TABLE book
(
    id           SERIAL PRIMARY KEY,
    publish_date DATE,
    archived     BOOLEAN,
    publisher    VARCHAR(100),
    cover_state  VARCHAR(50),
    label_id     INTEGER REFERENCES label (id)
)