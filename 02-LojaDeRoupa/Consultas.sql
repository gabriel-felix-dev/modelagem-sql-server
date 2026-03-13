SELECT name
FROM sys.tables;

EXEC sp_help Endereco;

EXEC sp_rename 'Endereco.Logadouro', 'Logradouro', 'COLUMN';

