SELECT
so.song_name AS cancao,
COUNT(hi.song_id) AS reproducoes
FROM SpotifyClone.songs AS so
INNER JOIN SpotifyClone.history AS hi
ON so.song_id = hi.song_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;
