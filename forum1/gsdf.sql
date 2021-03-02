delimiter $$ 
create procedure elevar_ao_quadrado(inout numero int)
begin 
	set numero = numero * numero;
end $$
delimiter ;