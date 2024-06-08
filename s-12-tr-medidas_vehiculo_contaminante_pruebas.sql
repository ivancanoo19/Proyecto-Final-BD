set serveroutput on

Prompt
Prompt
Prompt
Prompt ======================================================================
Prompt Prueba 1 - Positiva
prompt Insertando medidas que no rebasan el limite de medida de contaminante
Prompt ======================================================================

insert into vehiculo_contaminante(vehiculo_contaminante_id, vehiculo_id, contaminante_id, medida)
  values(vehiculo_contaminante_seq.nextval, 3, 1, 0.1);

declare
  v_count number;
  v_vehiculo_contaminante_id number;
begin
  v_vehiculo_contaminante_id := vehiculo_contaminante_seq.currval;
  select count(*) into v_count
  from notificacion n
  where n.vehiculo_contaminante_id = v_vehiculo_contaminante_id;
  if v_count > 0 then
    raise_application_error(-20007, '-> Se inserto en notificacion. CORREGIR trigger/proc.');
  else 
    dbms_output.put_line('-> No se inserto en notificacion. Trigger y proc. funcionan!');
  end if;
end;
/
show errors

insert into vehiculo_contaminante(vehiculo_contaminante_id, vehiculo_id, contaminante_id, medida)
  values(vehiculo_contaminante_seq.nextval, 3, 2, 0);

declare
  v_count number;
  v_vehiculo_contaminante_id number;
begin
  v_vehiculo_contaminante_id := vehiculo_contaminante_seq.currval;
  select count(*) into v_count 
  from notificacion n
  where n.vehiculo_contaminante_id = v_vehiculo_contaminante_id;
  if v_count > 0 then
    raise_application_error(-20007, '-> Se inserto en notificacion. CORREGIR trigger/proc.');
  else 
    dbms_output.put_line('-> No se inserto en notificacion. Trigger y proc. funcionan!');
  end if;
end;
/
show errors

insert into vehiculo_contaminante(vehiculo_contaminante_id, vehiculo_id, contaminante_id, medida)
  values(vehiculo_contaminante_seq.nextval, 3, 3, 0.75);

declare
  v_count number;
  v_vehiculo_contaminante_id number;
begin
  v_vehiculo_contaminante_id := vehiculo_contaminante_seq.currval;
  select count(*) into v_count 
  from notificacion n
  where n.vehiculo_contaminante_id = v_vehiculo_contaminante_id;
  if v_count > 0 then
    raise_application_error(-20007, '-> Se inserto en notificacion. CORREGIR trigger/proc.');
  else 
    dbms_output.put_line('-> No se inserto en notificacion. Trigger y proc. funcionan!');
  end if;
end;
/
show errors

insert into vehiculo_contaminante(vehiculo_contaminante_id, vehiculo_id, contaminante_id, medida)
  values(vehiculo_contaminante_seq.nextval, 3, 4, 0.2);

declare
  v_count number;
  v_vehiculo_contaminante_id number;
begin
  v_vehiculo_contaminante_id := vehiculo_contaminante_seq.currval;
  select count(*) into v_count
  from notificacion n
  where n.vehiculo_contaminante_id = v_vehiculo_contaminante_id;
  if v_count > 0 then
    raise_application_error(-20007, '-> Se inserto en notificacion. CORREGIR trigger/proc.');
  else 
    dbms_output.put_line('-> No se inserto en notificacion. Trigger y proc. funcionan!');
  end if;
end;
/
show errors

Prompt
Prompt
Prompt Prueba 1 concluida



Prompt
Prompt
Prompt
Prompt ===========================================================================================
Prompt Prueba 2 - Positiva
prompt Insertando medidas que rebasan el limite de medidas de contaminante (solo una notificacion)
Prompt ===========================================================================================

Prompt Esta primer medida no rebasa el limite, por lo que no se inserta
insert into vehiculo_contaminante(vehiculo_contaminante_id, vehiculo_id, contaminante_id, medida)
  values(vehiculo_contaminante_seq.nextval, 3, 1, 0);

declare
  v_count number;
  v_vehiculo_contaminante_id number;
begin
  v_vehiculo_contaminante_id := vehiculo_contaminante_seq.currval;
  select count(*) into v_count
  from notificacion n
  where n.vehiculo_contaminante_id = v_vehiculo_contaminante_id;
  if v_count > 0 then
    raise_application_error(-20007, '-> Se inserto en notificacion. CORREGIR trigger/proc.');
  else 
    dbms_output.put_line('-> No se inserto en notificacion. Trigger y proc. funcionan!');
  end if;
end;
/
show errors

insert into vehiculo_contaminante(vehiculo_contaminante_id, vehiculo_id, contaminante_id, medida)
  values(vehiculo_contaminante_seq.nextval, 3, 2, 0.8);

declare
  v_count number;
  v_vehiculo_contaminante_id number;
begin
  v_vehiculo_contaminante_id := vehiculo_contaminante_seq.currval;
  select count(*) into v_count
  from notificacion n
  where n.vehiculo_contaminante_id = v_vehiculo_contaminante_id;
  if v_count > 0 then
    dbms_output.put_line('-> Se insertó en notificacion. Trigger y proc. funcionan!');
  else 
    raise_application_error(-20009, '-> No se insertó en notificacion. CORREGIR trigger/proc.');
  end if;
end;
/
show errors

insert into vehiculo_contaminante(vehiculo_contaminante_id, vehiculo_id, contaminante_id, medida)
  values(vehiculo_contaminante_seq.nextval, 3, 3, 1);

declare
  v_count number;
  v_vehiculo_contaminante_id number;
begin
  v_vehiculo_contaminante_id := vehiculo_contaminante_seq.currval;
  select count(*) into v_count
  from notificacion n
  where n.vehiculo_contaminante_id = v_vehiculo_contaminante_id;
  if v_count > 0 then
    dbms_output.put_line('-> Se insertó en notificacion. Trigger y proc. funcionan!');
  else 
    raise_application_error(-20009, '-> No se insertó en notificacion. CORREGIR trigger/proc.');
  end if;
end;
/
show errors

insert into vehiculo_contaminante(vehiculo_contaminante_id, vehiculo_id, contaminante_id, medida)
  values(vehiculo_contaminante_seq.nextval, 3, 4, 0.7);

declare
  v_count number;
  v_vehiculo_contaminante_id number;
begin
  v_vehiculo_contaminante_id := vehiculo_contaminante_seq.currval;
  select count(*) into v_count
  from notificacion n
  where n.vehiculo_contaminante_id = v_vehiculo_contaminante_id;
  if v_count > 0 then
    dbms_output.put_line('-> Se insertó en notificacion. Trigger y proc. funcionan!');
  else 
    raise_application_error(-20009, '-> No se insertó en notificacion. CORREGIR trigger/proc.');
  end if;
end;
/
show errors

Prompt Mostrando los datos insertados en notificacion
select * from notificacion;


Prompt Prueba 2 concluida

Prompt
Prompt
Prompt
Prompt ===========================================================================================
Prompt Prueba 3 - Positiva
prompt Insertando medidas que rebasan el limite de medidas de contaminante (solo una notificacion)
Prompt ===========================================================================================


insert into vehiculo_contaminante(vehiculo_contaminante_id, vehiculo_id, contaminante_id, medida, fecha_reporte)
  values(vehiculo_contaminante_seq.nextval, 3, 1, 0.9, sysdate+10);

select * from vehiculo_contaminante
where fecha_reporte = sysdate+10;

insert into vehiculo_contaminante(vehiculo_contaminante_id, vehiculo_id, contaminante_id, medida, fecha_reporte)
  values(vehiculo_contaminante_seq.nextval, 3, 2, 1.2, sysdate+20);

Prompt Mostrando los datos insertados en notificacion
select * from notificacion;

Prompt status 1
select status_vehiculo_id from vehiculo where vehiculo_id = 3;

insert into vehiculo_contaminante(vehiculo_contaminante_id, vehiculo_id, contaminante_id, medida, fecha_reporte)
  values(vehiculo_contaminante_seq.nextval, 3, 2, 1.2, sysdate+30);

Prompt status 2
select status_vehiculo_id from vehiculo where vehiculo_id = 3;

Prompt Prueba 3 concluida

Prompt
Prompt
Prompt
Prompt ===========================================================================================
Prompt Prueba 4 - Positiva
prompt Insertando medidas que rebasan el limite de medidas de contaminante (solo una notificacion)
Prompt ===========================================================================================

update vehiculo
set status_vehiculo_id = 1
where vehiculo_id = 3;

insert into vehiculo_contaminante(vehiculo_contaminante_id, vehiculo_id, contaminante_id, medida, fecha_reporte)
  values(vehiculo_contaminante_seq.nextval, 3, 2, 1.2, sysdate+40);

insert into vehiculo_contaminante(vehiculo_contaminante_id, vehiculo_id, contaminante_id, medida, fecha_reporte)
  values(vehiculo_contaminante_seq.nextval, 3, 2, 1.2, sysdate+50);

Prompt status 1
select status_vehiculo_id from vehiculo where vehiculo_id = 3;

Prompt Prueba 4 concluida

Prompt Mostrando los datos insertados en notificacion
select * from notificacion;

Promot Mostrando datos de todos los vehiculos_contaminantes
select * from vehiculo_contaminante;

Prompt
Prompt
Prompt
Prompt Prueba concluida, haciendo rollback para limpiar la BD
rollback;