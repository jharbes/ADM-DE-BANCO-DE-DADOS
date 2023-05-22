-- Lista 5

-- item 1


select d.dept_name as Departamento, concat('US$ ', format(sum((s.salary * 12)), 2, 'de_DE')) as custoAnualFuncionarios from employees as e
natural join dept_emp as de
natural join departments as d
inner join salaries as s on (s.emp_no = e.emp_no)
group by Departamento;

/*
resultado:

Departamento 
custoAnualFuncionarios 

Customer Service
US$ 133.546.637.664,00

Development
US$ 488.786.087.412,00

Finance
US$ 117.283.690.584,00

Human Resources
US$ 94.217.930.628,00

Marketing
US$ 138.850.702.260,00

Production
US$ 421.114.528.332,00

Quality Management
US$ 109.408.724.748,00

Research
US$ 121.435.478.700,00

Sales
US$ 406.563.600.828,00
*/



-- item 2


select concat(e.first_name, ' ', e.last_name) as Nome, format(max(s.salary) * 12, 2, 'de_DE') as Custo_anual from employees as e
natural join salaries as s
inner join dept_emp as de on (e.emp_no = de.emp_no)
group by Nome


-- item 3


CREATE VIEW item3 AS
	SELECT	ED.dept_no AS id_departamento,
			ED.dept_name AS departamento,
			SUM(ES.salary) AS gasto_ano_dept,
			EXTRACT(YEAR FROM (ES.from_date)) AS ano
	FROM employees.salaries ES
		INNER JOIN employees.dept_emp EDE ON (ES.emp_no = EDE.emp_no)
		INNER JOIN employees.departments ED ON (EDE.dept_no = ED.dept_no)
	GROUP BY id_departamento,ano;



-- item 4

CREATE VIEW custo_func_ano AS
	SELECT EE.emp_no AS id_func,
			DE.dept_no AS id_departamento,
			CONCAT(EE.first_name, " ", EE.last_name) AS nome_func,
			ES.salary AS salario_ano,
			EXTRACT(YEAR FROM (ES.from_date)) AS ano
	FROM employees.employees EE
		INNER JOIN employees.salaries ES ON (EE.emp_no = ES.emp_no)
		INNER JOIN employees.dept_emp DE ON (ES.emp_no = DE.emp_no)

CREATE VIEW gasto_percentual_func AS
	SELECT 	id_func,
			nome_func,
			salario_ano,
			departamento,
			gasto_ano_dept,
			custo_func_ano.ano,
			FORMAT((salario_ano/gasto_ano_dept)*100,3) AS gasto_perc_do_dept
	FROM custo_func_ano
	INNER JOIN gasto_anual_dept ON ((custo_func_ano.id_departamento = gasto_anual_dept.id_departamento) AND (custo_func_ano.ano = gasto_anual_dept.ano))



-- item 5


create view item_5 as
select distinct 
concat(e.first_name, ' ', e.last_name) as Nome, 
d.dept_name as Departamento, 
max(s.salary) * 12 as Custo_anual,
(select Custo_total_anual from item_3 where Departamento = d.dept_name) as Custo_total_departamento,
format((((max(s.salary) * 12) / (select Custo_total_anual from item_3 where Departamento = d.dept_name)) * 100), '%') as Percentual
from departments as d
inner join dept_emp as de on (d.dept_no = de.dept_no)
inner join dept_manager as dm on (d.dept_no = dm.dept_no)
inner join employees as e on (e.emp_no = dm.emp_no or e.emp_no = de.emp_no)
inner join salaries as s on (e.emp_no = s.emp_no)
group by e.emp_no having percentual <= 10;


-- item 6


create view item_6 as
select distinct 
concat(e.first_name, ' ', e.last_name) as Nome, 
d.dept_name as Departamento, 
max(s.salary) * 12 as Custo_anual,
(select Custo_total_anual from item_3 where Departamento = d.dept_name) as Custo_total_departamento,
format((((max(s.salary) * 12) / (select Custo_total_anual from item_3 where Departamento = d.dept_name)) * 100), '%') as Percentual
from departments as d
inner join dept_emp as de on (d.dept_no = de.dept_no)
inner join dept_manager as dm on (d.dept_no = dm.dept_no)
inner join employees as e on (e.emp_no = dm.emp_no or e.emp_no = de.emp_no)
inner join salaries as s on (e.emp_no = s.emp_no)
group by e.emp_no having percentual >= 10;




-- exercicio 3

DELIMITER $$

CREATE PROCEDURE consultar_departamento (IN p_dept_no CHAR(4))
BEGIN
	SELECT 	id_departamento,
			departamento,
			ano,
			COUNT(id_func) AS qtd_func,
			gasto_ano_dept AS gasto_dept,
			MAX(salario_ano) AS maior_salario
	FROM gasto_percentual_func
		WHERE p_dept_no = id_departamento 
	GROUP BY 1, 3
	ORDER BY 3 ASC;
END $$

DELIMITER ;