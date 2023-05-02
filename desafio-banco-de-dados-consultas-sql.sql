-- 01 Buscar o nome e ano dos filmes
SELECT a.Nome, a.Ano FROM Filmes a;

-- 02 Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
SELECT a.Nome, a.Ano, a.Duracao FROM Filmes a ORDER BY a.Ano ASC;

-- 03 Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração
SELECT a.Nome, a.Ano, a.Duracao FROM Filmes a 
WHERE a.Nome LIKE '%De Volta para o Futuro%'
AND a.Ano = 1985
AND a.Duracao = 116;

-- 04 Buscar os filmes lançados em 1997
SELECT a.Nome, a.Ano, a.Duracao FROM Filmes a 
WHERE a.Ano = 1997;

-- 05 Buscar os filmes lançados APÓS o ano 2000
SELECT a.Nome, a.Ano, a.Duracao FROM Filmes a 
WHERE a.Ano > 2000;

-- 06 Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente
SELECT a.Nome, a.Ano, a.Duracao FROM Filmes a 
WHERE a.Duracao > 100 AND a.Duracao < 150
ORDER BY a.Duracao ASC;

-- 07 Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duração em ordem decrescente.
SELECT a.Ano,
COUNT(*) AS Quantidade FROM Filmes a
GROUP BY a.Ano
ORDER BY Quantidade DESC;

-- 08 Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome
SELECT a.Id, a.PrimeiroNome, a.UltimoNome, a.Genero
  FROM Atores a
  WHERE a.Genero = 'M';

-- 09 Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome
SELECT a.Id, a.PrimeiroNome, a.UltimoNome, a.Genero
  FROM Atores a
  WHERE a.Genero = 'F'
  ORDER BY a.PrimeiroNome;

-- 10 Buscar o nome do filme e o gênero
SELECT a.Nome, c.Genero
  FROM Filmes a
  INNER JOIN FilmesGenero b ON b.IdFilme = a.Id
  INNER JOIN Generos c on c.Id = b.IdGenero;

-- 11 Buscar o nome do filme e o gênero do tipo "Mistério"
SELECT a.Nome, c.Genero
  FROM Filmes a
  INNER JOIN FilmesGenero b ON b.IdFilme = a.Id
  INNER JOIN Generos c on c.Id = b.IdGenero
  WHERE c.Genero LIKE '%Mistério%'; 

-- 12 Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
SELECT a.Nome, c.PrimeiroNome, c.UltimoNome, b.Papel
  FROM Filmes a
  INNER JOIN ElencoFilme b ON b.IdFilme = a.Id
  INNER JOIN Atores c ON c.Id = b.IdAtor