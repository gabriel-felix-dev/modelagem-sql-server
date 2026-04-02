-- Criação do Banco de Dados para Farmácia Delivery
-- Baseado na Modelagem 8 (Farmácia) incluindo delivery

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'FarmaciaDelivery')
BEGIN
    CREATE DATABASE FarmaciaDelivery;
END
GO

USE FarmaciaDelivery;
GO

-- 1. Criação das Entidades Simples e Autônomas
CREATE TABLE Categoria (
    Id INT IDENTITY NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    
    CONSTRAINT Id_Categoria PRIMARY KEY (Id)
);

CREATE TABLE Fabricante (
    Id INT IDENTITY NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Cnpj VARCHAR(14) NOT NULL UNIQUE,
    
    CONSTRAINT Id_Fabricante PRIMARY KEY (Id)
);

CREATE TABLE TipoPagamento (
    Id INT IDENTITY NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    
    CONSTRAINT Id_TipoPagamento PRIMARY KEY (Id)
);

CREATE TABLE Entregador (
    Id INT IDENTITY NOT NULL,
    Nome VARCHAR(150) NOT NULL,
    Cpf VARCHAR(11) NOT NULL UNIQUE,
    Telefone VARCHAR(15) NOT NULL,
    Cnh VARCHAR(15) NOT NULL UNIQUE,
    PlacaVeiculo VARCHAR(10) NOT NULL,
    Ativo BIT NOT NULL DEFAULT 1,
    
    CONSTRAINT Id_Entregador PRIMARY KEY (Id)
);

-- Cliente normalizado. Campos de endereço foram movidos.
CREATE TABLE Cliente (
    Id INT IDENTITY NOT NULL,
    Nome VARCHAR(150) NOT NULL,
    Cpf VARCHAR(11) NOT NULL UNIQUE,
    Telefone VARCHAR(15) NOT NULL,
    Email VARCHAR(100),
    DataCadastro DATETIME NOT NULL,
    
    CONSTRAINT Id_Cliente PRIMARY KEY (Id)
);

-- Tabela de Endereços do Cliente (Relacionamento 1:N)
CREATE TABLE EnderecoCliente (
    Id INT IDENTITY NOT NULL,
    IdCliente INT NOT NULL,
    Cep VARCHAR(8) NOT NULL,
    Logradouro VARCHAR(150) NOT NULL,
    Numero VARCHAR(10) NOT NULL,
    Complemento VARCHAR(100),
    Bairro VARCHAR(100) NOT NULL,
    Cidade VARCHAR(100) NOT NULL,
    Estado CHAR(2) NOT NULL,

    CONSTRAINT Id_EnderecoCliente PRIMARY KEY (Id),
    CONSTRAINT fk_IdCliente_EnderecoCliente FOREIGN KEY (IdCliente) REFERENCES Cliente(Id)
);

-- 2. Criação das Entidades Dependentes
CREATE TABLE Medicamento (
    Id INT IDENTITY NOT NULL,
    IdCategoria INT NOT NULL,
    IdFabricante INT NOT NULL,
    Nome VARCHAR(150) NOT NULL,
    Descricao TEXT,
    Preco DECIMAL(10, 2) NOT NULL,
    QuantidadeEstoque INT NOT NULL DEFAULT 0,
    RequerReceita BIT NOT NULL DEFAULT 0,
    
    CONSTRAINT Id_Medicamento PRIMARY KEY (Id),
    CONSTRAINT fk_IdCategoria_Medicamento FOREIGN KEY (IdCategoria) REFERENCES Categoria(Id),
    CONSTRAINT fk_IdFabricante_Medicamento FOREIGN KEY (IdFabricante) REFERENCES Fabricante(Id),
    CONSTRAINT CHK_Preco_Medicamento CHECK (Preco > 0),
    CONSTRAINT CHK_Estoque_Medicamento CHECK (QuantidadeEstoque >= 0)
);

-- Venda com referenciamento direto de qual endereço daquele cliente está sendo utilizado
CREATE TABLE Venda (
    Id INT IDENTITY NOT NULL,
    IdCliente INT NOT NULL,
    IdEnderecoCliente INT NOT NULL,
    DataHora DATETIME NOT NULL,
    ValorTotal DECIMAL(10, 2) NOT NULL,
    StatusVenda VARCHAR(50) NOT NULL DEFAULT 'Pendente',
    
    CONSTRAINT Id_Venda PRIMARY KEY (Id),
    CONSTRAINT fk_IdCliente_Venda FOREIGN KEY (IdCliente) REFERENCES Cliente(Id),
    CONSTRAINT fk_IdEnderecoCliente_Venda FOREIGN KEY (IdEnderecoCliente) REFERENCES EnderecoCliente(Id),
    CONSTRAINT CHK_ValorTotal_Venda CHECK (ValorTotal >= 0)
);

-- 3. Criação das Tabelas Associativas e de Controle
CREATE TABLE VendaMedicamento (
    Id INT IDENTITY NOT NULL,
    IdVenda INT NOT NULL,
    IdMedicamento INT NOT NULL,
    Quantidade INT NOT NULL,
    PrecoUnitario DECIMAL(10, 2) NOT NULL,
    NumeroReceita VARCHAR(50),
    
    CONSTRAINT Id_VendaMedicamento PRIMARY KEY (Id),
    CONSTRAINT fk_IdVenda_VendaMedicamento FOREIGN KEY (IdVenda) REFERENCES Venda(Id),
    CONSTRAINT fk_IdMedicamento_VendaMedicamento FOREIGN KEY (IdMedicamento) REFERENCES Medicamento(Id),
    CONSTRAINT CHK_Quantidade_VendaMedicamento CHECK (Quantidade > 0),
    CONSTRAINT CHK_Preco_VendaMedicamento CHECK (PrecoUnitario > 0)
);

CREATE TABLE Pagamento (
    Id INT IDENTITY NOT NULL,
    IdVenda INT NOT NULL,
    IdTipoPagamento INT NOT NULL,
    Valor DECIMAL(10, 2) NOT NULL,
    DataHora DATETIME NOT NULL,
    
    CONSTRAINT Id_Pagamento PRIMARY KEY (Id),
    CONSTRAINT fk_IdVenda_Pagamento FOREIGN KEY (IdVenda) REFERENCES Venda(Id),
    CONSTRAINT fk_IdTipoPagamento_Pagamento FOREIGN KEY (IdTipoPagamento) REFERENCES TipoPagamento(Id),
    CONSTRAINT CHK_Valor_Pagamento CHECK (Valor > 0)
);

CREATE TABLE Entrega (
    Id INT IDENTITY NOT NULL,
    IdVenda INT NOT NULL UNIQUE,
    IdEntregador INT NOT NULL,
    DataHoraSaida DATETIME,
    PrevisaoChegada DATETIME,
    DataHoraEntrega DATETIME,
    StatusEntrega VARCHAR(50) NOT NULL DEFAULT 'Aguardando',
    StatusPrazo VARCHAR(50),
    
    CONSTRAINT Id_Entrega PRIMARY KEY (Id),
    CONSTRAINT fk_IdVenda_Entrega FOREIGN KEY (IdVenda) REFERENCES Venda(Id),
    CONSTRAINT fk_IdEntregador_Entrega FOREIGN KEY (IdEntregador) REFERENCES Entregador(Id)
);
GO


