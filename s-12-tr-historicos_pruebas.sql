set serveroutput on

Prompt
Prompt
Prompt
Prompt ======================================================================
Prompt Prueba 1 - Positiva
prompt Insertando en vehiculo
Prompt ======================================================================

insert into vehiculo(vehiculo_id, fecha_status, año, num_serie, es_transporte_pub, es_carga, es_particular, fecha_inicio, fecha_fin, 
  num_serie_dispositivo, fecha_registro_dispositivo, propietario_id, status_vehiculo_id, modelo_id)
  values(vehiculo_seq.nextval, to_date('18-03-2023', 'dd-mm-yyyy'), 2024, '1ZZA', 0, 0, 1, to_date('18-03-2023', 'dd-mm-yyyy'), null, 'DISP999', 
  to_date('18-03-2023', 'dd-mm-yyyy'), 1, 1, 3);

declare
  v_count number;
  v_vehiculo_id number;
begin
  v_vehiculo_id := vehiculo_seq.currval;
  select count(*) into v_count
  from hist_status_vehiculo
  where vehiculo_id = v_vehiculo_id
    and status_vehiculo_id = 1
    and fecha_status = to_date('18-03-2023', 'dd-mm-yyyy');
  if v_count > 0 then
    dbms_output.put_line('-> Se inserto correctamente en historico!');
  else 
    raise_application_error(-20013, '-> No se inserto en historico, corregir trigger');
  end if;
end;
/
show errors


Prompt
Prompt
Prompt Mostrando los datos del historico
select * from hist_status_vehiculo
where status_vehiculo_id = 1
  and fecha_status = to_date('18-03-2023', 'dd-mm-yyyy');


Prompt Prueba 1 concluida

Prompt
Prompt
Prompt
Prompt ======================================================================
Prompt Prueba 2 - Positiva
prompt Modificando status del vehiculo insertado
Prompt ======================================================================

declare
  v_vehiculo_id number;
  v_count number;
begin
  v_vehiculo_id := vehiculo_seq.currval;
  update vehiculo
  set status_vehiculo_id = 2,
    fecha_status = to_date('25-03-2023', 'dd-mm-yyyy')
  where vehiculo_id = v_vehiculo_id;
  select count(*) into v_count
  from hist_status_vehiculo
  where vehiculo_id = v_vehiculo_id
    and status_vehiculo_id = 2
    and fecha_status = to_date('25-03-2023', 'dd-mm-yyyy');
  if v_count > 0 then
    dbms_output.put_line('-> Se inserto correctamente en historico!');
  else 
    raise_application_error(-20015, '-> No se inserto en historico, corregir trigger');
  end if;
end;
/
show errors


Prompt
Prompt
Prompt Mostrando los datos del historico
select * from hist_status_vehiculo
where status_vehiculo_id = 2
  and fecha_status = to_date('25-03-2023', 'dd-mm-yyyy');


Prompt Prueba 2 concluida


Prompt
Prompt
Prompt
Prompt ========================================================================
Prompt Prueba 3 - Negativa
prompt Cambiando el propietario de un vehiculo que aun tiene propietario actual
Prompt ========================================================================

declare 
  v_codigo number;
  v_msg varchar2(1000);
  v_vehiculo_id number;
begin
  v_vehiculo_id := vehiculo_seq.currval;
  update vehiculo
  set propietario_id = 2
  where vehiculo_id = v_vehiculo_id;
  exception
  when others then
    v_codigo := sqlcode;
    v_msg := sqlerrm;
    dbms_output.put_line('Codigo:  ' || v_codigo);
    dbms_output.put_line('Mensaje: ' || v_msg);
    if v_codigo = -20001 then
      dbms_output.put_line('-> Trigger se activó, prueba exitosa!');
    else
      dbms_output.put_line('-> ERROR, excepción no esperada.');
      raise;
    end if;
end;
/
show errors

Prompt Prueba 3 concluida


Prompt
Prompt
Prompt
Prompt ==========================================================================
Prompt Prueba 4 - Positiva
prompt Cambiando el propietario de un vehiculo que ya no tiene propietario actual
Prompt ==========================================================================

declare
  v_vehiculo_id number;
  v_count number;
begin
  v_vehiculo_id := vehiculo_seq.currval;
  -- Actualizando vehiculo actual
  update vehiculo
  set fecha_fin = to_date('01-04-2023', 'dd-mm-yyyy')
  where vehiculo_id = v_vehiculo_id
    and propietario_id = 1;
  -- Cambiando propietario
  update vehiculo
  set propietario_id = 2, 
    fecha_inicio = to_date('03-04-2023', 'dd-mm-yyyy'), 
    fecha_fin = null
  where vehiculo_id =v_vehiculo_id;
  -- Consultando datos en historico de propietarios
  select count(*) into v_count
  from hist_propietarios
  where vehiculo_id = v_vehiculo_id
    and propietario_id = 1;
  if v_count > 0 then
    dbms_output.put_line('-> Se inserto correctamente en historico!');
  else 
    raise_application_error(-20015, '-> No se inserto en historico, corregir trigger');
  end if;
end;
/
show errors


Prompt
Prompt
Prompt Mostrando datos del historico
select * from hist_propietarios where propietario_id = 1;

Prompt Mostrando datos del vehiculo actual
select * from vehiculo where propietario_id = 2;

Prompt
Prompt
Prompt
Prompt Pruebas concluidas, haciendo rollback
rollback;