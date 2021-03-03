select * ,fnc_preco_total(cp.preco, cp.quantidade) preco_total
from compra_produto cp