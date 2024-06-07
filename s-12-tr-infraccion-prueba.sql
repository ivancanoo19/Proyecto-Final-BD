set serveroutput on

Prompt
Prompt
Prompt
Prompt ======================================================================
Prompt Prueba 1 - Positiva
prompt Insertando infracciones a un propietario que no ha tenido infracciones
Prompt ======================================================================

insert into infraccion(folio, propietario_id, fecha, descripcion, puntos_asignados, pdf)
  values(1, 1, sysdate, 'El conductor pasó un alto', 20, empty_blob());

Prompt Mostrandos los datos de infracciones
select * from infraccion;

Prompt Prueba 1 concluida


Prompt
Prompt
Prompt
Prompt =========================================================================================
Prompt Prueba 2 - Positiva
prompt Insertando infracciones a un propietario que no ha tenido infracciones y ademas con folio
Prompt que no coincide (se inserta automaticamente)
Prompt =========================================================================================

insert into infraccion(folio, propietario_id, fecha, descripcion, puntos_asignados, pdf)
  values(50, 2, sysdate, 'El conductor pasó un alto', 20, empty_blob());

Prompt Mostrandos los datos de infracciones
select * from infraccion;

Prompt Prueba 2 concluida


Prompt
Prompt
Prompt
Prompt =========================================================================================
Prompt Prueba 3 - Positiva
prompt Insertando multiples infracciones a un propietario que no ha tenido infracciones
Prompt =========================================================================================

insert into infraccion(folio, propietario_id, fecha, descripcion, puntos_asignados, pdf)
  values(1, 3, sysdate, 'El conductor pasó un alto', 20, empty_blob());

insert into infraccion(folio, propietario_id, fecha, descripcion, puntos_asignados, pdf)
  values(2, 3, sysdate, 'El conductor chocó', 100, empty_blob());

insert into infraccion(folio, propietario_id, fecha, descripcion, puntos_asignados, pdf)
  values(88, 3, sysdate, 'El conductor pasó un alto', 20, empty_blob());

insert into infraccion(folio, propietario_id, fecha, descripcion, puntos_asignados, pdf)
  values(50, 3, sysdate, 'El conductor rebasó el lim. de velocidad', 80, empty_blob());

Mostrando los datos de infraccion
select * from infraccion where propietario_id = 3;

Prompt Prueba 3 concluida

Prompt
Prompt
Prompt
Prompt ===============================================================================
Prompt Prueba 4 - Positiva
prompt Insertando infracciones a un propietario que ya cuenta con infracciones previas
Prompt ===============================================================================


insert into infraccion(folio, propietario_id, fecha, descripcion, puntos_asignados, pdf)
  values(1, 1, sysdate, 'El conductor rebasó el lim. de velocidad', 80, empty_blob());

Prompt Mostrandos los datos de infracciones
select * from infraccion where propietario_id = 1;


Prompt
Prompt
Prompt
Prompt Prueba concluida, haciendo rollback para limpiar la BD
rollback;