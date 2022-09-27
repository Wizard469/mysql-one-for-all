SELECT
song_name AS nome_musica,
CASE
  WHEN song_name = 'The Bard’s Song' THEN REPLACE(song_name, 'Bard', 'QA')
  WHEN song_name = 'O Medo de Amar é o Medo de Ser Livre' THEN REPLACE(song_name, 'Amar', 'Code Review')
  WHEN song_name = 'Como Nossos Pais' THEN REPLACE(song_name, 'Pais', 'Pull Requests')
  WHEN song_name = 'BREAK MY SOUL' THEN REPLACE(song_name, 'SOUL', 'CODE')
  WHEN song_name = 'ALIEN SUPERSTAR' THEN REPLACE(song_name, 'SUPERSTAR', 'SUPERDEV')
END AS novo_nome
FROM SpotifyClone.songs
WHERE song_name IN (
  'The Bard’s Song',
  'O Medo de Amar é o Medo de Ser Livre',
  'Como Nossos Pais',
  'BREAK MY SOUL',
  'ALIEN SUPERSTAR'
)
ORDER BY nome_musica DESC;
