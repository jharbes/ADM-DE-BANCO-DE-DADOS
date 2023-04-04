CREATE VIEW discobrig AS
Select G.idGrade,
		count(G.idGrade) AS qtd_total,
		CU.nome
from grade G 
	INNER JOIN composta C on (G.idGrade = C.idGrade) 
		INNER join disciplina D on (C.idDisciplina = D.idDisciplina) 
        	INNER JOIN curso CU on (G.idCurso = CU.idCurso) 
group by 1

CREATE VIEW qtd_cursada_matricula AS
select M.matricula,
		C.idGrade,
        count(H.status) AS qtd_cursada 
  from matricula M 
  	INNER join historico H on (M.matricula = H.matricula) 
    	INNER join disciplina D on (H.idDisciplina = D.idDisciplina) 
        	INNER join composta C on (D.idDisciplina = C.idDisciplina) 
  where H.status = 1 
  group by M.matricula
  
  SELECT matricula,
  		CASE WHEN (qtd_cursada = qtd_total) 
        THEN 'APROVADO'
        ELSE 'FALTA MATERIAS'
        END AS resultado_integracao
  FROM qtd_cursada_matricula QCM
  	INNER JOIN discobrig DI ON (QCM.idGrade = DI.idGrade)