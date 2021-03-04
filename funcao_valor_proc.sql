delimiter $$

create function fnc_valor_proc (cod_proc int, cod_conv int)
returns double deterministic
begin 
		declare valor_proc double (10,2);
        set valor_proc = (select p.valor from convenio_procedimento_valor p 
							where p.pro_id = cod_proc and p.convenio_id = cod_conv);
return valor_proc;
end $$
delimiter ;
        