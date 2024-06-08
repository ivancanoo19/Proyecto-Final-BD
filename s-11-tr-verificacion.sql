connect BF_PROY_ADMIN/admin
set serveroutput on
create or replace trigger tr_verificacion
after insert
on vehiculo_verificacion
for each row
declare
  v_excede_limites number := 0;
begin
  case
    when :new.contaminante_id = 1 and nvl(:new.medida, 0) >= 0.2 then
      v_excede_limites := 1;
    when :new.contaminante_id = 2 and nvl(:new.medida, 0) >= 0.5 then
      v_excede_limites := 1;
    when :new.contaminante_id = 3 and nvl(:new.medida, 0) >= 0.8 then
      v_excede_limites := 1;
    when :new.contaminante_id = 4 and nvl(:new.medida, 0) >= 0.5 then
      v_excede_limites := 1;
    else
      null;
  end case;
  if v_excede_limites = 0 then
    update vehiculo
    set status_vehiculo_id = 1
    where vehiculo_id = (
      select vehiculo_id
      from verificacion
      where verificacion_id = :new.verificacion_id
    );
  else
    dbms_output.put_line('-> AVISO: El vehiculo sigue rebasando los limites de contaminantes');
  end if;
end;
/
show errors