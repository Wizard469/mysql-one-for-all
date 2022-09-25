DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.plans (
	plan_id INT(10) NOT NULL PRIMARY KEY,
	plan_type VARCHAR(255) NOT NULL,
	plan_price DECIMAL(10,2) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.users (
	user_id INT(10) NOT NULL PRIMARY KEY,
	user_name VARCHAR(255) NOT NULL,
	age INT NOT NULL,
	plan_id INT NOT NULL,
	subscription_date DATE NOT NULL,
	FOREIGN KEY (plan_id) REFERENCES SpotifyClone.plans (plan_id)
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.singers (
	singer_id INT(10) NOT NULL PRIMARY KEY,
	singer_name VARCHAR(255) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.albums (
	album_id INT(10) NOT NULL PRIMARY KEY,
	album_name VARCHAR(255) NOT NULL,
	singer_id INT NOT NULL,
	release_year YEAR NOT NULL,
	FOREIGN KEY (singer_id) REFERENCES SpotifyClone.singers (singer_id)
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.songs (
	song_id INT(10) NOT NULL PRIMARY KEY,
	song_name VARCHAR(255) NOT NULL,
	duration_seconds INT NOT NULL,
	album_id INT NOT NULL,
	singer_id INT NOT NULL,
	FOREIGN KEY (album_id) REFERENCES SpotifyClone.albums (album_id),
	FOREIGN KEY (singer_id) REFERENCES SpotifyClone.singers (singer_id)
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.history (
	user_id INT NOT NULL,
	song_id INT NOT NULL,
	playback_datetime DATETIME NULL,
	CONSTRAINT PRIMARY KEY (user_id, song_id),
	FOREIGN KEY (user_id) REFERENCES SpotifyClone.users (user_id),
	FOREIGN KEY (song_id) REFERENCES SpotifyClone.songs (song_id)
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.following (
	user_id INT NOT NULL,
	singer_id INT NOT NULL,
	CONSTRAINT PRIMARY KEY (user_id, singer_id),
	FOREIGN KEY (user_id) REFERENCES SpotifyClone.users (user_id),
	FOREIGN KEY (singer_id) REFERENCES SpotifyClone.singers (singer_id)
) ENGINE = InnoDB;

INSERT INTO SpotifyClone.plans (plan_id, plan_type, plan_price)
VALUES
	(1, 'gratuito', 0.00),
	(2, 'familiar', 7.99),
	(3, 'universitário', 5.99),
	(4, 'pessoal', 6.99);

INSERT INTO SpotifyClone.users (user_id, user_name, age, subscription_date, plan_id)
VALUES
	(1, 'Barbara Liskov', 82, '2019-10-20', 1),
	(2, 'Robert Cecil Martin', 58, '2017-01-06', 1),
	(3, 'Ada Lovelace', 37, '2017-12-30', 2),
	(4, 'Martin Fowler', 46, '2017-01-17', 2),
	(5, 'Sandi Metz', 58, '2018-04-29', 2),
	(6, 'Paulo Freire', 19, '2018-02-14', 3),
	(7, 'Bell Hooks', 26, '2018-01-05', 3),
	(8, 'Christopher Alexander', 85, '2019-06-05', 4),
	(9, 'Judith Butler', 45, '2020-05-13', 4),
	(10, 'Jorge Amado', 58, '2017-02-17', 4);

INSERT INTO SpotifyClone.singers (singer_id, singer_name)
VALUES
	(1, 'Beyoncé'),
	(2, 'Queen'),
	(3, 'Elis Regina'),
	(4, 'Baco Exu do Blues'),
	(5, 'Blind Guardian'),
	(6, 'Nina Simone');

INSERT INTO SpotifyClone.albums (album_id, album_name, release_year, singer_id)
VALUES
	(1, 'Renaissance', 2022, 1),
	(2, 'Jazz', 1978, 2),
	(3, 'Hot Space', 1982, 2),
	(4, 'Falso Brilhante', 1998, 3),
	(5, 'Vento de Maio', 2001, 3),
	(6, 'QVVJFA?', 2003, 4),
	(7, 'Somewhere Far Beyond', 2007, 5),
	(8, 'I Put A Spell On You', 2012, 6);

INSERT INTO SpotifyClone.songs (song_id, song_name, duration_seconds, album_id, singer_id)
VALUES
	(1, 'Break My Soul', 279, 1, 1),
	(2, 'Virgo’s Groove', 369, 1, 1),
	(3, 'Alien Superstar', 116, 1, 1),
	(4, 'Don’t Stop Me Now', 203, 2, 2),
	(5, 'Under Pressure', 152, 3, 2),
	(6, 'Como Nossos Pais', 105, 4, 3),
	(7, 'O Medo de Amar é o Medo de Ser Livre', 207, 5, 3),
	(8, 'Samba em Paris', 267, 6, 4),
	(9, 'The Bard’s Song', 244, 7, 5),
	(10, 'Feeling Good', 100, 8, 6);

INSERT INTO SpotifyClone.history (user_id, song_id, playback_datetime)
VALUES
	(1, 8, '2022-02-28 10:45:55'),
	(1, 2, '2020-05-02 05:30:35'),
	(1, 10, '2020-03-06 11:22:33'),
	(2, 10, '2022-08-05 08:05:17'),
	(2, 7, '2020-01-02 07:40:33'),
	(3, 10, '2020-11-13 16:55:13'),
	(3, 2, '2020-12-05 18:38:30'),
	(4, 8, '2021-08-15 17:10:10'),
	(5, 8, '2022-01-09 01:44:33'),
	(5, 5, '2020-08-06 15:23:43'),
	(6, 7, '2017-01-24 00:31:17'),
	(6, 1, '2017-10-12 12:35:20'),
	(7, 4, '2011-12-15 22:30:49'),
	(8, 4, '2012-03-17 14:56:41'),
	(9, 9, '2022-02-24 21:14:22'),
	(10, 3, '2015-12-13 08:30:22');

INSERT INTO SpotifyClone.following (user_id, singer_id)
VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(2, 1),
	(2, 3),
	(3, 2),
	(4, 4),
	(5, 5),
	(5, 6),
	(6, 6),
	(6, 1),
	(7, 6),
	(9, 3),
	(10, 2);
