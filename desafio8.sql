SELECT
	si.singer_name AS artista,
	al.album_name AS album
FROM
	SpotifyClone.singers AS si
	INNER JOIN SpotifyClone.albums AS al ON si.singer_id = al.singer_id
WHERE
	si.singer_name = 'Elis Regina'
ORDER BY
	album;
