--@Autor(es):       Bueno Hernández Héctor Daniel, Fernández Cano Iván Antonio
--@Fecha creación:  08/05/2024
--@Descripción:     Proyecto final - Creación de objetos


--
--  tabla vehiculo
--

Prompt Creando tabla temporal vehiculo
create global temporary table vehiculo_tmp(
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
  propietario_id number(10,0),
  status_vehiculo_id number(10,0),
  modelo_id number(10,0),
  pasajeros_sentados number(2,0),
  pasajeros_parados number(2,0),
  capacidad_toneladas number(5,2),
  capacidad_m3 number(6,2),
  num_remolques number(2,0),
  num_bolsas_aire number(2,0),
  tipo_transmision_id number(10,0),
  importe_seguro numeric(8,2) default 0,
  impuesto number(10,3),
  --Constraints
  constraint vehiculo_tmp_pk primary key(vehiculo_id),
  constraint vehiculo_tmp_tipo_chk check(
    (es_transporte_pub=1 and es_carga=0 and es_particular=0)
    or
    (es_transporte_pub=0 and es_carga=1 and es_particular=0)
    or
    (es_transporte_pub=0 and es_carga=0 and es_particular=1)
    or
    (es_transporte_pub=0 and es_carga=1 and es_particular=1)
  )
) on commit delete rows;


--
--  Verificar con un trigger la integridad referencial en la tabla temporal
--  propietario_id, status_vehiculo_id, modelo_id
--  Calcular la columna virtual tambien con un trigger
--


--
--  Tabla temporal privada para realizar reportes entre vehiculo y
--  propiertario
--
Prompt Creando tabla temporal privada
create private temporary table ora$ptt_reporte_vehiculo_propietario(
  vehiculo_id number(10,0),
  num_serie varchar2(18),
  es_transporte_pub number(1,0),
  es_carga number(1,0),
  es_particular number(1,0),
  rfc varchar2(13),
  curp varchar2(18),
  correo varchar(200)
) on commit preserve definition;

