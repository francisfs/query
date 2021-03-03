delimiter $$
create function fnc_preco_total (vl_unitario double, quantidade double)
returns double deterministic

begin 
	set @r = vl_unitario * quantidade;
    return @r; 
    
    end $$
    
    delimiter ;




