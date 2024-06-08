--@Autor(es):       Bueno Hernández Héctor Daniel, Fernández Cano Iván Antonio
--@Fecha creación:  06/06/2024
--@Descripción:     Proyecto final - Pruebas para el trigger tr_puntos_negativos

set serveroutput on

Prompt
Prompt
Prompt
Prompt =======================================================================
Prompt Prueba 1 - Positiva
prompt Sumando puntos negativos a un propietario que no ha tenido infracciones
Prompt =======================================================================

insert into infraccion(folio, propietario_id, fecha, descripcion, puntos_asignados, pdf)
  values(1, 1, sysdate, 'El conductor pasó un alto', 20, empty_blob());

insert into infraccion(folio, propietario_id, fecha, descripcion, puntos_asignados, pdf)
  values(2, 1, sysdate, 'El conductor chocó', 100, empty_blob());

insert into infraccion(folio, propietario_id, fecha, descripcion, puntos_asignados, pdf)
  values(3, 1, sysdate, 'El conductor se estacionó en un lugar prohibido', 50, empty_blob());

--Validando que los puntos negativos fueron sumados
declare
  v_puntos number;
begin
  select puntos_neg_totales into v_puntos
    from propietario
  where propietario_id = 1;
  if v_puntos = 170 then
    dbms_output.put_line('Los puntos fueron sumados correctamente.');
  else
    raise_application_error(-20004, 'Error, Los puntos no se sumaron correctamente. Corregir trigger.');
  end if;
end;
/
show errors

Prompt Prueba 1 concluida

Prompt
Prompt
Prompt
Prompt ==========================================================================
Prompt Prueba 2 - Positiva
prompt Insertando puntos negativos a un propietario que ya ha tenido infracciones
Prompt ==========================================================================

update propietario
set puntos_neg_totales = 50
where propietario_id = 2;

insert into infraccion(folio, propietario_id, fecha, descripcion, puntos_asignados, pdf)
  values(4, 2, sysdate, 'El conductor chocó', 100, empty_blob());

--Validando que los puntos negativos fueron sumados
declare
  v_puntos number;
begin
  select puntos_neg_totales into v_puntos
    from propietario
  where propietario_id = 2;
  if v_puntos = 150 then
    dbms_output.put_line('Los puntos fueron sumados correctamente.');
  else
    raise_application_error(-20004, 'Error, Los puntos no se sumaron correctamente. Corregir trigger.');
  end if;
end;
/
show errors

Prompt Prueba 2 concluida

rollback;