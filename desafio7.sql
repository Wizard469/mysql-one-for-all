SELECT
	si.singer_name AS artista,
	al.album_name AS album,
	COUNT(fo.user_id) AS seguidores
FROM
	SpotifyClone.singers AS si
	INNER JOIN SpotifyClone.albums AS al ON si.singer_id = al.singer_id
	INNER JOIN SpotifyClone.following AS fo ON al.singer_id = fo.singer_id
GROUP BY
	album,
	artista
ORDER BY
	seguidores DESC,
	artista,
	album;
