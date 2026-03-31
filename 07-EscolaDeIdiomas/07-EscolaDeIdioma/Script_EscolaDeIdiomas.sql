CREATE DATABASE EscolaDeIdiomas;

USE EscolaDeIdiomas;

CREATE TABLE Endereco(
	Id INT IDENTITY,
	CEP CHAR(8) NOT NULL,
	Logradouro VARCHAR(255) NOT NULL,
	Numero VARCHAR(10) NOT NULL,
	Complemento VARCHAR(500) NULL,
	Bairro VARCHAR(255) NOT NULL,
	Cidade VARCHAR(255) NOT NULL,
	UF CHAR (2) NOT NULL

	CONSTRAINT PK_IdEndereco PRIMARY KEY (Id)
);

CREATE TABLE Contato(
	Id INT IDENTITY,
	CelularPrincipal CHAR(11) NOT NULL,
	CelularSecundario VARCHAR(11) NULL

	CONSTRAINT PK_IdContato PRIMARY KEY (Id)
);

CREATE TABLE Aluno(
	Id INT IDENTITY,
	IdEndereco INT NOT NULL,
	IdContato INT NOT NULL,
	CPF CHAR(11) NOT NULL,
	Nome VARCHAR(255) NOT NULL,
	Email VARCHAR(255) NOT NULL

	CONSTRAINT PK_IdAluno PRIMARY KEY (Id),
	CONSTRAINT UQ_CPF_Aluno UNIQUE (CPF),
	CONSTRAINT FK_IdEndereco_Aluno FOREIGN KEY (IdEndereco) REFERENCES Endereco (Id),
	CONSTRAINT FK_IdContato_Aluno FOREIGN KEY (IdContato) REFERENCES Contato (Id)
);

CREATE TABLE MatriculaAluno(
	Id INT IDENTITY,
	IdAluno INT NOT NULL,
	Numero INT NOT NULL,
	DataMatricula DATETIME DEFAULT GETDATE()

	CONSTRAINT PK_IdMatriculaAluno PRIMARY KEY (Id),
	CONSTRAINT UQ_Numero_MatriculaAluno UNIQUE (Numero),
	CONSTRAINT FK_IdAluno_MatriculaAluno FOREIGN KEY (IdAluno) REFERENCES Aluno (Id)
);

CREATE TABLE Professor(
	Id INT IDENTITY,
	IdEndereco INT NOT NULL,
	IdContato INT NOT NULL,
	CPF CHAR(11) NOT NULL,
	Nome VARCHAR(255) NOT NULL,
	Email VARCHAR(255) NOT NULL

	CONSTRAINT PK_IdProfessor PRIMARY KEY (Id),
	CONSTRAINT UQ_CPF_Professor UNIQUE (CPF),
	CONSTRAINT FK_IdEndereco_Professor FOREIGN KEY (IdEndereco) REFERENCES Endereco (Id),
	CONSTRAINT FK_IdContato_Professor FOREIGN KEY (IdContato) REFERENCES Contato (Id)
);

CREATE TABLE Especialidade(
	Id INT IDENTITY,
	Nome VARCHAR(255) NOT NULL

	CONSTRAINT PK_IdEspecialidade PRIMARY KEY (Id)
);

CREATE TABLE EspecialidadeProfessor(
	IdEspecialidade INT NOT NULL,
	IdProfessor INT NOT NULL

	CONSTRAINT FK_IdEspecialidade_EspecialidadeProfessor FOREIGN KEY (IdEspecialidade) REFERENCES Especialidade (Id),
	CONSTRAINT FK_IdProfessor_EspecialidadeProfessor FOREIGN KEY (IdProfessor) REFERENCES Professor (Id)
);

CREATE TABLE MatriculaProfessor(
	Id INT IDENTITY,
	IdProfessor INT NOT NULL,
	Numero INT NOT NULL,
	DataMatricula DATETIME DEFAULT GETDATE()

	CONSTRAINT PK_IdMatriculaProfessor PRIMARY KEY (Id),
	CONSTRAINT UQ_IdProfessor_MatriculaProfessor UNIQUE (Numero),
	CONSTRAINT FK_IdProfessor_MatriculaProfessor FOREIGN KEY (IdProfessor) REFERENCES Professor (Id)
);

CREATE TABLE FormaDePagamento(
	Id INT IDENTITY,
	Nome VARCHAR(15) NOT NULL

	CONSTRAINT PK_IdFormaDePagamento PRIMARY KEY (Id)
);

CREATE TABLE Nivel(
	Id INT IDENTITY,
	Nome VARCHAR(15) NOT NULL

	CONSTRAINT PK_IdNivel PRIMARY KEY (Id)
);

CREATE TABLE Curso(
	Id INT IDENTITY,
	IdNivel INT NOT NULL,
	Nome VARCHAR(255) NOT NULL

	CONSTRAINT PK_IdCurso PRIMARY KEY (Id),
	CONSTRAINT FK_IdNivel_Curso FOREIGN KEY (IdNivel) REFERENCES Nivel (Id)
);

CREATE TABLE MatriculaProfessorCurso(
	IdMatricula INT NOT NULL,
	IdCurso INT NOT NULL

	CONSTRAINT FK_IdMatricula_MatriculaProfessorCurso FOREIGN KEY (IdMatricula) REFERENCES Professor (Id),
	CONSTRAINT FK_IdCurso_MatriculaProfessorCurso FOREIGN KEY (IdCurso) REFERENCES Curso (Id)
);

CREATE TABLE MatriculaAlunoCurso(
	Id INT IDENTITY,
	IdMatriculaAluno INT NOT NULL,
	IdCurso INT NOT NULL,
	IdFormaDePagamento INT NOT NULL,
	Valor DECIMAL(10,2) NOT NULL

	CONSTRAINT PK_IdMatriculaAlunoCurso PRIMARY KEY (Id),
	CONSTRAINT FK_IdMatriculaAluno_MatriculaAlunoCurso FOREIGN KEY (IdMatriculaAluno) REFERENCES MatriculaAluno (Id),
	CONSTRAINT FK_IdCurso_MatriculaAlunoCurso FOREIGN KEY (IdCurso) REFERENCES Curso (Id),
	CONSTRAINT FK_IdFormaDePagamento_MatriculaAlunoCurso FOREIGN KEY (IdFormaDePagamento) REFERENCES FormaDePagamento (Id)
);

CREATE TABLE Turno(
	Id INT IDENTITY,
	Nome VARCHAR(15) NOT NULL

	CONSTRAINT PK_IdTurno PRIMARY KEY (Id)
);

CREATE TABLE CursoTurno(
	IdCurso INT NOT NULL,
	IdTurno INT NOT NULL

	CONSTRAINT FK_IdCurso_CursoTurno FOREIGN KEY (IdCurso) REFERENCES Curso (Id),
	CONSTRAINT FK_IdTurno_CursoTUrno FOREIGN KEY (IdTurno) REFERENCES Turno (Id)
);

CREATE TABLE Horario(
	Id INT IDENTITY,
	Horario VARCHAR(255) NOT NULL,

	CONSTRAINT PK_IdHorario PRIMARY KEY (Id)
);

CREATE TABLE CursoHorario(
	Id INT IDENTITY,
	IdCurso INT NOT NULL,
	IdHorario INT NOT NULL,
	DiaDaSemana VARCHAR(255) NOT NULL

	CONSTRAINT PK_IdCursoHorario PRIMARY KEY (Id),
	CONSTRAINT FK_IdCurso_CursoHorario FOREIGN KEY (IdCurso) REFERENCES Curso (Id),
	CONSTRAINT FK_IdHorario_CursoHorario FOREIGN KEY (IdHorario) REFERENCES Horario (Id)
);
