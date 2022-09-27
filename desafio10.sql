SELECT
	song_name AS nome,
	COUNT(playback_datetime) AS reproducoes
FROM
	SpotifyClone.history AS hi
	INNER JOIN SpotifyClone.songs AS so ON so.song_id = hi.song_id
	INNER JOIN SpotifyClone.users AS us ON us.user_id = hi.user_id
	INNER JOIN SpotifyClone.plans AS pl ON us.plan_id = pl.plan_id
GROUP BY
	nome,
	pl.plan_type
HAVING
	pl.plan_type = 'gratuito'
	OR pl.plan_type = 'pessoal'
ORDER BY
	nome;
