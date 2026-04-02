-- Questão 1

SELECT	*
	FROM Cliente;

-- Questão 2

SELECT	me.Nome as 'Nome',
		me.Preco as 'Preço'
	FROM Medicamento AS me;

-- Questão 3

SELECT	*
	FROM Entregador AS entr
	WHERE entr.Ativo = 1;

-- Questão 4

SELECT	*
	FROM Medicamento AS me
	WHERE me.Preco > 50.00;

-- Questão 5

SELECT	*
	FROM Medicamento AS me
	WHERE me.RequerReceita = 1;

-- Questão 6

SELECT	*
	FROM EnderecoCliente AS encl
	WHERE encl.Estado LIKE 'SP';

-- Questão 7

SELECT	*
	FROM Categoria;

-- Questão 8

SELECT	*
	FROM Entrega AS entg
	WHERE entg.StatusEntrega LIKE 'Aguardando';

-- Questão 9

SELECT	*
	FROM Medicamento AS me
	WHERE me.QuantidadeEstoque < 10;

-- Questão 10

SELECT	*
	FROM Venda AS ve
	WHERE ve.ValorTotal > 100.00;

-- Questão 11

SELECT	*
	FROM Fabricante AS fa
	ORDER BY fa.Nome DESC;

-- Questão 12

SELECT	TOP 5
		*
	FROM Medicamento AS me
	ORDER BY me.Preco DESC;

-- Questão 13

SELECT	TOP 10
		*
	FROM Cliente AS cl
	ORDER BY cl.DataCadastro DESC;

-- Questão 14

SELECT	*
	FROM EnderecoCliente AS encl
	WHERE encl.Logradouro LIKE 'Rua%';

-- Questão 15

SELECT	*
	FROM Venda AS ve
	WHERE ve.StatusVenda Like 'Cancelada';

-- Questão 16

SELECT	cl.Telefone as 'Telefone',
		cl.Email as 'E-mail',
		encl.Cidade as 'Estado'
	FROM Cliente AS cl
		INNER JOIN EnderecoCliente AS encl
			ON cl.Id = encl.IdCliente
	WHERE encl.Cidade LIKE 'São Paulo';

-- Questão 17

SELECT	*
	FROM Medicamento AS me
	WHERE me.Nome LIKE '%Gota%';

-- Questão 18

SELECT	*
	FROM TipoPagamento;

-- Questão 19

SELECT	*
	FROM Entregador AS entr
	ORDER BY entr.Nome ASC;

-- Questão 20

SELECT	*
	FROM Entrega AS entg
	WHERE CAST(entg.PrevisaoChegada AS DATE) <> CAST(GETDATE() AS DATE);

-- Questão 21

SELECT	TOP 3
		*
	From Medicamento AS me
	WHERE me.QuantidadeEstoque > 0
	ORDER BY me.QuantidadeEstoque ASC;

-- Questão 22

SELECT	*
	FROM Pagamento AS pa
	WHERE pa.Valor > 200.00;

-- Questão 23

SELECT	entr.Cnh as 'CNH',
		entr.PlacaVeiculo as 'Placa'
	FROM Entregador AS entr;

-- Questão 24

SELECT	cl.Nome as 'Cliente',
		encl.Bairro as 'Bairro Cliente'
	FROM Cliente AS cl
		INNER JOIN EnderecoCliente AS encl
			ON cl.Id = encl.IdCliente
	WHERE encl.Bairro LIKE 'Mooca';

-- Questão 25

SELECT	*
	FROM Entrega AS entg
	WHERE entg.StatusPrazo LIKE 'Fora do Prazo';

SELECT	*
	FROM Entrega AS entg
	WHERE entg.StatusPrazo LIKE 'Atrasado';

-- Questão 26

SELECT	COUNT(*) as 'Total de clientes'
	FROM Cliente;

-- Questão 27

SELECT	 SUM(Valor) as 'Valor total'
	FROM Pagamento;

-- Questão 28

SELECT	ROUND(AVG(Preco), 2) as 'Valor médio'
	FROM Medicamento;

-- Questão 29

SELECT	COUNT(CASE 
				  WHEN me.RequerReceita = 1 THEN 1
			  END) as 'Requerem Receita',
		COUNT(CASE
				  WHEN me.RequerReceita = 0 THEN 1
			  END) as 'Não Requerem Receita'
	FROM Medicamento AS me;

-- Questão 30

SELECT	MIN(me.Preco) as 'Menor valor',
		MAX(me.Preco) as 'Maior valor'
	FROM Medicamento AS me;

-- Questão 31 

SELECT	COUNT(ve.StatusVenda) as 'Vendas Concluídas'
	FROM Venda AS ve
	WHERE ve.StatusVenda LIKE 'Concluída';

-- Questão 32

SELECT	cl.Nome as 'Cliente',
		COUNT(ven.Id) as 'Compra(s) Realizada(s)'
	FROM Venda AS ven
		INNER JOIN Cliente AS cl
			ON cl.Id = ven.IdCliente
	GROUP BY cl.Nome
	ORDER BY COUNT(ven.Id) ASC;

-- Questão 33

SELECT	tppa.Nome as 'Tipo de pagamento',
		SUM(pa.Valor) as 'Valor Total'
	FROM Pagamento AS pa
		INNER JOIN TipoPagamento AS tppa
			ON tppa.Id = pa.IdTipoPagamento
	GROUP BY tppa.Nome;

-- Questão 34

SELECT	entr.Nome as 'Entregador',
		COUNT(entg.IdVenda) as 'Quantidade de Vendas'
	FROM Entrega AS entg
		INNER JOIN Entregador AS entr
			ON entg.IdEntregador = entr.Id
	GROUP BY entr.Nome;

-- Questão 35

SELECT	ca.Nome as 'Categoria',
		COUNT(me.Id) as 'Quantidade'
	FROM Medicamento AS me
		INNER JOIN Categoria AS ca
			ON me.IdCategoria = ca.Id
	GROUP BY ca.Nome
	HAVING COUNT(me.Id) > 10;

-- Questão 36

SELECT	fa.Nome as 'Fabricante',
		SUM(me.QuantidadeEstoque) as 'Quantidade Em Estoque'
	FROM Medicamento AS me
		INNER JOIN Fabricante AS fa
			ON me.IdFabricante = fa.Id
	GROUP BY fa.Nome;

-- Questão 37

SELECT	cl.Nome as 'Cliente',
		ROUND(AVG(ve.ValorTotal), 2) as 'Valor Médio'
	FROM Venda AS ve
		INNER JOIN Cliente AS cl
			ON ve.IdCliente = cl.Id
	GROUP BY cl.Nome;

-- Questão 38

SELECT	entr.Nome as 'Entregador',
		COUNT(entg.Id) as 'Entregas'
	FROM Entrega AS entg
		INNER JOIN Entregador AS entr
			ON entg.IdEntregador = entr.Id
	GROUP BY entr.Nome
	HAVING COUNT(entg.Id) >= 5;

-- Questão 39

SELECT	ca.Nome as 'Categoria',
		COUNT(CASE
				  WHEN me.QuantidadeEstoque < 50 THEN 1
			  END) as 'Medicamentos Com Estoque Menor Que 50'
	FROM Medicamento AS me
		INNER JOIN Categoria AS ca
			ON me.IdCategoria = ca.Id
	GROUP BY ca.Nome
	HAVING COUNT(CASE
				  WHEN me.QuantidadeEstoque < 50 THEN 1
			  END) > 0;

-- Questão 40

SELECT	CAST(ve.DataHora AS DATE) as 'Data da Venda',
		SUM(ve.ValorTotal) as 'Valor Total do Dia'
	FROM Venda AS ve
	GROUP BY CAST(ve.DataHora AS DATE);
