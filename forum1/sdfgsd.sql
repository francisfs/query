use imobiliaria;
DELIMITER $$
	create procedure compra_apto (in prop varchar(15), id_apto varchar(5))
	 BEGIN 
     update imobiliaira.apartamento set proprietario
     where numero.apartameto = id apartamento
      
     END $$
     
 DELIMITER ;