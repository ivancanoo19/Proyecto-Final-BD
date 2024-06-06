--@Autor(es):       Bueno Hernández Héctor Daniel, Fernández Cano Iván Antonio
--@Fecha creación:  08/05/2024
--@Descripción:     Proyecto final - Creación de objetos

-- Ajustar los valores del usuario y password según corresponda
prompt conectando como usuario BF_PROY_ADMIN
connect BF_PROY_ADMIN/admin

--
--  tabla propietario
-- 
Prompt Creando tabla propietario
create table propietario(
  propietario_id number(10,0) not null,
  nombre varchar2(40) not null,
  ap_paterno varchar2(40) not null,
  ap_materno varchar2(40) not null,
  rfc varchar2(13) not null,
  curp varchar2(18) null,
  correo varchar2(200) not null,
  puntos_neg_totales number(5,0) default 0,
  --Constraints
  constraint propietario_fk primary key(propietario_id)
);

--
--  tabla status_vehiculo
--
Prompt Creando tabla status_vehiculo
create table status_vehiculo(
  status_vehiculo_id number(10,0) not null,
  nombre varchar2(40) not null,
  descripcion varchar2(200) not null,
  --Constraints
  constraint status_vehiculo_pk primary key(status_vehiculo_id)
);

--
--  tabla marca
--
Prompt Creando tabla marca
create table marca(
  marca_id number(10,0) not null,
  descripcion varchar2(200) not null,
  --Constraints
  constraint marca_pk primary key(marca_id)
);

--
--  tabla modelo
--
Prompt Creando tabla modelo
create table modelo(
  modelo_id number(10,0) not null,
  nombre varchar2(40) not null,
  marca_id,
  --Constraints
  constraint modelo_pk primary key(modelo_id),
  constraint modelo_marca_id_fk foreign key(marca_id)
    references marca(marca_id)
);

--
--  tabla vehiculo
--  AGREGAR LAS FK DE MODELO Y PROPIETARIO --
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
  propietario_id,
  status_vehiculo_id,
  modelo_id,
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
  ),
  constraint vehiculo_propietario_id_fk foreign key(propietario_id)
    references propietario(propietario_id),
  constraint vehiculo_status_vehiculo_id_fk foreign key(status_vehiculo_id)
    references status_vehiculo(status_vehiculo_id),
  constraint vehiculo_modelo_id_fk foreign key(modelo_id)
    references modelo(modelo_id)
);


--
--  tabla hist_propietarios
-- 
Prompt Creando tabla hist_propietarios
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
--  tabla hist_status_vehiculo
-- 
Prompt Creando tabla status_vehiculo
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
--  tabla entidad_pais
--
Prompt Creando tabla entidad_pais
create table entidad_pais(
  entidad_pais_id number(10,0) not null,
  clave varchar2(3) not null,
  nombre varchar2(40) not null,
  --Constraints
  constraint entidad_pais_pk primary key(entidad_pais_id)
);

--
--  tabla placa
--
Prompt Creando tabla placa
create table placa(
  placa_id number(10,0) not null,
  num_placa varchar2(10) not null, 
  fecha_asignacion date not null,
  esta_activa number(1,0) not null,
  vehiculo_id number(10,0) null,
  entidad_pais_id,
  --Constraints
  constraint placa_pk primary key(placa_id),
  constraint placa_vehiculo_id_fk foreign key(vehiculo_id)
    references vehiculo(vehiculo_id),
  constraint placa_entidad_pais_id_fk foreign key(entidad_pais_id)
    references entidad_pais(entidad_pais_id),
  constraint placa_vehiculo_id_uk unique(vehiculo_id)
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
--  tabla transporte_pub
--
Prompt Creando tabla transporte_pub
create table transporte_pub(
  vehiculo_id,
  pasajeros_sentados number(2,0) not null,
  pasajeros_parados number(2,0) not null,
  tipo_licencia_id,
  --Constraints
  constraint transporte_pub_pk primary key(vehiculo_id),
  constraint transporte_pub_vehiculo_id_fk foreign key(vehiculo_id)
    references vehiculo(vehiculo_id),
  constraint transporte_pub_tipo_licencia_id_fk foreign key(tipo_licencia_id)
    references tipo_licencia(tipo_licencia_id),
  constraint tipo_licencia_id_chk check(
    (tipo_licencia_id = 1 and pasajeros_sentados = 4 and pasajeros_parados = 0)
    or
    (tipo_licencia_id = 2 and pasajeros_sentados < 4 and pasajeros_sentados > 20 and pasajeros_parados = 0)
    or
    (tipo_licencia_id = 3 and pasajeros_sentados <= 20 and pasajeros_parados <= 1)
  )
);

--
--  tabla carga
--
Prompt Creando tabla carga
create table carga(
  vehiculo_id,
  capacidad_ton number(5,2) not null,
  capacidad_m3 number(6,2) null,
  num_remolques number(2,0) null,
  --Constraints
  constraint carga_pk primary key(vehiculo_id),
  constraint carga_vehiculo_id_fk foreign key(vehiculo_id)
    references vehiculo(vehiculo_id)
);

--
--  tabla tipo_transmision
--
Prompt Creando tabla tipo_transmision
create table tipo_transmision(
  tipo_transmision_id number(10,0) not null,
  nombre varchar2(1) not null,
  descripcion varchar2(10) not null,
  --Constraints
  constraint tipo_transmision_pk primary key(tipo_transmision_id)
);

--
--  tabla particular
-- 
Prompt Creando tabla particular
create table particular(
  vehiculo_id,
  num_bolsas_aire number(2,0) not null,
  abs number(1,0) null,
  tipo_transmision_id,
  importe_seguro numeric(8,2) default 0,
  impuesto generated always as (num_bolsas_aire * 1000 + abs * 2000 + tipo_transmision_id * 1500),
  --Constraints
  constraint particular_pk primary key (vehiculo_id),
  constraint particular_vehiculo_id_fk foreign key(vehiculo_id)
    references vehiculo(vehiculo_id),
  constraint particular_tipo_transmision_id_fk foreign key(tipo_transmision_id)
    references tipo_transmision(tipo_transmision_id)
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

