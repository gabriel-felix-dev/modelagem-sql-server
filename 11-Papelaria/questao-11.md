# Exercício 11 — Papelaria

**Modelo de referência:**
```
Fornecedor(PK Id, NomeFantasia, Cnpj, Telefone, Email)
Produto(PK Id, FK IdFornecedor, Nome, Categoria, PrecoUnitario, Estoque)
Cliente(PK Id, NomeCompleto, Cpf, Telefone)
Venda(PK Id, FK IdCliente, DataVenda)
VendaProduto(PK Id, FK IdVenda, FK IdProduto, Quantidade, PrecoUnitario)
```

---

## Questão 11.1

Liste o nome do produto, a categoria e o total de unidades vendidas. Exiba apenas os produtos com **mais de 5 unidades vendidas**. Ordene do mais vendido para o menos vendido.

**Retorno esperado:** Nome do produto, categoria e total de unidades vendidas.

---

## Questão 11.2

Liste o nome do fornecedor e a quantidade de produtos distintos fornecidos por ele. Exiba apenas fornecedores com **mais de 2 produtos** cadastrados. Ordene pelo nome do fornecedor.

**Retorno esperado:** Nome do fornecedor e quantidade de produtos.

---

## Questão 11.3

Para cada categoria de produto, liste o nome da categoria, o fornecedor que mais fornece produtos nessa categoria, e o total de produtos desse fornecedor nessa categoria. Exiba apenas categorias com **ao menos 2 fornecedores distintos** envolvidos. Ordene pela categoria.

**Retorno esperado:** Categoria, nome do fornecedor e total de produtos.
