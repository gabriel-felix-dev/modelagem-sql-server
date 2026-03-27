SELECT	al.Nome as 'Aluno',
		ma.Numero as 'Matricula',
		cu.Nome as 'Curso'
	FROM Aluno As al
		INNER JOIN MatriculaAluno ma
			ON al.Id = ma.IdAluno
		INNER JOIN MatriculaAlunoCurso mac
			ON ma.Id = mac.IdMatriculaAluno
		INNER JOIN Curso cu
			ON cu.Id = mac.IdCurso
ORDER BY ma.Numero ASC;

SELECT	cu.Nome as 'Curso',
		COUNT(mac.Id) as 'Quantidade de matriculados'
	FROM Curso As cu
		INNER JOIN MatriculaAlunoCurso As mac
			ON cu.Id = mac.IdCurso
GROUP BY cu.Nome;

SELECT	pr.Nome as 'Professor',
		ma.Numero as 'Matricula',
		es.Nome as 'Especialidade',
		cu.Nome as 'Curso',
		ni.Nome as 'Nivel',
		cuho.DiaDaSemana as 'Dia',
		tu.Nome as 'Turno',
		ho.Horario as 'Horario'
	FROM Professor AS pr
		INNER JOIN MatriculaProfessor AS ma
			ON pr.Id = ma.IdProfessor
		INNER JOIN EspecialidadeProfessor AS espr
			ON pr.Id = espr.IdProfessor
		INNER JOIN Especialidade AS es
			ON es.Id = espr.IdEspecialidade
		INNER JOIN MatriculaProfessorCurso AS mprc
			ON ma.Id = mprc.IdMatricula
		INNER JOIN Curso AS cu
			ON cu.Id = mprc.IdCurso
		INNER JOIN Nivel AS ni
			ON ni.Id = cu.IdNivel
		INNER JOIN CursoTurno AS cut
			ON cut.IdCurso = cu.Id
		INNER JOIN Turno AS tu
			ON tu.Id = cut.IdTurno
		INNER JOIN CursoHorario AS cuho
			ON cu.Id = cuho.IdCurso
		INNER JOIN Horario AS ho
			ON ho.Id = cuho.IdHorario
	ORDER BY 1, 2;

	SELECT	pr.Nome as 'Professor',
			ma.Numero as 'Matricula',
			es.Nome as 'Especialidade',
			cu.Nome as 'Curso',
			ni.Nome as 'Nivel'
	FROM Professor AS pr
		INNER JOIN MatriculaProfessor AS ma
			ON pr.Id = ma.IdProfessor
		INNER JOIN EspecialidadeProfessor AS espr
			ON pr.Id = espr.IdProfessor
		INNER JOIN Especialidade AS es
			ON es.Id = espr.IdEspecialidade
		INNER JOIN MatriculaProfessorCurso AS mprc
			ON ma.Id = mprc.IdMatricula
		INNER JOIN Curso AS cu
			ON cu.Id = mprc.IdCurso
		INNER JOIN Nivel AS ni
			ON ni.Id = cu.IdNivel
	ORDER BY 1