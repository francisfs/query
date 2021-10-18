delimiter $$
create function valor_cond_apto (apt_num varchar(5), vl_taxa double)
returns double deterministic
	begin 
		declare cond_valor double;
        declare taxa_valor double;
        declare taxa double;
		set cond_valor = (select valor from apartamento 
						where apartamento.numero = apt_num);
                        set taxa = cond_valor * (vl_taxa / 100);
		return taxa ;
        end $$
delimiter ;

