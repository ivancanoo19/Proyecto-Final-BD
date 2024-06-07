connect BF_PROY_ADMIN/admin
set serveroutput on
create or replace procedure p_folio_infraccion(
  p_propietario_id in number, p_folio out number
) is
v_count number;
begin
  select count(*) into v_count
  from infraccion
  where propietario_id = p_propietario_id;
  if v_count > 0 then
    p_folio := v_count+1;
  else
    p_folio := 1;
  end if;
end;
/
show errors