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


create view item_3 as
select dados.Departamento, format(sum(dados.salary * 12), 2, 'de_DE') as Custo_total_anual
from (select distinct concat(e.first_name, ' ', e.last_name) as Nome, d.dept_name as Departamento, max(s.salary) as salary from departments as d
inner join dept_emp as de on (d.dept_no = de.dept_no)
inner join dept_manager as dm on (d.dept_no = dm.dept_no)
inner join employees as e on (e.emp_no = dm.emp_no or e.emp_no = de.emp_no)
inner join salaries as s on (e.emp_no = s.emp_no)
group by e.emp_no) as dados
group by dados.Departamento;



-- item 4


create view item_4 as
select distinct 
concat(e.first_name, ' ', e.last_name) as Nome, 
d.dept_name as Departamento, 
max(s.salary) * 12 as Custo_anual,
(select Custo_total_anual from item_3 where Departamento = d.dept_name) as Custo_anual_total_departamento,
format((((max(s.salary) * 12) / (select Custo_total_anual from item_3 where Departamento = d.dept_name)) * 100), '%') as Percentual
from departments as d
inner join dept_emp as de on (d.dept_no = de.dept_no)
inner join dept_manager as dm on (d.dept_no = dm.dept_no)
inner join employees as e on (e.emp_no = dm.emp_no or e.emp_no = de.emp_no)
inner join salaries as s on (e.emp_no = s.emp_no)
group by e.emp_no;



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



DELIMITER $$
CREATE PROCEDURE exercicio_3_procedure (IN cod_departamento varchar(2))
BEGIN
set @departamento = null;
select dept_name into @departamento from departments where dept_no = cod_departamento;
select 
Departamento,
(select count(*) from item_4 where departamento = @departamento) as Total_pessoas,
Custo_anual_total_departamento,
format(custo_anual, 2, 'de_DE') as Custo_funcionario_mais_caro,
Nome
from item_4 where departamento = @departamento order by custo_anual desc limit 1;

END $$
DELIMITER ;