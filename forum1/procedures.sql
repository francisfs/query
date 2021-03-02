use imobiliaria;
DELIMITER $$
create procedure atualizacao_valores_apto (in codigo_cond int, taxa decimal)
BEGIN
	 update apartamento a
     set a.valor = (a.valor + a.valor * taxa) / 100;
     select a.valor from apartamento;
    
     
END$$
    
    delimiter ;
    -- ALUNO FRANCISLEY FERNANDES DE SOUZA
    
    
	













