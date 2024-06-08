--@Autor(es):       Bueno Hernández Héctor Daniel, Fernández Cano Iván Antonio
--@Fecha creación:  06/06/2024
--@Descripción:     Proyecto final - Pruebas para el trigger tr_num_licencias

set serveroutput on

Prompt
Prompt
Prompt
Prompt ==================================================================
Prompt Prueba 1 - Positiva
prompt Insertar una licencia a un propietario que no cuenta con licencias
Prompt ==================================================================

insert into licencia(licencia_id, licencia_anterior_id, num_licencia, foto, firma, huella_izq, fecha_inicio, fecha_fin, propietario_id, tipo_licencia_id)
  values(licencia_seq.nextval, null, 38456789, empty_blob(), empty_blob(), empty_blob(), sysdate, to_date('07/06/2027','dd/mm/yyyy'), 
  11, null);

--Validando que la licencia fue insertada
declare
  v_count number;
begin
  select count(*) into v_count
    from licencia
  where propietario_id = 11;
  if v_count = 1 then
    dbms_output.put_line('La licencia fue insertada correctamente.');
  else
    raise_application_error(-20006, 'Error, la licencia no fue insertada correctamente. Corregir trigger.');
  end if;
end;
/
show errors

Prompt
Prompt
Prompt
Prompt ====================================================================
Prompt Prueba 2 - Positiva
prompt Insertar tres licencias a un propietario que no cuenta con licencias
Prompt ====================================================================

insert into licencia(licencia_id, licencia_anterior_id, num_licencia, foto, firma, huella_izq, fecha_inicio, fecha_fin, propietario_id, tipo_licencia_id)
  values(licencia_seq.nextval, null, 82934576, empty_blob(), empty_blob(), empty_blob(), sysdate, to_date('07/06/2027','dd/mm/yyyy'), 
  12, null);

insert into licencia(licencia_id, licencia_anterior_id, num_licencia, foto, firma, huella_izq, fecha_inicio, fecha_fin, propietario_id, tipo_licencia_id)
  values(licencia_seq.nextval, null, 54123678, empty_blob(), empty_blob(), empty_blob(), sysdate, to_date('07/06/2027','dd/mm/yyyy'), 
  12, null);

insert into licencia(licencia_id, licencia_anterior_id, num_licencia, foto, firma, huella_izq, fecha_inicio, fecha_fin, propietario_id, tipo_licencia_id)
  values(licencia_seq.nextval, null, 19283745, empty_blob(), empty_blob(), empty_blob(), sysdate, to_date('07/06/2027','dd/mm/yyyy'), 
  12, null);

--Validando que la licencia fue insertada
declare
  v_count number;
begin
  select count(*) into v_count
    from licencia
  where propietario_id = 12;
  if v_count = 3 then
    dbms_output.put_line('La licencia fue insertada correctamente.');
  else
    raise_application_error(-20006, 'Error, la licencia no fue insertada correctamente. Corregir trigger.');
  end if;
end;
/
show errors

Prompt
Prompt
Prompt
Prompt ===================================================================
Prompt Prueba 3 - Positiva
prompt Insertar una licencia a un propietario que ya cuenta con licencias
Prompt ===================================================================

insert into licencia(licencia_id, licencia_anterior_id, num_licencia, foto, firma, huella_izq, fecha_inicio, fecha_fin, propietario_id, tipo_licencia_id)
  values(licencia_seq.nextval, null, 98765432, empty_blob(), empty_blob(), empty_blob(), sysdate, to_date('07/06/2027','dd/mm/yyyy'), 
  1, null);

--Validando que la licencia fue insertada
declare
  v_count number;
begin
  select count(*) into v_count
    from licencia
  where propietario_id = 1;
  if v_count = 2 then
    dbms_output.put_line('La licencia fue insertada correctamente.');
  else
    raise_application_error(-20006, 'Error, la licencia no fue insertada correctamente. Corregir trigger.');
  end if;
end;
/
show errors

Prompt
Prompt
Prompt
Prompt ======================================================================
Prompt Prueba 3 - Negativa
prompt Insertar cuatro licencias a un propietario que no cuenta con licencias
Prompt ======================================================================

--Validando que la licencia fue insertada
declare
  v_codigo number;
  v_msg varchar2(1000);
begin
  insert into licencia(licencia_id, licencia_anterior_id, num_licencia, foto, firma, huella_izq, fecha_inicio, fecha_fin, propietario_id, tipo_licencia_id)
    values(licencia_seq.nextval, null, 45678901, empty_blob(), empty_blob(), empty_blob(), sysdate, to_date('07/06/2027','dd/mm/yyyy'), 
    13, null);

  insert into licencia(licencia_id, licencia_anterior_id, num_licencia, foto, firma, huella_izq, fecha_inicio, fecha_fin, propietario_id, tipo_licencia_id)
    values(licencia_seq.nextval, null, 78901234, empty_blob(), empty_blob(), empty_blob(), sysdate, to_date('07/06/2027','dd/mm/yyyy'), 
    13, null);

  insert into licencia(licencia_id, licencia_anterior_id, num_licencia, foto, firma, huella_izq, fecha_inicio, fecha_fin, propietario_id, tipo_licencia_id)
    values(licencia_seq.nextval, null, 01234567, empty_blob(), empty_blob(), empty_blob(), sysdate, to_date('07/06/2027','dd/mm/yyyy'), 
    13, null);

  insert into licencia(licencia_id, licencia_anterior_id, num_licencia, foto, firma, huella_izq, fecha_inicio, fecha_fin, propietario_id, tipo_licencia_id)
    values(licencia_seq.nextval, null, 23456789, empty_blob(), empty_blob(), empty_blob(), sysdate, to_date('07/06/2027','dd/mm/yyyy'), 
    13, null);

  raise_application_error(-20008, 'Error. Se insertaron todas las licencias. El trigger no está funcionando');
  exception
  when others then
    v_codigo := sqlcode;
    v_msg := sqlerrm;
    dbms_output.put_line('Codigo:  ' || v_codigo);
    dbms_output.put_line('Mensaje: ' || v_msg);
    if v_codigo = -20002 then
      dbms_output.put_line('-> Trigger se activó, prueba exitosa!');
    else
      dbms_output.put_line('-> ERROR, excepción no esperada.');
      raise;
    end if;

end;
/
show errors

Prompt
Prompt
Prompt
Prompt ====================================================================
Prompt Prueba 4 - Negativa
prompt Insertar tres licencias a un propietario que ya cuenta con licencias
Prompt ====================================================================

--Validando que la licencia fue insertada
declare
  v_codigo number;
  v_msg varchar2(1000);
begin
  insert into licencia(licencia_id, licencia_anterior_id, num_licencia, foto, firma, huella_izq, fecha_inicio, fecha_fin, propietario_id, tipo_licencia_id)
    values(licencia_seq.nextval, null, 34567890, empty_blob(), empty_blob(), empty_blob(), sysdate, to_date('07/06/2027','dd/mm/yyyy'), 
    2, null);

  insert into licencia(licencia_id, licencia_anterior_id, num_licencia, foto, firma, huella_izq, fecha_inicio, fecha_fin, propietario_id, tipo_licencia_id)
    values(licencia_seq.nextval, null, 45678901, empty_blob(), empty_blob(), empty_blob(), sysdate, to_date('07/06/2027','dd/mm/yyyy'), 
    2, null);

  insert into licencia(licencia_id, licencia_anterior_id, num_licencia, foto, firma, huella_izq, fecha_inicio, fecha_fin, propietario_id, tipo_licencia_id)
    values(licencia_seq.nextval, null, 56789012, empty_blob(), empty_blob(), empty_blob(), sysdate, to_date('07/06/2027','dd/mm/yyyy'), 
    2, null);

  raise_application_error(-20008, 'Error. Se insertaron todas las licencias. El trigger no está funcionando');
  exception
  when others then
    v_codigo := sqlcode;
    v_msg := sqlerrm;
    dbms_output.put_line('Codigo:  ' || v_codigo);
    dbms_output.put_line('Mensaje: ' || v_msg);
    if v_codigo = -20002 then
      dbms_output.put_line('-> Trigger se activó, prueba exitosa!');
    else
      dbms_output.put_line('-> ERROR, excepción no esperada.');
      raise;
    end if;
end;
/
show errors

rollback;




