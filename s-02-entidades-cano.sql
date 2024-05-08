--@Autor(es): Bueno Hernández Héctor Daniel, Fernández Cano Iván Antonio
--@Fecha creación: 08/05/2024
--@Descripción: Proyecto final

Prompt Conectando como admin
connect bf_proy_admin/admin

--
--  tabla vehiculo
--

Prompt Creando tabla vehiculo
create table vehiculo(
  vehiculo_id number(10,0) not null,
  fecha_status date not null,
  año number(4,0) not null,
  num_serie varchar2(18) not null,
  es_transporte_pub number(1,0) not null,
  es_carga number(1,0) not null,
  es_particular number(1,0) not null,
  fecha_inicio date not null,
  fecha_fin date null,
  num_serie_dispositivo varchar2(18) not null,
  fecha_registro_dispositivo date not null,
  --Constraints
  constraint vehiculo_pk primary key(vehiculo_id),
  constraint vehiculo_num_serie_dispositivo_uk unique(num_serie_dispositivo),
  constraint vehiculo_tipo_chk check(
    (es_transporte_pub=1 and es_carga=0 and es_particular=0)
    or
    (es_transporte_pub=0 and es_carga=1 and es_particular=0)
    or
    (es_transporte_pub=0 and es_carga=0 and es_particular=1)
    or
    (es_transporte_pub=0 and es_carga=1 and es_particular=1)
  )
);

--
--  tabla tipo_licencia
--

Prompt Creando tabla tipo_licencia
create table tipo_licencia(
  tipo_licencia_id number(10,0) not null,
  nombre char(1) not null,
  descripcion varchar2(100) not null,
  --CONSTRAINTS
  constraint tipo_licencia_pk primary key(tipo_licencia_id)
);

--
--  tabla licencia
--

Prompt Creando tabla licencia
create table licencia(
  licencia_id number(10,0) not null,
  num_licencia number(8,0) not null,
  foto blob not null,
  firma blob not null,
  huella_izq blob not null,
  fecha_inicio date not null,
  fecha_fin date not null,
  licencia_anterior_id,
  propietario_id,
  tipo_licencia_id,
  --CONSTRAINTS
  constraint licencia_pk primary key(licencia_id),
  constraint licencia_licencia_anterior_id_fk foreign key(licencia_anterior_id)
    references licencia(licencia_id),
  constraint licencia_propietario_id_fk foreign key(propietario_id)
    references propietario(propietario_id),
  constraint licencia_tipo_licencia_id_fk foreign key(tipo_licencia_id)
    references tipo_licencia(tipo_licencia_id)
);

--
--  tabla infraccion
--

Prompt Creando tabla infraccion
create table infraccion(
  folio number(4,0) not null,
  propietario_id,
  fecha date not null,
  descripcion varchar2(200) not null,
  puntos_asignados number(5,0) not null,
  pdf blob not null,
  --CONSTRAINTS
  constraint infraccion_propietario_id_fk foreign key(propietario_id)
    references propietario(propietario_id),
  constraint infraccion_pk primary key(folio,propietario_id)
);

--
--  tabla contaminante
--

Prompt Creando tabla contaminante
create table contaminante(
  contaminante_id number(10,0) not null,
  clave varchar2(4) not null,
  rango number(4,3) null,
  nombre varchar2(200) not null,
  --CONSTRAINTS
  constraint contaminante_pk primary key(contaminante_id)
);

--
--  tabla verificacion
--

Prompt Creando tabla verificacion
create table verificacion(
  verificacion_id number(10,0) not null,
  fecha date not null,
  folio varchar2(13) not null,
  clave_verificentro varchar2(5) not null,
  vehiculo_id,
  --CONSTRAINTS
  constraint verificacion_pk primary key(verificacion_id),
  constraint verificacion_vehiculo_id_fk foreign key(vehiculo_id)
    references vehiculo(vehiculo_id)
);

--
--  tabla vehiculo_contaminante
--

Prompt Creando tabla vehiculo_contaminante
create table vehiculo_contaminante(
  vehiculo_contaminante_id number(10,0) not null,
  medida number(5,2) not null,
  vehiculo_id,
  contaminante_id,
  --CONSTRAINTS
  constraint vehiculo_contaminante_id_pk primary key(vehiculo_contaminante_id),
  constraint vehiculo_contaminante_vehiculo_id_fk foreign key(vehiculo_id)
    references vehiculo(vehiculo_id),
  constraint vehiculo_contaminante_contaminante_id_fk foreign key(contaminante_id)
    references contaminante(contaminante_id)
);

--
--  tabla notificacion
--

Prompt Creando tabla notificacion
create table notificacion(
  notificacion_id number(10,0) not null,
  num_notificacion number(1,0) not null,
  fecha_envio date not null,
  vehiculo_contaminante_id,
  --CONSTRAINTS
  constraint notificacion_pk primary key(notificacion_id),
  constraint notificacion_vehiculo_contaminante_id_fk foreign key(vehiculo_contaminante_id)
    references vehiculo_contaminante(vehiculo_contaminante_id),
  constraint notificacion_vehiculo_contaminante_id_uk unique(vehiculo_contaminante_id)
);

--
--  tabla vehiculo_verificacion
--

Prompt Creando tabla vehiculo_verificacion
create table vehiculo_verificacion(
  vehiculo_verificacion_id number(10,0) not null,
  medida number(5,2) not null,
  contaminante_id,
  verificacion_id,
  --CONSTRAINTS
  constraint vehiculo_verificacion_pk primary key(vehiculo_verificacion_id),
  constraint vehiculo_verificacion_contaminante_id_fk foreign key(contaminante_id)
    references contaminante(contaminante_id),
  constraint vehiculo_verificacion_verificacion_id_fk foreign key(verificacion_id)
    references verificacion(verificacion_id)
);

