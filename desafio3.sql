SELECT
us.user_name AS usuario,
COUNT(DISTINCT hi.song_id) AS qt_de_musicas_ouvidas,
ROUND(SUM(so.duration_seconds) / 60, 2) AS total_minutos
FROM SpotifyClone.users AS us
INNER JOIN SpotifyClone.history AS hi
ON us.user_id = hi.user_id
INNER JOIN SpotifyClone.songs AS so
ON hi.song_id = so.song_id
GROUP BY usuario
ORDER BY usuario;
