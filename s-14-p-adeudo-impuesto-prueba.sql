--@Autor(es):       Bueno Hernández Héctor Daniel, Fernández Cano Iván Antonio
--@Fecha creación:  07/06/2024
--@Descripción:     Proyecto final - Pruebas para el procedimiento p_adeudo_impuesto

set serveroutput on

Prompt
Prompt
Prompt ===============================================================================
Prompt Prueba iniciada
Prompt Considerar que se utilizarán dos autos ya registrados para verificar su estatus
Prompt y el periodo de pago del impuesto es de un año 
Prompt ===============================================================================
Prompt Datos iniciales

set linesize window

select v.vehiculo_id, v.status_vehiculo_id, s.nombre, p.fecha_pago_impuesto
  from vehiculo v, status_vehiculo s, particular p
where v.vehiculo_id = p.vehiculo_id
  and v.status_vehiculo_id = s.status_vehiculo_id
  and (v.vehiculo_id = 1 or v.vehiculo_id = 5);

Prompt
Prompt
Prompt
Prompt ============================================================================================
Prompt Prueba 1
prompt Verificar si el propietario del vehiculo con vehiculo_id = 1 cuenta con una licencia vigente
Prompt ============================================================================================
Prompt

declare
  v_status number;
begin
  p_adeudo_impuesto(sysdate);
  select status_vehiculo_id into v_status
    from vehiculo
  where vehiculo_id = 1;
  if v_status = 1 then
    dbms_output.put_line('El procedimiento funciona adecuadamente ya que no se modificó el estatus del vehiculo.');
  else
    raise_application_error(-20010, 'Error. El estatus fue modificado indebidamente. Corregir procedimiento');
  end if;
end;
/
show errors

select v.vehiculo_id, v.status_vehiculo_id, s.nombre, p.fecha_pago_impuesto
  from vehiculo v, status_vehiculo s, particular p
where v.vehiculo_id = p.vehiculo_id
  and v.status_vehiculo_id = s.status_vehiculo_id
  and v.vehiculo_id = 1;

Prompt Prueba 1 concluida
Prompt Haciendo rollback para limpiar la BD
rollback;

Prompt
Prompt
Prompt
Prompt ============================================================================================
Prompt Prueba 2
prompt Verificar si el propietario del vehiculo con vehiculo_id = 5 cuenta con una licencia vigente
Prompt ============================================================================================
Prompt

declare
  v_status number;
begin
  p_adeudo_impuesto(sysdate);
  select status_vehiculo_id into v_status
    from vehiculo
  where vehiculo_id = 5;
  if v_status = 3 then
    dbms_output.put_line('El procedimiento funciona adecuadamente ya que no se modificó el estatus del vehiculo.');
  else
    raise_application_error(-20012, 'Error. El estatus no fue modificado. Corregir procedimiento.');
  end if;
end;
/
show errors

select v.vehiculo_id, v.status_vehiculo_id, s.nombre, p.fecha_pago_impuesto
  from vehiculo v, status_vehiculo s, particular p
where v.vehiculo_id = p.vehiculo_id
  and v.status_vehiculo_id = s.status_vehiculo_id
  and v.vehiculo_id = 5;

Prompt Prueba 2 concluida
Prompt Haciendo rollback para limpiar la BD
rollback;
