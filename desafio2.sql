SELECT
COUNT(so.song_id) AS cancoes,
COUNT(DISTINCT si.singer_id) AS artistas,
COUNT(DISTINCT al.album_id) AS albuns
FROM SpotifyClone.songs AS so
INNER JOIN SpotifyClone.albums AS al
ON al.album_id = so.album_id
INNER JOIN SpotifyClone.singers AS si
ON al.singer_id = si.singer_id;
