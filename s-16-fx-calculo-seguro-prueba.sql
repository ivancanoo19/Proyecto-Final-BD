--@Autor(es):       Bueno Hernández Héctor Daniel, Fernández Cano Iván Antonio
--@Fecha creación:  07/06/2024
--@Descripción:     Proyecto final - Pruebas para la funcion fx_calculo_seguro

set serveroutput on


Prompt
Prompt
Prompt =============================================================================================
Prompt Prueba iniciada
Prompt Considerar que se utilizarán tres autos ya registrados para calcular el importe de su seguro
Prompt El criterio para el cálculo del seguro es el siguiente:
Prompt      - Precio inicial -> 6000
Prompt      - Por cada bolsa de aire se restan 250
Prompt      - Si el vehiculo tiene frenos abs, se restan 1000
Prompt      - Si el vehiculo tiene transmision automática, se restan 1000
Prompt =============================================================================================
Prompt 


Prompt
Prompt
Prompt
Prompt ====================================================
Prompt Prueba 1
prompt Calcular el seguro del vehiculo con vehiculo_id = 1
Prompt ===================================================
Prompt

select p.vehiculo_id, p.num_bolsas_aire, p.abs as frenos_abs, t.nombre as tipo_transmision
  from particular p, tipo_transmision t
where p.tipo_transmision_id = t.tipo_transmision_id
  and p.vehiculo_id = 1;

declare
  v_bolsas_aire number;
  v_abs number;
  v_tipo_trans number;
  v_seguro number;
begin
  select num_bolsas_aire, abs, tipo_transmision_id
    into v_bolsas_aire, v_abs, v_tipo_trans
    from particular
  where vehiculo_id = 1;
  v_seguro := fx_calculo_seguro(v_bolsas_aire, v_abs, v_tipo_trans);
  dbms_output.put_line('Importe a pagar del seguro: $'||v_seguro);
end;
/

Prompt Prueba 1 concluida

Prompt
Prompt
Prompt
Prompt ====================================================
Prompt Prueba 2
prompt Calcular el seguro del vehiculo con vehiculo_id = 5
Prompt ===================================================
Prompt

select p.vehiculo_id, p.num_bolsas_aire, p.abs as frenos_abs, t.nombre as tipo_transmision
  from particular p, tipo_transmision t
where p.tipo_transmision_id = t.tipo_transmision_id
  and p.vehiculo_id = 5;

declare
  v_bolsas_aire number;
  v_abs number;
  v_tipo_trans number;
  v_seguro number;
begin
  select num_bolsas_aire, abs, tipo_transmision_id
    into v_bolsas_aire, v_abs, v_tipo_trans
    from particular
  where vehiculo_id = 5;
  v_seguro := fx_calculo_seguro(v_bolsas_aire, v_abs, v_tipo_trans);
  dbms_output.put_line('Importe a pagar del seguro: $'||v_seguro);
end;
/

Prompt Prueba 2 concluida

Prompt
Prompt
Prompt
Prompt ====================================================
Prompt Prueba 3
prompt Calcular el seguro del vehiculo con vehiculo_id = 13
Prompt ===================================================
Prompt

select p.vehiculo_id, p.num_bolsas_aire, p.abs as frenos_abs, t.nombre as tipo_transmision
  from particular p, tipo_transmision t
where p.tipo_transmision_id = t.tipo_transmision_id
  and p.vehiculo_id = 13;

declare
  v_bolsas_aire number;
  v_abs number;
  v_tipo_trans number;
  v_seguro number;
begin
  select num_bolsas_aire, abs, tipo_transmision_id
    into v_bolsas_aire, v_abs, v_tipo_trans
    from particular
  where vehiculo_id = 13;
  v_seguro := fx_calculo_seguro(v_bolsas_aire, v_abs, v_tipo_trans);
  dbms_output.put_line('Importe a pagar del seguro: $'||v_seguro);
end;
/

Prompt Prueba 3 concluida