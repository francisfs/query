update professor 
set salario = salario * 1.03
where salario < 1400 or salario > 1700;
select * from professor;