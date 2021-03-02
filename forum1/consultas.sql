use bdforum1;
select sum(salario) from funcionario;
select format(avg(salario),2) from funcionario;
select max(salario),nome,cidade from funcionario;
select min(salario),nome,cidade from funcionario;
select count(nome) from funcionario
where salario < 4000;


