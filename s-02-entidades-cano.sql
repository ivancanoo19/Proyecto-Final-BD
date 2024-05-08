--@Autor(es): Bueno Hernández Héctor Daniel, Fernández Cano Iván Antonio
--@Fecha creación: 08/05/2024
--@Descripción: Proyecto final

Prompt Conectando como admin
connect bf_proy_admin/admin

--
--  tabla vehiculo
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
);