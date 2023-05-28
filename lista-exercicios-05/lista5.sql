-- Lista 5

-- item 1

-- gasto anual departamento

create view item1 AS
select d.dept_name as departamento, concat('US$ ', format(sum((s.salary * 1)), 2, 'de_DE')) as custo_anual_funcionarios from employees as e
natural join dept_emp as de
natural join departments as d
inner join salaries as s on (s.emp_no = e.emp_no)
where s.to_date='9999-01-01'
group by departamento;

/*
resultado:


departamento	
custo_anual_funcionarios	

Development
US$ 4.627.787.365,00
Sales
US$ 3.731.370.677,00
Production
US$ 3.982.729.442,00
Human Resources
US$ 909.717.009,00
Research
US$ 1.148.334.609,00
Quality Management
US$ 1.045.459.198,00
Marketing
US$ 1.300.398.678,00
Customer Service
US$ 1.270.982.348,00
Finance
US$ 1.089.231.961,00


*/



-- item 2

-- custo anual funcionario

create view item2 as
select concat(e.first_name, ' ', e.last_name) as nome, concat('US$ ',format(max(s.salary) * 1, 2, 'de_DE')) as custo_anual from employees as e
natural join salaries as s
inner join dept_emp as de on (e.emp_no = de.emp_no)
group by nome;


-- item 3

CREATE table gasto_anual_dept AS
select `ed`.`dept_no` AS `id_departamento`,
		`ed`.`dept_name` AS `departamento`,
		sum(`es`.`salary`) AS `gasto_ano_dept`,
		extract(year from `es`.`from_date`) AS `ano`
from ((`employees`.`salaries` `es` 
	join `employees`.`dept_emp` `ede` on((`es`.`emp_no` = `ede`.`emp_no`)))
    join `employees`.`departments` `ed` on((`ede`.`dept_no` = `ed`.`dept_no`)))
group by `ed`.`dept_no`,extract(year from `es`.`from_date`);


CREATE VIEW item3 AS
select `ed`.`dept_no` AS `id_departamento`,`ed`.`dept_name` AS 
`departamento`,concat('US$ ',format(sum(`es`.`salary`),2,'de_DE')) AS 
`gasto_ano_dept`,extract(year from `es`.`from_date`) AS `ano` from
 ((`employees`.`salaries` `es` join `employees`.`dept_emp` `ede` 
 on((`es`.`emp_no` = `ede`.`emp_no`))) join `employees`.`departments` `ed` 
 on((`ede`.`dept_no` = `ed`.`dept_no`)))
 group by `ed`.`dept_no`,extract(year from `es`.`from_date`);



-- item 4

		
create table custo_func_ano AS
SELECT EE.emp_no AS id_func,
	DE.dept_no AS id_departamento,
	CONCAT(EE.first_name, " ", EE.last_name) AS nome_func,
	ES.salary AS salario_ano,
	EXTRACT(YEAR FROM (ES.from_date)) AS ano
FROM employees.employees EE
	INNER JOIN employees.salaries ES ON (EE.emp_no=ES.emp_no)
	INNER JOIN employees.dept_emp DE ON (ES.emp_no=DE.emp_no);
	
	
create view item4_a AS
SELECT EE.emp_no AS id_func,
	DE.dept_no AS id_departamento,
	CONCAT(EE.first_name, " ", EE.last_name) AS nome_func,
	concat('US$ ',format(ES.salary,2,'de_DE')) AS salario_ano,
	EXTRACT(YEAR FROM (ES.from_date)) AS ano
FROM employees.employees EE
	INNER JOIN employees.salaries ES ON (EE.emp_no=ES.emp_no)
	INNER JOIN employees.dept_emp DE ON (ES.emp_no=DE.emp_no);
	



CREATE table gasto_percentual_func AS
	SELECT 	id_func,
			nome_func,
			salario_ano,
			departamento,
			gasto_ano_dept,
			custo_func_ano.ano,
			FORMAT((salario_ano/gasto_ano_dept)*100,3) AS gasto_perc_do_dept
FROM custo_func_ano
INNER JOIN gasto_anual_dept ON ((custo_func_ano.id_departamento = gasto_anual_dept.id_departamento) AND (custo_func_ano.ano = gasto_anual_dept.ano));


CREATE VIEW item_4b AS
SELECT 	id_func,
		nome_func,
		concat('US$ ',format(salario_ano,2,'de_DE')) as salario_ano,
		departamento,
		concat('US$ ',format(gasto_ano_dept,2,'de_DE')) as gasto_ano_dept,
		custo_func_ano.ano,
		FORMAT((salario_ano/gasto_ano_dept)*100,3) AS gasto_perc_do_dept
FROM custo_func_ano
INNER JOIN gasto_anual_dept ON ((custo_func_ano.id_departamento = gasto_anual_dept.id_departamento) AND (custo_func_ano.ano = gasto_anual_dept.ano));



-- item 5

create VIEW item5 as
SELECT *
FROM employees.gasto_percentual_func WHERE
(0.01>=gasto_perc_do_dept) and (gasto_perc_do_dept<=0.1)
group by id_func;




-- item 6

create view item6 as
SELECT *
FROM employees.gasto_percentual_func
WHERE (gasto_perc_do_dept>0.1)
group by id_func;




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