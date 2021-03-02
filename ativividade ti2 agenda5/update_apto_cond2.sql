use imobiliaria_francisley_ti2_ag_04;

update apartamento
set valor = 200000.00
where num_apto_id = 6;

update apartamento
set valor = 215000.00
where num_apto_id = 7;

update apartamento 
set valor = 225000.00
where num_apto_id = 8;

update apartamento
set valor = 235000.00 
where num_apto_id = 9;

update apartamento 
set valor = 250000.00 
where num_apto_id = 10;

select * from apartamento;