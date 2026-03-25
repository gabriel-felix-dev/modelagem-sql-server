SELECT * FROM Aluno;

SELECT	al.Nome as 'Aluno',
		cu.Nome as 'Curso'
    FROM Aluno As al
		INNER JOIN MatriculaAluno ma
			ON al.Id = ma.IdAluno
				INNER JOIN MatriculaAlunoCurso mac
					ON 
