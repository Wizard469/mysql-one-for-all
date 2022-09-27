SELECT 
	COUNT(*) AS quantidade_musicas_no_historico
FROM
	SpotifyClone.users AS us
	INNER JOIN SpotifyClone.history AS hi ON us.user_id = hi.user_id
WHERE
	us.user_name = 'Barbara Liskov';
