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