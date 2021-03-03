delimiter $$
create function fnc_multiplica (a int, b int)
returns int deterministic
begin
	set @r = a * b;
    return @r;
end $$

delimiter ;
