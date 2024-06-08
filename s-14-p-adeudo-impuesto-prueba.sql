--@Autor(es):       Bueno Hernández Héctor Daniel, Fernández Cano Iván Antonio
--@Fecha creación:  07/06/2024
--@Descripción:     Proyecto final - Pruebas para el procedimiento p_adeudo_impuesto

set serveroutput on

Prompt
Prompt
Prompt ===============================================================================
Prompt Prueba iniciada
Prompt Considerar que se utilizarán dos autos ya registrados para verificar su estatus
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