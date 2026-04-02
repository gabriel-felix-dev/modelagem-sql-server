# 100 Questões Práticas DQL - Farmácia Delivery

Este arquivo contém 100 perguntas baseadas na modelagem do banco de dados `FarmaciaDelivery`, divididas por níveis de complexidade. Destina-se ao aperfeiçoamento de estagiários na construção de queries (SQL).

## Nível Básico (25 questões)
*(Foco: SELECT simples, manipulação de texto, numéricos, WHERE, ORDER BY, TOP)*

1. Selecione todos os registros de clientes cadastrados no sistema.
2. Liste nome e preço de todos os medicamentos disponíveis.
3. Busque os dados dos entregadores que estão com o status "Ativo" no sistema (`Ativo = 1`).
4. Selecione os medicamentos cujos preços são maiores do que R$ 50,00.
5. Liste todos os medicamentos que requerem receita médica (`RequerReceita = 1`).
6. Busque todos os clientes do estado de 'SP'.
7. Selecione as categorias de medicamentos cadastradas.
8. Liste todas as entregas com status 'Aguardando'.
9. Verifique os medicamentos em estoque cujo volume de unidades é inferior a 10.
10. Busque todas as vendas realizadas onde o valor total excedeu R$ 100,00.
11. Liste os fabricantes ordenados em ordem alfabética inversa (Z-A).
12. Use o `TOP 5` para listar os medicamentos mais caros.
13. Selecione os 10 últimos clientes a terem se cadastrado (ordene pela Data de Cadastro de forma decrescente).
14. Liste clientes cujo logradouro contenha a palavra "Rua".
15. Selecione as compras (Venda) em que o status não seja 'Cancelada'.
16. Busque os telefones e e-mails dos clientes da cidade de 'São Paulo'.
17. Liste nomes dos medicamentos que têm a palavra "Gota" no nome.
18. Selecione as tabelas de `TipoPagamento` existentes no sistema.
19. Busque os entregadores ordenados pelo nome.
20. Liste as entregas onde a previsão da chegada não é o dia de hoje.
21. Selecione os três medicamentos com menos quantidade em estoque (acima de zero).
22. Retorne o histórico de pagamentos superior a R$ 200,00.
23. Busque a placa dos veículos dos entregadores e seu registro CNH.
24. Liste os clientes de bairros que se chamem "Mooca".
25. Busque na base as entregas que atualizaram o `StatusPrazo` para 'Fora do Prazo'.

## Nível Intermediário (25 questões)
*(Foco: Agrupamentos, GROUP BY, Funções de Agregação como COUNT/SUM/AVG/MAX/MIN, HAVING)*

26. Conte o número absoluto de clientes cadastrados no sistema inteiro.
27. Calcule a soma de todos os pagamentos capturados no banco de dados.
28. Verifique o preço médio dos medicamentos disponíveis na farmácia.
29. Agrupe e obtenha a contagem de medicamentos para cada estado de `RequerReceita` (1 e 0).
30. Determine o menor (`MIN`) e o maior (`MAX`) preço listado em produtos.
31. Conte quantas vendas finalizaram pagas separando a contagem pelo `StatusVenda`.
32. Liste a quantidade total de vendas (`IdVenda`) realizadas por cada Cliente (`IdCliente`).
33. Some o valor arrecadado (`Valor`) agrupando pelo método de pagamento (`IdTipoPagamento`).
34. Conte quantas entregas cada entregador já assumiu.
35. Mostre as categorias de produtos (`IdCategoria`) que possuem mais de 10 produtos associados usando `HAVING`.
36. Calcule o volume todo em estoque (SUM de `QuantidadeEstoque`) por Fabricante (`IdFabricante`).
37. Mostre o valor gasto médio feito nas compras agrupado pelo `IdCliente`.
38. Identifique apenas entregadores que possuam ao mínimo 5 entregas registradas via `HAVING`.
39. Conte o número de remédios cujo estoque seja inferior a 50 unidades, sub-agrupados por categoria.
40. Use `GROUP BY` pela data de Venda (despreze a hora) somando o valor total daquele dia.
41. Liste os top estados com a maior contagem de clientes.
42. Descubra os dias nos quais a quantidade de pedidos excedeu a marca de 50 pedidos usando `HAVING`.
43. Determine o registro de pedido financeiro mais caro fechado no e-commerce agrupado por cliente.
44. Qual a soma total de itens (`Quantidade`) na tabela `VendaMedicamento` de acordo com cada `IdMedicamento`.
45. Quantifique as vendas que encontram-se 'Pendente' agrupando-as pela hora do relógio da venda.
46. Calcule o `ValorTotal` médio de compras da tabela de Vendas.
47. Resuma os despachos (tabela Entrega) separados em Dentro do Prazo e Fora do Prazo (`StatusPrazo`).
48. Estime a diferença média de preços entre fabricantes agrupando pela chave `IdFabricante`.
49. Agrupe as transações na tabela de pagamento observando o horário específico.
50. Identifique qual `IdVenda` recebeu a maior somatória quantitativa de caixas de medicamentos (`Quantidade`).

## Nível Avançado (25 questões)
*(Foco: JOINs com múltiplas tabelas, INNER, LEFT, RIGHT)*

51. Traga nome e categoria do medicamento iterando a tabela `Medicamento` e `Categoria`.
52. Relacione cada remédio com o nome oficial de seu Fabricante usando um `INNER JOIN`.
53. Liste os produtos e traga via `LEFT JOIN` a respectiva Categoria, garantindo resultados mesmo se houver produtos órfãos.
54. Mostre as compras (`IdVenda`, `DataHora`) associadas ao nome e CPF do Cliente.
55. Una as tabelas Venda, Pagamento e TipoPagamento para listar vendas com valores pagos e método usado em texto.
56. Conecte Entregadores as suas respectivas Entregas e retorne seus nomes, placa e com as datas das previsões.
57. Busque os nomes dos clientes junto à relação das vendas já feitas, omitindo clientes que nunca compraram (INNER JOIN).
58. Liste os itens adquiridos no pedido de `IdVenda = 1` evidenciando o respectivo nome de cada medicamento adquirido.
59. Liste todos pagamentos mostrando no resultado qual foi o nome do cliente que efetuou a compra associada a paguele pagamento.
60. Relacione e cruze a localização da Entrega (trazendo logradouro destino do Cliente da Venda respectiva).
61. Empregue `LEFT JOIN` para puxar os Clientes que até então não dispõem de venda gerada. 
62. Busque por Medicamentos nunca comercializados utilizando `LEFT JOIN` com foco na tabela `VendaMedicamento`.
63. Relacione e cruze categorias sem qualquer medicamento para verificar necessidades de catálogo novo usando Join adequado.
64. Apresente `LEFT/RIGHT JOIN` cruzando entregadores e entregas para evidenciar quem são motoristas desocupados.
65. Mostre faturas minuciosas formatando o Cliente, Medicamentos, Valores Faturados e a marca associada pela tabela Fabricante (4 tabelas).
66. Verifique os medicamentos categorizados sob nome 'Analgésicos e Antitérmicos' retornando também o respectivo Fabricante.
67. Faça auto relacionamento de teste localizando entregadores com o mesmo nome que cliente da Farmácia.
68. Exiba as vendas totais agregadas para Clientes do Logradouro da Rua Roberto Souza efetuando JOIN Cliente x Venda (utilize a tabela EnderecoCliente na junção).
69. Mostre informações granulares contendo o nome do Cliente e entregador apenas para entregas atestadas 'Fora do Prazo'.
70. Liste nomes dos métodos de tipo de pagamento efetuados com o agrupamento nominal do Estado do cliente solicitante.
71. Una Cadastro do Fabricante de Medicamentos com o VendaMedicamento para expor a demanda nominal que as marcas representam em compras.
72. Verifique via relacionamento RIGHT JOIN as Vendas que ainda não detêm registro na tabela matriz de Entrega.
73. Gere o relatório de jornada unindo: Cliente > Venda > Entrega > Entregador exibindo os nomes ao longo do ciclo de faturamento.
74. Conecte entregas de um motorista aos produtos transportados realizando pontes com Venda, VendaMedicamento e Medicamento.
75. Mostre para todos medicamentos existentes as solicitações de receitas preenchidas (NumeroReceita da tabela associativa).

## Nível Expert (25 questões)
*(Foco: Subqueries em FROM e WHERE, junções analíticas e expressões CASE WHEN)*

76. Liste todo medicamento posicionado acima da média de referência estática (use subconsulta com AVG(Preço) no filtro).
77. Descubra os CPF's de Clientes possuindo ticket de Venda que passa da dimensão gerada da meta de todas as lojas via subquery de MAX valor.
78. Adicione um cálculo de taxação rotulando-os como 'Especial' (preço>100), 'Moderado' (40 a 100) e 'Popular' (<40) usando comandos condicional CASE WHEN no nome do medicamento.
79. Utilize uma subtabela delimitando explicitamente as identificações do entregador com maior atraso contabilizado estatístico `(Entrega.DataHoraEntrega - Entrega.PrevisaoChegada)`.
80. Defina por intermédio de CASE WHEN um tiering de clientes, apontando níveis 'VIP' (> 5 Compras), 'Fiel' (2-5) e 'Novo' (1) através de uma subconsulta auxiliar.
81. Busque com uma query em subconjuntos `IN()` produtos médicos que derivem do ramo produtivo contido num conjunto específico pesquisado de Fabricantes (Ex: laboratório começados pela A). 
82. Determine usando `NOT EXISTS` apenas compras e perfis restritos sem requisição condicional médica (`RequerReceita`).
83. Classifique num relatório entre "Pedido Vultuoso" (> R$500) à "Pedido Menor" no select transacional manipulando a saída por `CASE WHEN`.
84. Aplique subquery na origem da cláusula `FROM` formando base analítica para extrair o cálculo faturado condensado diariamente e agrupá-lo na casca externa.
85. Projete estatisticamente a proporção fracionada via Subqueries das entregas finalizadas em 'Fora do Prazo' comparando num total em todos entregadores.
86. Evidencie todos Itens do Ticket no cenário da "Maior Venda Singular Computada" do ecossistema, filtrando id estrita no subselect escalar no WHERE.
87. Mapeie listando os top Medicamentos "Campeões Absolutos" usando função agregada vinculada por `WHERE IN (SELECT TOP 3 ... GROUP BY ...)`.
88. Encontre o fornecedor cujo portfólio de fábrica contenha um artigo de marca mais oneroso valendo-se da Subconsulta aninhada max.
89. Identifique via contagem em `HAVING`, se o cruzamento acuse excedentes psiquiátricos (>2 itens simultaneamente) validados dentro do mesmo ticket (`IdVenda`).
90. Retorne via Subconsulta correlacionada pareada o Cliente em paralelo ao seu penúltimo número de tíquete emitido.
91. Defina um painel logístico exibindo via `CASE` a frase "ALERTA ROTA!" em despachos atrasados não finalizados (Status != Entregue) frente ao instante vigente de validação (GETDATE). 
92. Calcule uma predição atestando quais fármacos beiram a ruptura (Estoque Atual < Média de Itens Adquiridos em Pedido no banco).
93. Classifique turnos da Venda como Manhã/Tarde/Noite baseados no horário do TIMESTAMP utilizando `CASE WHEN`.
94. Localize compradores puritanos dedicados ao medicamento de origem Medley sem aceitarem consórcios terceirizados (`NOT EXISTS`). 
95. Através do uso de agregação em profundidade decida qual IdVenda computou o teto valioso financeiro canalizado através do método de pagamento 'Dinheiro'.
96. Determine usando sub-estruturas temporais, cidade top referenciada de base para a entrega de Medicamentos do catálogo específico do laboratório 'Bayer'.
97. Execute mapeamentos verificando discrepâncias na estrutura através da intersecção do funcionário possuir o mesmíssimo e exato número telefônico de contato de Cliente num `EXISTS`.
98. Produza e sinalize com indicativo flag "Bonus Salário" para entregadores cujas métricas somem 100 envios com excelência de entrega dentro da data esperada e condicione atestados lógicos. 
99. Evidencie logs monitorando se no funil financeiro as compras se perdem em estornos calculados avaliando comparativo dos agrupamentos cancelados contra os finalizados nas vendas efetuadas em dias estressados de pico pela instrução `CASE WHEN` avançada.
100. Construa Output corporativo gerencial de BI extraindo qual trimestre financeiramente lucrou a parcela superavitária de maior soma ponderada correlacionando os Pagamentos das faturas dos laboratórios de Categoria mais genérica de toda a estrutura do schema.
