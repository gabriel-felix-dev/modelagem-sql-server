SELECT	TOP 5
		pr.Nome as 'Produto',
		pr.Categoria as 'Categoria',
		vepr.Quantidade as 'Quantidade Vendida'
	FROM Produto AS pr
		INNER JOIN VendaProduto AS vepr
			ON pr.Id = vepr.IdProduto
	ORDER BY 'Quantidade Vendida' DESC;


SELECT	fo.NomeFantasia as 'Fornecedor',
		COUNT(pr.IdFornecedor) as 'Quantidade de produtos'
	FROM Fornecedor AS fo
		INNER JOIN Produto AS pr
			ON pr.IdFornecedor = fo.Id
	GROUP BY fo.NomeFantasia
	HAVING COUNT(pr.IdFornecedor) > 2
	ORDER BY fo.NomeFantasia ASC;

SELECT	pr.Categoria as 'Categoria',
		fo.NomeFantasia as 'Fornecedor',
		COUNT(pr.IdFornecedor) as 'Quantidade de produtos'
	FROM Produto AS pr
		INNER JOIN Fornecedor AS fo
			ON fo.Id = pr.IdFornecedor 
	WHERE COUNT(pr.IdFornecedor) AND COUNT(fo.Id)> 2
	GROUP BY pr.Categoria, fo.NomeFantasia
	ORDER BY pr.Categoria ASC;