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

-- Create author table

CREATE TABLE Author(
    id int generated always as identity,
    first_name varchar(255),
    last_name varchar(255),
    primary key (id)
);

-- Create game table

CREATE TABLE Game(
    id int generated always as identity,
    multiplayer varchar(255),
    last_played_at date,
    published_date date,
    archived boolean,
    author_id int,
    CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES author(id),
    primary key (id)
);