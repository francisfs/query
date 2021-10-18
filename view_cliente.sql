USE MINIMERCADO;
create view cliente_vw (nome_cliente, endereco_cliente) as 
	select nome, endereco from cliente;
