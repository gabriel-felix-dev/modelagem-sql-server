INSERT INTO Cliente (NomeCompleto, CPF, Telefone) VALUES
('Ana Silva', '10110210399', '11900000001'),
('Bruno Costa', '20110215399', '11900000002'),
('Carla Souza', '30140210399', '11900000003'),
('Diego Lima', '40130210399', '11900000004'),
('Eduarda Martins', '50110210399', '11900000005'),
('Felipe Rocha', '60210210399', '11900000006'),
('Gabriela Alves', '70110210399', '11900000007'),
('Henrique Ferreira', '80110210399', '11900000008'),
('Isabela Cardoso', '90110210399', '11900000009'),
('João Pedro', '11110210399', '11900000010');

INSERT INTO Fornecedor (NomeFantasia, Email, Telefone, CNPJ) VALUES
('Tech Solutions', 'fornecedor101@email.com','8492268147', '12345678000101'),
('Global Trade', 'fornecedor102@email.com','8492268147',  '12345678000102'),
('Alpha Distribuidora', 'fornecedor103@email.com','8492268147',  '12345678000103'),
('Omega Supplies', 'fornecedor104@email.com','8492268147',  '12345678000104'),
('Delta Import', 'fornecedor105@email.com','8492268147',  '12345678000105'),
('Nova Tech', 'fornecedor106@email.com','8492268147',  '12345678000106'),
('Brasil Equipamentos', 'fornecedor107@email.com','8492268147','12345678000107'),
('Prime Solutions', 'fornecedor108@email.com','8492268147', '12345678000108'),
('Mundo Import', 'fornecedor109@email.com','8492268147',  '12345678000109'),
('TechPro Distribuidora', 'fornecedor110@email.com','8492268147',  '12345678000110'),
('Ultra Distribuição', 'fornecedor111@email.com','8492268147',  '12345678000111');

INSERT INTO Produto (IdFornecedor, Nome, Categoria, PrecoUnitario, Estoque) VALUES
(1,'Notebook Dell Inspiron 15', 'Eletrônico', 1000, 50),
(2,'Notebook Lenovo Ideapad 3', 'Eletrônico', 1500, 50),
(3,'Notebook Acer Aspire 5', 'Eletrônico', 1600, 50),
(4,'Notebook Asus Vivobook 14', 'Eletrônico', 1700, 50),
(5,'Luminária de mesa', 'Escritorio', 10, 40),
(6,'Smartphone Samsung Galaxy S22', 'Eletrônico', 1000, 50),
(7,'Smartphone iPhone 13', 'Eletrônico', 10000, 20),
(8,'Smartphone iPhone 14', 'Eletrônico', 15000, 30),
(9,'Resma de papel A4', 'Escritorio', 20, 50),
(10,'Smartphone Xiaomi Poco X4', 'Eletrônico', 800, 50),
(11,'Cadeira Gamer DXRacer', 'Eletrônico', 500, 15);

INSERT INTO Venda (IdCliente, DataVenda) VALUES
(6, DATEADD(DAY, -30, GETDATE())),
(7, DATEADD(DAY, -35, GETDATE())),
(8, DATEADD(DAY, -40, GETDATE())),
(9, DATEADD(DAY, -45, GETDATE())),
(10, DATEADD(DAY, -50, GETDATE())),
(11, DATEADD(DAY, -55, GETDATE())),
(12, DATEADD(DAY, -60, GETDATE())),
(13, DATEADD(DAY, -65, GETDATE())),
(14, DATEADD(DAY, -70, GETDATE())),
(15, DATEADD(DAY, -75, GETDATE()));

INSERT INTO VendaProduto (IdVenda, IdProduto, Quantidade, PrecoUnitario) VALUES
(1, 1, 2, 1000.00),
(2, 3, 1, 1500.00),
(3, 4, 3, 1700.00),
(4, 2, 2, 1500.00),
(5, 5, 1, 10.00),
(6, 7, 4, 10000.00),
(7, 6, 2, 1000.00),
(8, 9, 1, 20.00),
(9, 10, 2, 800.00),
(10, 11, 3, 500.00);

INSERT INTO Produto (IdFornecedor, Nome, Categoria, PrecoUnitario, Estoque) VALUES
(1,'Notebook Dell Inspiron 15', 'Eletrônico', 1000, 50),
(3,'Notebook Lenovo Ideapad 3', 'Eletrônico', 1500, 50),
(3,'Notebook Acer Aspire 5', 'Eletrônico', 1600, 50),
(4,'Notebook Asus Vivobook 14', 'Eletrônico', 1700, 50),
(7,'Luminária de mesa', 'Escritorio', 10, 40),
(6,'Smartphone Samsung Galaxy S22', 'Eletrônico', 1000, 50),
(7,'Smartphone iPhone 13', 'Eletrônico', 10000, 20),
(8,'Smartphone iPhone 14', 'Eletrônico', 15000, 30),
(5,'Resma de papel A4', 'Escritorio', 20, 50),
(10,'Smartphone Xiaomi Poco X4', 'Eletrônico', 800, 50),
(11,'Cadeira Gamer DXRacer', 'Eletrônico', 500, 15);

INSERT INTO Fornecedor (NomeFantasia, Email, Telefone, CNPJ) VALUES
('Miau Imports', 'fornecedor1561@email.com','8492268147', '12395678000101');

INSERT INTO Produto (IdFornecedor, Nome, Categoria, PrecoUnitario, Estoque) VALUES
(13,'Chocolate Garoto', 'Doces', 50, 5);
