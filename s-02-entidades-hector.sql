--@Autor(es):       Bueno Hernández Héctor Daniel, Fernández Cano Iván Antonio
--@Fecha creación:  08/05/2024
--@Descripción:     Proyecto final - Creación de objetos

-- Ajustar los valores del usuario y password según corresponda
prompt conectando como usuario BF_PROY_ADMIN
connect BF_PROY_ADMIN/admin

--
--  tabla propietario
-- 

create table propietario(
  propietario_id number(10,0) not null,
  nombre varchar2(40) not null,
  ap_paterno varchar2(40) not null,
  ap_materno varchar2(40) not null,
  rfc varchar2(13) not null,
  curp varchar2(18) null,
  correo varchar2(200) not null,
  puntos_neg_totales number(5,0) not null,
  --Constraints
  constraint propietario_fk primary key(propietario_id)
);

--
--  status vehiculo
--
create table status_vehiculo(
  status_vehiculo_id number(10,0) not null,
  nombre varchar2(40) not null,
  desc varchar2(40) not null
);

--
--  tabla hist_propietarios
-- 
create table hist_propietarios(
  hist_propietarios_id number(10,0) not null,
  fecha_ini date not null,
  fecha_fin date null,
  rfc_propietario varchar(13) not null,
  vehiculo_id,
  propietario_id,
  --Constraints--
  constraint hist_propietarios_pk primary key(hist_propietarios_id),
  constraint hist_propietarios_vehiculo_id_fk foreign key(vehiculo_id)
    references vehiculo(vehiculo_id),
  constraint hist_propietarios_propietario_id_fk foreign key(propietario_id)
    references propietario(propietario_id)
);

--
--  tabla vehiculo
--  AGREGAR LAS FK DE MODELO Y PROPIETARIO --
--

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
  propietario_id,
  --Constraints
  constraint vehiculo_pk primary key(vehiculo_id),
  constraint vehiculo_tipo_chk check(
    (es_transporte_pub=1 and es_carga=0 and es_particular=0)
    or
    (es_transporte_pub=0 and es_carga=1 and es_particular=0)
    or
    (es_transporte_pub=0 and es_carga=0 and es_particular=1)
    or
    (es_transporte_pub=0 and es_carga=1 and es_particular=1)
  )
  constraint vehiculo_propietario_id_fk foreign key(propietario_id)
    references propietario(propietario_id)
);

--
-- tabla hist_status_vehiculo
-- 
create table hist_status_vehiculo(
  hist_status_vehiculo_id number(10,0) not null,
  fecha_status date not null,
  status_vehiculo_id,
  vehiculo_id,
  --Constraints
  constraint hist_status_vehiculo_pk primary key(hist_status_vehiculo_id),
  constraint hist_status_vehiculo_status_vehiculo_id_fk foreign key(status_vehiculo_id)
    references status_vehiculo(status_vehiculo_id),
  constraint hist_status_vehiculo_vehiculo_id_fk foreign key(vehiculo_id)
    references vehiculo(vehiculo_id)
);

--
-- tabla entidad_pais
--
create table entidad_pais(
  entidad_pais_id number(10,0) not null,
  clave varchar2(3) not null,
  nombre varchar2(40) not null,
)

--
--  tabla