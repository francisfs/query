use imobiliaria_francisley_ti2_ag_04;
select  p.nome, telefone_prop, valor, count(nome) qtd_apartamento, sum(valor) patrimonio_total  from proprietario p
inner join proprietario_apartamento pa on p.proprietario_id = pa.proprietario_id
inner join apartamento ap on ap.num_apto_id = pa.num_apto_id
group by nome
order by nome;