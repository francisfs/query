delimiter $$
create function cons_sindico (cod_sind int)
returns int deterministic
	begin 
		declare sind_nom varchar(80);	
		set sind_nom = (select nome from sindico 
						where maticula = cod_sind);
		return sind_nom;
        end $$
delimiter ;

