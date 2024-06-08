--@Autor(es):       Bueno Hernández Héctor Daniel, Fernández Cano Iván Antonio
--@Fecha creación:  07/06/2024
--@Descripción:     Proyecto final - Procedimiento para detectar los vehículos con adeudo de impuesto

connect BF_PROY_ADMIN/admin
set serveroutput on
create or replace procedure p_adeudo_impuesto(
    p_fecha_actual in date
)is 
  cursor cur_particular is
    select vehiculo_id
      from particular
    where fecha_pago_impuesto;
begin
  for r in cur_particular loop
    update vehiculo
    set status_vehiculo_id = 3,
      fecha_status = sysdate
    where vehiculo_id = r.vehiculo_id;
  end loop;
  dbms_output.put_line('El estatus de los vehículos con adeudo de impuesto fue actualizado.');
end;
/
show errors