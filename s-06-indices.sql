--@Autor(es):       Bueno Hernández Héctor Daniel, Fernández Cano Iván Antonio
--@Fecha creación:  05/06/2024
--@Descripción:     Proyecto final - Creación de índices

prompt conectando como usuario BF_PROY_ADMIN
connect BF_PROY_ADMIN/admin

--
--  Índices non unique
--
create index vehiculo_num_serie_ix on vehiculo(num_serie);
create index vehiculo_propietario_id on vehiculo(propietario_id);
create index vehiculo_status_vehiculo_id_ix on vehiculo(status_vehiculo_id);

create index propietario_rfc_ix on propietario(rfc);

create index placa_num_placa_ix on placa(num_placa);

create index contaminante_clave_ix on contaminante(clave);

create index verificacion_folio_ix on verificacion(folio);
create index verificacion_vehiculo_id on verificacion(vehiculo_id);

create index licencia_num_licencia_ix on licencia(num_licencia);
create index licencia_anterior_id_ix on licencia(licencia_anterior_id);
create index licencia_propietario_id_ix on licencia(propietario_id);

--
--  Indices unique
--
create unique index vehiculo_num_serie_dispositivo on vehiculo(num_serie_dispositivo);

--
--  Indices unique compuestos
--
create index vehiculo_contaminante_iux on vehiculo_contaminante(vehiculo_id, contaminante_id);

create index vehiculo_verificacion_iux on vehiculo_verificacion(contaminante_id, verificacion_id);

create unique index hist_propietarios_iux on hist_propietarios(vehiculo_id, propietario_id);

--
--  Indices basados en funciones
--
create index licencia_fecha_fin_ifx on licencia(to_char(fecha_fin,'yyyy'));

create index propietario_rfc_ifx on propietario(substr(rfc, -1, 4));

create index hist_propietarios_fecha_ini_ifx on hist_propietarios(to_char(fecha_inicio, 'yyyy'));

create index verificacion_fecha_ifx on verificacion(to_char(fecha, 'yyyy'));



