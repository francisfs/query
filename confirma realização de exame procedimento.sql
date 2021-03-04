drop procedure if exists confirmar_realizacao_exame;
delimiter $$
create procedure confirmar_realizacao_exame (in work_id int)
	begin
		select wa.agendamento_id
        , func_valor_proc 
        into @agenda_id, @valor from worklist_aparelhos wa
        inner join agendamento a on a.agendamento_id = wa.agendamento_id
        where wa.worklist_id = work1_id;
        
        update agendamento a
 set a.realizado = 'S'
 , a.valor = @valor
where a.agendamento_id = @agend_id;
end $$
delimiter ;

        