SELECT	al.Nome as 'Aluno',
		al.Media as 'Média',
	CASE
		WHEN al.Media >= 8 THEN 'Aprovado'
		WHEN al.Media >= 6 THEN 'Recuperação'
		ELSE 'Reprovado'
	END as 'Situação'
	FROM Aluno AS al
	ORDER BY al.Nome ASC; 

SELECT	al.Nome as 'ALUNO',
		COUNT(CASE
				  WHEN al.Media >= 8 THEN 1 
			  END) as 'Aprovados',
		COUNT(CASE
				  WHEN al.Media >= 6 THEN 1
			  END) as 'Recuperação' 
	FROM Aluno AS al
	GROUP BY al.Nome, al.Media;

SELECT	COUNT(CASE
				  WHEN al.Media >= 8 THEN 1 
			  END) as 'Aprovados',
		COUNT(CASE
				  WHEN al.Media >= 6 THEN 1
			  END) as 'Recuperação' 
	FROM Aluno AS al;

SELECT SUM(CASE
			   WHEN al.Media >= 8 THEN 1
			   ELSE 0
		   END) as 'Aprovados',
	   SUM(CASE
		       WHEN al.Media >= 6 THEN 1
			   ELSE 0
	       END) as 'Recuperação'
	FROM Aluno AS al;

SELECT	al.Nome as 'ALUNO',
		CASE
			WHEN (COUNT(CASE
							WHEN al.Media >= 8 THEN 1 
						END)) = 1 THEN 'Aprovados'
			ELSE 'Reprovado'
		END
	FROM Aluno AS al
	GROUP BY al.Nome, al.Media;

SELECT	COUNT(CASE
				  WHEN Media >= 7 THEN 1
				  ELSE 0
			  END) 
	FROM Aluno;

SELECT	al.Id as 'Matricula Alunos',
		SUM(CASE
				WHEN al.Media >=8 THEN 1
				ELSE 0
			END) as 'Aprovados',
			COUNT(*) as 'Total Alunos' 
	FROM Aluno AS al
	GROUP BY al.Id;

SELECT	al.Nome as 'Aluno',
		al.Media as 'Média',
		cu.Nome as 'Curso'
	FROM Aluno AS al 
		INNER JOIN Curso AS cu
			ON al.IdCurso = cu.Id; 

SELECT	IdCurso,
		COUNT(*)
	FROM Aluno 
	GROUP BY IdCurso;

SELECT	al.Nome as 'Aluno',
		al.Media as 'Media',
		cu.Nome as 'Curso',
		COUNT(*) OVER (PARTITION BY al.IdCurso) as 'Total por Curso'
	FROM Aluno AS al
		INNER JOIN Curso AS cu 
			ON al.IdCurso = cu.Id
	ORDER BY cu.Nome ASC;

SELECT	al.Nome as 'Nome',
		al.IdCurso as 'Curso',
		al.Media as 'Media',
		RANK() OVER (
					  PARTITION BY al.IdCurso
					  ORDER BY al.Media DESC) as 'Ranking do Curso'
	FROM Aluno AS al;

SELECT * FROM Aluno;

SELECT Id FROM Curso;

SELECT	al.Nome as 'Nome'
	FROM Aluno AS al
	WHERE al.IdCurso = (SELECT	cu.Id 
							FROM Curso AS cu
							WHERE cu.Nome Like 'Portu%');

SELECT	al.Nome as 'Aluno',
		li.Titulo as 'Livro',
		li.PrecoUnitario as 'Preço do Livro',
		re.DataReserva as 'Data Reserva',
		re.DataDevolucaoPrevista as 'Data Devolução Prevista'
	FROM Reserva AS re
		INNER JOIN Aluno AS al
			ON al.Id = re.IdAluno
		INNER JOIN Livro AS li
			ON li.Id = re.IdLivro;


