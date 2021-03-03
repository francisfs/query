delimiter $$
create function fnc_valor_compra (cod_compra int)
returns double deterministic
begin
	declare total_compra double;
    set total_compra = (select sum(fnc_preco_total(cp.quantidade, cp.preco))
						from compra_produto cp
                        where cp.codigo_compra = cod_compra);
	return total_compra;
end $$
delimiter ;

select fnc_valor_compra(2) total_compra;
