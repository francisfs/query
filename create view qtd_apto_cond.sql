use imobiliaria;

create view qtd_apto_cond as
	select count(numero)quantidade_apartamento_por_condominio, codigo_cond from apartamento
group by codigo_cond