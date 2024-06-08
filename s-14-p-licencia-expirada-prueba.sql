--@Autor(es):       Bueno Hernández Héctor Daniel, Fernández Cano Iván Antonio
--@Fecha creación:  07/06/2024
--@Descripción:     Proyecto final - Pruebas para el procedimiento p_licencia_expirada

set serveroutput on

Prompt
Prompt
Prompt ===============================================================================
Prompt Prueba iniciada
Prompt Considerar que se utilizarán dos autos ya registrados para verificar su estatus
Prompt ===============================================================================
Prompt Datos iniciales

set linesize window

select * from vehiculo
where vehiculo_id = 2
 or vehiculo_id  = 9;

Prompt
Prompt
Prompt
Prompt ============================================================================================
Prompt Prueba 1
prompt Verificar si el propietario del vehiculo con vehiculo_id = 2 cuenta con una licencia vigente
Prompt ============================================================================================
Prompt

declare
  v_status number;
begin
  p_licencia_expirada(sysdate);
  select status_vehiculo_id into v_status
    from vehiculo
  where vehiculo_id = 2;
  if v_status = 1 then
    dbms_output.put_line('El procedimiento funciona adecuadamente ya que no se modificó el estatus del vehiculo.');
  else
    raise_application_error(-20010, 'Error. El estatus fue modificado indebidamente. Corregir procedimiento');
  end if;
end;
/
show errors

select vehiculo_id, fecha_status, status_vehiculo_id
  from vehiculo
where vehiculo_id = 2;

Prompt Prueba 1 concluida
Prompt Haciendo rollback para limpiar la BD
rollback;

Prompt
Prompt
Prompt
Prompt ============================================================================================
Prompt Prueba 2
prompt Verificar si el propietario del vehiculo con vehiculo_id = 9 cuenta con una licencia vigente
Prompt ============================================================================================
Prompt

declare
  v_status number;
begin
  p_licencia_expirada(sysdate);
  select status_vehiculo_id into v_status
    from vehiculo
  where vehiculo_id = 9;
  if v_status = 2 then
    dbms_output.put_line('El procedimiento funciona adecuadamente ya que no se modificó el estatus del vehiculo.');
  else
    raise_application_error(-20012, 'Error. El estatus no fue modificado. Corregir procedimiento');
  end if;
end;
/
show errors

select vehiculo_id, fecha_status, status_vehiculo_id
  from vehiculo
where vehiculo_id = 9;

Prompt Prueba 2 concluida
Prompt Haciendo rollback para limpiar la BD
rollback;