delimiter $$
create procedure verificar_quantidade_produtos(out quantidade int)
begin
 select count(*) into quantidade from produto;
end $$
delimiter ;