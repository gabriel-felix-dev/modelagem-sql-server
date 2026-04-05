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

-- Questão 41

SELECT	encl.Estado as 'Estado',
		COUNT(encl.IdCliente) as 'Quantidade de Clientes'
	FROM EnderecoCliente AS encl
	GROUP BY encl.Estado
	ORDER BY encl.Estado DESC;

-- Questão 42

SELECT	DATENAME(WEEKDAY, ve.DataHora) as 'Dia da Semana',
		COUNT(ve.Id) as 'Quantidade de venda'
	FROM Venda AS ve
	GROUP BY DATENAME(WEEKDAY, ve.DataHora)
	HAVING COUNT(ve.Id) > 50;

-- Questão 43

SELECT	cl.Nome as 'Cliente',
		MAX(ve.ValorTotal) as 'Maior Venda'
	FROM Venda AS ve
		INNER JOIN Cliente AS cl
			ON cl.Id = ve.IdCliente
	GROUP BY cl.Nome; 

-- Questões 44

SELECT	me.Nome as 'Medicamento',
		SUM(veme.Quantidade) as 'Quantidade'
	FROM VendaMedicamento AS veme
		INNER JOIN Medicamento AS me
			ON me.Id = veme.IdMedicamento
	GROUP BY me.Nome;

-- Questão 45
	
SELECT	CONVERT(VARCHAR(8), ve.DataHora, 108) as 'Hora da venda',
		COUNT(ve.Id) as 'Quantidade de Vendas Pendentes'
	FROM Venda AS ve
	WHERE ve.StatusVenda LIKE 'Pendente'
	GROUP BY CONVERT(VARCHAR(8), ve.DataHora, 108);

-- Questão 46

SELECT	ROUND(AVG(ve.ValorTotal),2) as 'Valor Médio de Todas as Compras'
	FROM Venda AS ve;

-- Questão 47

SELECT	COUNT(CASE
                  WHEN entg.StatusPrazo = 'Atrasado' THEN 1
			  END) as 'Fora do prazo',
		COUNT(CASE
				  WHEN entg.StatusPrazo = 'No Prazo' THEN 1
			  END) as 'Dentro do prazo'
	FROM Entrega AS entg;

-- Questão 48

SELECT	fa.Nome as 'Fabricante',
		ROUND(AVG(me.Preco), 2) as 'Preço médio'
	FROM Medicamento AS me
		INNER JOIN Fabricante AS fa
			ON fa.Id = me.IdFabricante
	GROUP BY fa.Nome;

-- Questão 49

SELECT	CONVERT(VARCHAR(8), pa.DataHora, 108) as 'Horário de pagamento',
		COUNT(pa.Id) as 'Quantidade de pagamentos'
	FROM Pagamento AS pa
	GROUP BY CONVERT(VARCHAR(8), pa.DataHora, 108);

-- Questão 50

SELECT	vema.IdVenda as 'Código da Venda',
		SUM(vema.Quantidade) as 'Quantidade de Produtos'
	FROM VendaMedicamento AS vema
	GROUP BY vema.IdVenda
	ORDER BY 'Quantidade de Produtos' DESC;

-- Questão 51

SELECT	me.Nome as 'Medicamento',
		ca.Nome as 'Categoria'
	FROM Medicamento AS me
		INNER JOIN Categoria AS ca
			ON me.IdCategoria = ca.Id;

-- Questão 52

SELECT	me.Nome as 'Medicamento',
		fa.Nome as 'Fabricante'
	FROM Medicamento AS me
		INNER JOIN Fabricante AS fa
			ON me.IdFabricante = fa.Id;

-- Questão 53

SELECT	me.Nome as 'Medicamento',
		ca.Nome as 'Categoria'
	FROM Medicamento AS me
		LEFT JOIN Categoria AS ca
			ON me.IdCategoria = ca.Id;

-- Questão 54

SELECT	cl.Nome as 'Cliente',
		cl.Cpf as 'CPF',
		ve.Id as 'Código da Venda',
		ve.DataHora as 'Data e Hora da Compra'
	FROM Venda AS ve
		INNER JOIN Cliente AS cl
			ON ve.IdCliente = cl.Id;

-- Questão 55

SELECT	ve.Id as 'Código da Venda',	
		SUM(pa.Valor) as 'Valor da compra',
		tipa.Nome as 'Tipo de Pagamento'
	FROM Pagamento AS pa
		INNER JOIN Venda AS ve
			ON pa.IdVenda = ve.Id
		INNER JOIN TipoPagamento AS tipa
			ON pa.IdTipoPagamento = tipa.Id
	GROUP BY ve.Id, tipa.Nome
	ORDER BY ve.Id ASC;

-- Questão 56

SELECT	entr.Nome as 'Entregador',
		entr.PlacaVeiculo as 'Placa Veículo',
		entg.PrevisaoChegada as 'Previsão de entrega'
	FROM Entrega AS entg
		INNER JOIN Entregador AS entr
			ON entg.IdEntregador = entr.Id;

-- Questão 57

SELECT	cl.Nome as 'Cliente',
		ve.ValorTotal as 'Total Venda',
		ve.DataHora as 'Data e Hora'
	FROM Venda AS ve
		INNER JOIN Cliente AS cl
			ON ve.IdCliente = cl.Id;

-- QUestão 58

SELECT	me.Nome as 'Medicamento'
	FROM VendaMedicamento AS veme
		INNER JOIN Medicamento AS me
			ON veme.IdMedicamento = me.Id
	WHERE veme.IdVenda = 2;

-- Questão 59

SELECT	cl.Nome as 'Cliente',
		pa.Valor as 'Valor Pago'
	FROM Pagamento AS pa
		INNER JOIN Venda AS ve
			ON ve.Id = pa.IdVenda
		INNER JOIN Cliente AS cl
			ON cl.Id = ve.IdCliente;

-- Questão 60

SELECT	ve.Id as 'Código da Venda',
		cl.Nome as 'Cliente',
		encl.Logradouro as 'Logradouro'
	FROM Entrega AS entg
		INNER JOIN Venda AS ve
			ON entg.IdVenda = ve.Id
		INNER JOIN Cliente AS cl
			ON ve.IdCliente = cl.Id
		INNER JOIN EnderecoCliente AS encl
			ON ve.IdEnderecoCliente = encl.Id;
		
-- Questão 61

SELECT	cl.Nome as 'Cliente',
		ve.Id as 'Código da Venda'
	FROM Cliente AS cl
		LEFT JOIN Venda AS ve
			ON cl.Id = ve.IdCliente
	ORDER BY ve.Id ASC;

-- Questão 62

SELECT	me.Nome as 'Medicamento',
		veme.IdVenda as 'Código da Venda'
	FROM Medicamento AS me
		LEFT JOIN VendaMedicamento AS veme
			ON veme.IdMedicamento = me.Id;

-- Questão 63

SELECT	ca.Nome as 'Categoria',
		me.Nome as 'Medicamento'
	FROM Categoria AS ca
		LEFT JOIN Medicamento AS me
			ON me.IdCategoria = ca.Id;

-- Questão 64

SELECT	entr.Nome as 'Entregador',
		entg.Id as 'Códgio entrega'
	FROM Entregador AS entr
		LEFT JOIN Entrega AS entg
			ON entr.Id = entg.IdEntregador
	ORDER BY IdEntregador ASC;

-- Questão 65

SELECT	cl.Nome as 'Cliente',
		me.Nome as 'Medicamento',
		fa.Nome as 'Fabricante',
		SUM(veme.Quantidade * veme.PrecoUnitario) as 'Valor Faturado'
	FROM CLiente AS cl
		INNER JOIN Venda AS ve
			ON ve.IdCliente = cl.Id
		INNER JOIN VendaMedicamento AS veme
			ON veme.IdVenda = ve.Id
		INNER JOIN Medicamento AS me
			ON me.Id = veme.IdMedicamento
		INNER JOIN Fabricante AS fa
			ON me.IdFabricante = fa.Id
	GROUP BY cl.Nome ,me.Nome,fa.Nome 
	ORDER BY 1 ASC;

-- Questão 66

SELECT	me.Nome as 'Medicamento',
		fa.Nome as 'Fabricante',
		ca.Nome as 'Categoria'
	FROM Medicamento AS me
		INNER JOIN Fabricante AS fa
			ON me.IdFabricante = fa.Id
		INNER JOIN Categoria AS ca
			ON me.IdCategoria = ca.Id
	WHERE ca.Nome LIKE 'Analgésicos e Antitérmicos';

-- Questão 67

SELECT	entr.Nome as 'Nome Entregador',
		cl.Nome as 'Nome Cliente'
	FROM Entregador AS entr
		INNER JOIN Entrega AS entg
			ON entr.Id = entg.IdEntregador
		INNER JOIN Venda AS ve
			ON ve.Id = entg.IdVenda
		INNER JOIN Cliente AS cl
			ON cl.Id = ve.IdCliente
	WHERE cl.Nome LIKE entr.Nome
	ORDER BY 1, 2 ASC;

-- Questão 68

SELECT	cl.Nome as 'Cliente',
		encl.Logradouro as 'Logradouro',
		COUNT(ve.Id) as 'Total de Vendas'
	FROM EnderecoCliente AS encl
		INNER JOIN Cliente AS cl
			ON cl.Id = encl.IdCliente
		INNER JOIN Venda AS ve
			ON ve.IdCliente = cl.Id
	WHERE Logradouro LIKE 'Rua Roberto Souza'
	GROUP BY cl.Nome, encl.Logradouro;

-- Questão 69

SELECT	cl.Nome as 'Cliente',
		entr.Nome as 'Entregador',
		ve.ValorTotal as 'Valor Total',
		entg.DataHoraSaida as 'Data de Saída',
		entg.PrevisaoChegada as 'Previsão de hegada',
		entg.DataHoraEntrega as 'Data de entrega',
		entg.StatusEntrega as 'Status Entrega',
		entg.StatusPrazo as 'Status do Prazo'
	FROM Entregador AS entr
		INNER JOIN Entrega AS entg
			ON entg.IdEntregador = entr.Id	
		INNER JOIN Venda AS ve
			ON ve.Id = entg.IdVenda
		INNER JOIN Cliente AS cl
			ON ve.IdCliente = cl.Id
	WHERE entg.StatusPrazo = 'Atrasado';

-- Questão 70

SELECT	cl.Nome as 'Cliente',
		encl.Estado as 'Estado',
		tipa.Nome as 'Tipo de Pagamento',
		COUNT(pa.Id) as 'Quantidade de Pagamentos Realizados'
	FROM Pagamento AS pa
		INNER JOIN TipoPagamento AS tipa
			ON pa.IdTipoPagamento = tipa.Id
		INNER JOIN Venda AS ve
			ON ve.Id = pa.IdVenda
		INNER JOIN Cliente AS cl
			ON cl.Id = ve.IdCliente
		INNER JOIN EnderecoCliente	AS encl
			ON encl.IdCliente = cl.Id
		GROUP BY cl.Nome, encl.Estado, tipa.Nome
		ORDER BY 1 ASC;

-- Questão 71

SELECT	fa.Nome as 'Fabricante',
		me.Nome as 'Produto',
		SUM(veme.Quantidade) as 'Quantidade Vendidos'
	FROM Fabricante AS fa
		INNER JOIN Medicamento AS me
			ON me.IdFabricante = fa.Id
		INNER JOIN VendaMedicamento AS veme
			ON veme.IdMedicamento = me.Id
	GROUP BY fa.Nome, me.Nome
	ORDER BY 1 ASC;

-- Questão 72

SELECT	ve.Id as 'Código da Venda',
		entg.DataHoraSaida as 'Data de Saída',
		entg.PrevisaoChegada as 'Previsão de Chegada',
		entg.DataHoraEntrega as 'Data de Entrega',
		entg.StatusEntrega as 'Status da Entrega',
		entg.StatusPrazo as 'Status do Prazo'
	FROM Entrega AS entg
		RIGHT JOIN Venda AS ve
			ON entg.IdVenda = ve.Id;

-- Questão 73

SELECT	cl.Nome as 'Cliente',
		ve.Id as 'Código da Venda',
		ve.ValorTotal as 'Valor da Venda',
		ve.StatusVenda as 'Status da Venda',
		entr.Nome as 'Entregador Responsável',
		entg.DataHoraSaida as 'Data de Saída',
		entg.PrevisaoChegada as 'Previsão de Chegada',
		entg.DataHoraEntrega as 'Data de Entrega',
		entg.StatusEntrega as 'Status da Entrega',
		entg.StatusPrazo as 'Status do Prazo'
	FROM Cliente AS cl
		INNER JOIN Venda AS ve
			ON ve.IdCliente = cl.Id
		INNER JOIN Entrega AS entg
			ON entg.IdVenda = ve.ID
		INNER JOIN Entregador AS entr
			ON entg.IdEntregador = entr.Id
	ORDER BY 1 ASC;

-- Questão 74

SELECT	entr.Nome as 'Entregador',
		me.Nome as 'Produtos Transportados'
	FROM Entrega AS entg
		INNER JOIN Entregador AS entr
			ON entg.IdEntregador = entr.Id
		INNER JOIN Venda AS ve
			ON entg.IdVenda = ve.Id	
		INNER JOIN VendaMedicamento AS veme
			ON veme.IdVenda = ve.Id
		INNER JOIN Medicamento AS me
			ON me.Id = veme.IdMedicamento;
			
-- Questão 75

SELECT	DISTINCT me.Nome as 'Medicamento',
		veme.NumeroReceita as 'Número da Receita'
	FROM Medicamento AS me
		INNER JOIN VendaMedicamento AS veme
			ON veme.IdMedicamento = me.Id
	WHERE me.RequerReceita = 1 AND
		veme.NumeroReceita IS NOT NULL
	ORDER BY 1 ASC;

-- Questão 76

SELECT	me.Nome as 'Medicamento',
		me.Preco as 'Valores acima da média'
	FROM Medicamento AS me,
	(SELECT	AVG(md.Preco) as 'Preco Médio'
		FROM Medicamento AS md) as Subconsulta
	WHERE me.Preco > Subconsulta.[Preco Médio];

-- Questão 77

SELECT	cl.Nome as 'Cliente',
		cl.Cpf as 'CPF',
		(SELECT	MAX(ve.ValorTotal) as 'Valor Máximo'
			FROM Venda AS ve
			WHERE ve.IdCliente = cl.Id) as 'Maior Valor'
	FROM Cliente AS cl
	ORDER BY [Maior Valor] DESC;

-- Questão 78

SELECT	me.Nome as 'Medicamento',
		me.Preco as 'Preço Unitário',
		CASE
			WHEN me.Preco > 100.00 THEN 'Especial'
			WHEN me.Preco >= 40.00 THEN 'Moderado'
			ELSE 'Popular'
		END as 'Classificação'
	FROM Medicamento AS me
	ORDER BY 3 ASC;

-- Questão 79

SELECT	entr.Nome as 'Entregador',
		(SELECT	COUNT(CASE
						  WHEN entg.StatusPrazo = 'Atrasado' THEN 1
					  END) as 'Quantidade de Atraso'
			FROM Entrega AS entg
			WHERE entg.IdEntregador = entr.Id) as 'Quantidade de entregas atrasadas'
	FROM Entregador AS entr
	ORDER BY 2 DESC;

SELECT	entr.Nome as 'Entregador',
		(SELECT	COUNT(CASE
						  WHEN DATEDIFF(MINUTE, PrevisaoChegada, DataHoraEntrega)/60.0 > 0 THEN 1
					  END) as 'Quantidade de Atraso'
			FROM Entrega AS entg
			WHERE entg.IdEntregador = entr.Id) as 'Quantidade de entregas atrasadas'
	FROM Entregador AS entr
	ORDER BY 2 DESC;

-- Questão 80

SELECT	cl.Nome as 'Cliente',
		COUNT(ve.id) as 'Quantidade de compras',
		CASE
			WHEN COUNT(ve.id) > 5 THEN 'VIP'
			WHEN COUNT(ve.id) >= 2 THEN 'Fiel'
			ELSE 'Novo'
		END as 'Tier'
	FROM Cliente AS cl
		INNER JOIN Venda AS ve
			ON cl.Id = ve.IdCliente
	GROUP BY cl.Nome
	ORDER BY 2 DESC;

-- Questão 81

SELECT	me.Nome as 'Medicamento',
		fa.Nome as 'Fabricante'
	FROM Medicamento AS me
		INNER JOIN Fabricante AS fa
			ON me.IdFabricante = fa.Id
	WHERE me.IdFabricante IN (SELECT	fa.Id
								  FROM Fabricante AS fa
								  WHERE fa.Nome LIKE 'A%');

-- Questão 82

SELECT	cl.Nome as 'Cliente',
		cl.Cpf  as 'CPF',
		me.Nome as 'Produto',
		me.RequerReceita as 'Precisa de Receita',
		ve.ValorTotal as 'Valor Total',
		ve.DataHora as 'Data e Hora',
		ve.StatusVenda as 'Status'
	FROM Cliente AS cl
		INNER JOIN Venda AS ve
			ON cl.Id = ve.IdCliente
		INNER JOIN VendaMedicamento AS veme
			ON ve.Id = veme.IdVenda
		INNER JOIN Medicamento AS me
			ON me.Id = veme.IdMedicamento
	WHERE NOT EXISTS(SELECT	1
						FROM Medicamento AS me
						WHERE me.RequerReceita = 1);
