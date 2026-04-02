# Exercicios SQL

Este repositorio contem uma colecao de exercicios praticos de SQL (Structured Query Language) voltados para o treinamento e aperfeicoamento em banco de dados. O material e destinado a estudantes e profissionais que desejam aprimorar suas habilidades em construcao de consultas e modelagem relacional.

## Requisitos de Ambiente

- Sistema Gerenciador de Banco de Dados Relacional (SGBD) compativel com a sintaxe do Microsoft SQL Server.

## Como Utilizar

Para extrair o maximo de cada exercicio, siga os passos abaixo no modulo escolhido:

1. Execute o script de criacao (`script.sql`) para gerar o banco de dados e as respectivas tabelas (DDL).
2. Execute o script de insercao (`inserts.sql`) para popular as tabelas com o conjunto de dados de exemplo (DML).
3. Abra o arquivo de questoes (`questoes.md`) e resolva os problemas propostos escrevendo as consultas no seu SGBD preferido.
4. Avance gradativamente pelos niveis de dificuldade.

## Modulos Disponiveis

### 1. Farmacia Delivery
Um sistema de banco de dados para uma farmacia com operacao de entregas. Estruturado com dados ficticios para fins educacionais, o modulo foca na pratica de DQL (Data Query Language) atraves de 100 questoes organizadas em niveis:

- **Nivel Basico (25 questoes):** SELECT simples, manipulacao de texto, filtros WHERE, ORDER BY e TOP.
- **Nivel Intermediario (25 questoes):** Agrupamentos (GROUP BY), funcoes de agregacao (COUNT, SUM, AVG, MAX, MIN) e HAVING.
- **Nivel Avancado (25 questoes):** JOINs com multiplas tabelas (INNER, LEFT, RIGHT) e relacionamentos.
- **Nivel Expert (25 questoes):** Subconsultas em FROM e WHERE, juncoes analiticas e expressoes condicionais (CASE WHEN).

**Arquivos do Modulo:**
- `script.sql`: Estrutura do banco normalizado com constraints e relacionamentos (tabelas como Categoria, Fabricante, Cliente, Medicamento, Venda, Entrega, etc.).
- `inserts.sql`: Massa de dados com registros variados (fabricantes, categorias, tipos de pagamento, entregadores, clientes e transacoes).
- `questoes.md`: Lista completa contendo as 100 perguntas.

## Objetivos de Aprendizagem

Este repositorio foi criado para auxiliar no desenvolvimento de competencias praticas, abordando:
- Compreensao de modelagem relacional e normalizacao.
- Dominio de selecoes simples e multiplas, incluindo filtragens condicionais.
- Aplicacao de funcoes de agregacao e agrupamentos de dados.
- Juncoes complexas entre multiplas tabelas.
- Construcao de subconsultas (subqueries) e logica condicional nas buscas.

**Nota:** Este projeto tem carater estritamente educacional. Os dados contidos nos scripts sao ficticios e gerados apenas para simulacao de cenarios (CPFs, CNPJs e placas utilizados sao exemplos estruturais). Sinta-se livre para utilizar, modificar e compartilhar para fins de aprendizado.
