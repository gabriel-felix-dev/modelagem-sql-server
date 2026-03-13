EXEC sp_help Pais;

INSERT INTO Pais (Nome, Sigla) VALUES 
('India', 'IND');

EXEC sp_help Autor;

INSERT INTO Autor (IdPaisDeOrigem, Nome, DataNascimento) VALUES 
(1, 'George Orwell', '1903-06-25');

EXEC sp_help Livro;

INSERT INTO Livro (IdAutor, Titulo, Paginas, ISBN, QuantidadeEstoque) VALUES
(1, '1984', 336, 6555522267, 10);

ALTER TABLE Livro
DROP COLUMN ISBN;

ALTER TABLE Livro
DROP CONSTRAINT UQ__Livro__447D36EADA4651C4;

ALTER TABLE Livro
ALTER COLUMN ISBN CHAR(13) NOT NULL;

ALTER TABLE Livro
ADD CONSTRAINT UQ_Livro_ISBN UNIQUE (ISBN);

EXEC sp_help Livro;

INSERT INTO Livro (IdAutor, Titulo, Paginas, ISBN, QuantidadeEstoque) VALUES
(1, '1984', 336, 978-6555522266, 10);

TRUNCATE TABLE Livro;

ALTER TABLE Livro
ALTER COLUMN ISBN VARCHAR(14) NOT NULL;

ALTER TABLE Livro
DROP CONSTRAINT UQ_Livro_ISBN;

ALTER TABLE Livro
ALTER COLUMN ISBN VARCHAR(14) NOT NULL;

ALTER TABLE Livro
ADD CONSTRAINT UQ_ISBN_Livro UNIQUE (ISBN);

INSERT INTO Livro (IdAutor, Titulo, Paginas, ISBN, QuantidadeEstoque) VALUES
(1, '1984', 336, 978-6555522266, 10);

TRUNCATE TABLE Livro;

INSERT INTO Livro (IdAutor, Titulo, Paginas, ISBN, QuantidadeEstoque) VALUES
(1, '1984', 336, '978-6555522266', 10);

INSERT INTO Livro (IdAutor, Titulo, Paginas, ISBN, QuantidadeEstoque) VALUES
(1, 'A Revolução dos Bichos', )
