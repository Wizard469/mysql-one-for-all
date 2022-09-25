SELECT
us.user_name AS usuario,
IF (YEAR(MAX(hi.playback_datetime)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS status_usuario
FROM SpotifyClone.users AS us
INNER JOIN SpotifyClone.history AS hi
ON us.user_id = hi.user_id
GROUP BY usuario
ORDER BY usuario;
