DELIMITER $$
create procedure selecionar_produtos(in quantidade int)
begin	
	select * from produto
    limit quantidade;
    
    end $$ DELIMITER ; 
