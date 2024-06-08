set serveroutput on

Prompt
Prompt
Prompt
Prompt ======================================================================
Prompt Prueba 1
prompt Insertando medidas que no rebasan el limite de medida de contaminante
Prompt ======================================================================

insert into verificacion(verificacion_id, fecha, folio, clave_verificentro, vehiculo_id)
  values(verificacion_seq.nextval, sysdate, 'F-VER-0083-D', '0083', 6);

insert into vehiculo_verificacion(vehiculo_verificacion_id, medida, contaminante_id, verificacion_id)
  values(vehiculo_verificacion_seq.nextval, 0.02, 1, verificacion_seq.currval);

Prompt Mostrando el estatus del vehiculo
select * from vehiculo_verificacion;
select * from vehiculo where status_vehiculo_id = 1 and vehiculo_id = 6;


Prueba 1 concluida


Prompt
Prompt
Prompt
Prompt ============================================================================
Prompt Prueba 2
prompt Insertando varias medidas que no rebasan el limite de medida de contaminante
Prompt ============================================================================


insert into vehiculo_verificacion(vehiculo_verificacion_id, medida, contaminante_id, verificacion_id)
  values(vehiculo_verificacion_seq.nextval, 0.01, 2, verificacion_seq.currval);

insert into vehiculo_verificacion(vehiculo_verificacion_id, medida, contaminante_id, verificacion_id)
  values(vehiculo_verificacion_seq.nextval, 0.1, 3, verificacion_seq.currval);

insert into vehiculo_verificacion(vehiculo_verificacion_id, medida, contaminante_id, verificacion_id)
  values(vehiculo_verificacion_seq.nextval, 0.2, 4, verificacion_seq.currval);

Prompt Mostrando el estatus del vehiculo = 1
select * from vehiculo_verificacion;
select * from vehiculo where status_vehiculo_id = 1 and vehiculo_id = 6;

Prompt
Prompt
Prompt
Prompt ============================================================================
Prompt Prueba 3
prompt Insertando medidas que SI rebasan el limite
Prompt ============================================================================

insert into verificacion(verificacion_id, fecha, folio, clave_verificentro, vehiculo_id)
  values(verificacion_seq.nextval, sysdate, 'F-VER-0083-D', '0083', 9);

insert into vehiculo_verificacion(vehiculo_verificacion_id, medida, contaminante_id, verificacion_id)
  values(vehiculo_verificacion_seq.nextval, 0.7, 4, verificacion_seq.currval);

Prompt Mostrando el estatus del vehiculo = 4
select * from vehiculo_verificacion;
select * from vehiculo where status_vehiculo_id = 4 and vehiculo_id = 7;

Prompt Prueba terminada, haciendo rollback
rollback;