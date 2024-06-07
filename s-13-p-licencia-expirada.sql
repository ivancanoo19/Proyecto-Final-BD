--@Autor(es):       Bueno Hernández Héctor Daniel, Fernández Cano Iván Antonio
--@Fecha creación:  07/06/2024
--@Descripción:     Proyecto final - Procedimiento para detectar una licencia expirada

connect BF_PROY_ADMIN/admin
set serveroutput on
create or replace procedure p_licencia_expirada(
    p_fecha_fin in date
)is 
  cursor cur_licencia is
    select propietario_id
      from licencia
    where fecha_fin < p_fecha_fin;
begin
  for r in cur_licencia loop
    update vehiculo
    set status_vehiculo_id = 2
    where propietario_id = r.propietario_id;
  end loop;
  dbms_output.put_line('El estatus de los vehículos con licencia expirada fue actualizado.');
end;
/
show errors