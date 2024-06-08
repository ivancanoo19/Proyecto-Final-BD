--@Autor(es):       Bueno Hernández Héctor Daniel, Fernández Cano Iván Antonio
--@Fecha creación:  07/06/2024
--@Descripción:     Proyecto final - Pruebas para la funcion fx_num_serie_vehiculo

Prompt
Prompt
Prompt =============================================================================================
Prompt Prueba iniciada
Prompt Considerar que se utilizarán tres autos ya registrados para calcular el importe de su seguro
Prompt El criterio para la generación del número de serie es la siguiente:
Prompt      - Primeras dos letras de la marca del vehículo
Prompt      - Primeras dos letras del modelo del vehículo
Prompt      - Últimos dos años del modelo del vehículo
Prompt      - Identificador único conformado por cuatro números aleatorios
Prompt =============================================================================================
Prompt 

col marca format a15
col modelo format a15

Prompt
Prompt
Prompt
Prompt ===================================================
Prompt Prueba 1
prompt Calcular el seguro del vehiculo con vehiculo_id = 3
Prompt ===================================================
Prompt

select v.vehiculo_id, ma.descripcion as marca, mo.nombre as modelo, v.año
  from vehiculo v, modelo mo, marca ma
where v.modelo_id = mo.modelo_id
  and mo.marca_id = ma.marca_id
  and vehiculo_id = 3;

declare
  v_marca number;
  v_modelo number;
  v_año number;
  v_num_serie varchar2(10);
begin
  select v.modelo_id, v.año, m.marca_id
    into v_modelo, v_año, v_marca
    from vehiculo v, modelo m
  where v.modelo_id = m.modelo_id
    and v.vehiculo_id = 3;
  v_num_serie := fx_num_serie_vehiculo(v_marca, v_modelo, v_año);
  dbms_output.put_line('Número de serie del vehículo: '||v_num_serie);
end;
/

Prompt Prueba 1 concluida

Prompt
Prompt
Prompt
Prompt ===================================================
Prompt Prueba 2
prompt Calcular el seguro del vehiculo con vehiculo_id = 7
Prompt ===================================================
Prompt

select v.vehiculo_id, ma.descripcion as marca, mo.nombre as modelo, v.año
  from vehiculo v, modelo mo, marca ma
where v.modelo_id = mo.modelo_id
  and mo.marca_id = ma.marca_id
  and vehiculo_id = 7;

declare
  v_marca number;
  v_modelo number;
  v_año number;
  v_num_serie varchar2(10);
begin
  select v.modelo_id, v.año, m.marca_id
    into v_modelo, v_año, v_marca
    from vehiculo v, modelo m
  where v.modelo_id = m.modelo_id
    and v.vehiculo_id = 7;
  v_num_serie := fx_num_serie_vehiculo(v_marca, v_modelo, v_año);
  dbms_output.put_line('Número de serie del vehículo: '||v_num_serie);
end;
/

Prompt Prueba 2 concluida

Prompt
Prompt
Prompt
Prompt ====================================================
Prompt Prueba 3
prompt Calcular el seguro del vehiculo con vehiculo_id = 14
Prompt ====================================================
Prompt

select v.vehiculo_id, ma.descripcion as marca, mo.nombre as modelo, v.año
  from vehiculo v, modelo mo, marca ma
where v.modelo_id = mo.modelo_id
  and mo.marca_id = ma.marca_id
  and vehiculo_id = 14;

declare
  v_marca number;
  v_modelo number;
  v_año number;
  v_num_serie varchar2(10);
begin
  select v.modelo_id, v.año, m.marca_id
    into v_modelo, v_año, v_marca
    from vehiculo v, modelo m
  where v.modelo_id = m.modelo_id
    and v.vehiculo_id = 14;
  v_num_serie := fx_num_serie_vehiculo(v_marca, v_modelo, v_año);
  dbms_output.put_line('Número de serie del vehículo: '||v_num_serie);
end;
/

Prompt Prueba 3 concluida