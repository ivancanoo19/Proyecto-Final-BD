--@Autor(es):       Bueno Hernández Héctor Daniel, Fernández Cano Iván Antonio
--@Fecha creación:  05/06/2024
--@Descripción:     Proyecto final - Creación de objetos

prompt conectando como usuario BF_PROY_ADMIN
connect BF_PROY_ADMIN/admin

Prompt
Prompt
Prompt
Prompt Creando secuencia para vehiculo
create sequence vehiculo_seq
start with 1
increment by 1
nocycle
nocache
order;

Prompt Creando secuencia para propietario
create sequence propietario_seq
start with 1
increment by 1
nocycle
nocache
order;

Prompt Creando secuencia para placa
create sequence placa_seq
start with 1
increment by 1
nocycle
nocache
order;

Prompt Creando secuencia para entidad_pais
create sequence entidad_pais_seq
start with 1
increment by 1
nocycle
nocache
order;

Prompt Creando secuencia para hist_status_vehiculo
create sequence hist_status_vehiculo_seq
start with 1
increment by 1
nocycle
nocache
order;

Prompt Creando secuencia para hist_propietarios
create sequence hist_propietarios_seq
start with 1
increment by 1
nocycle
nocache
order;

Prompt Creando secuencia para licencia
create sequence licencia_seq
start with 1
increment by 1
nocycle
nocache
order;

Prompt Creando secuencia para marca
create sequence marca_seq
start with 1
increment by 1
nocycle
nocache
order;

Prompt Creando secuencia para modelo
create sequence modelo_seq
start with 1
increment by 1
nocycle
nocache
order;

Prompt Creando secuencia para verificacion
create sequence verificacion_seq
start with 1
increment by 1
nocycle
nocache
order;

Prompt Creando secuencia para vehiculo_verificacion
create sequence vehiculo_verificacion_seq
start with 1
increment by 1
nocycle
nocache
order;

Prompt Creando secuencia para contaminante
create sequence contaminante_seq
start with 1
increment by 1
nocycle
nocache
order;

Prompt Creando secuencia para vehiculo_contaminante
create sequence vehiculo_contaminante_seq
start with 1
increment by 1
nocycle
nocache
order;

Prompt Creando secuencia para notificacion
create sequence notificacion_seq
start with 1
increment by 1
nocycle
nocache
order;