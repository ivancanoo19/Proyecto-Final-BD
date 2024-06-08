--@Autor(es):       Bueno Hernández Héctor Daniel, Fernández Cano Iván Antonio
--@Fecha creación:  05/06/2024
--@Descripción:     Proyecto final - Creación de objetos

prompt conectando como usuario BF_PROY_ADMIN
connect BF_PROY_ADMIN/admin

--
--  Tabla temporal privada para realizar reportes entre vehiculo y
--  propiertario
--
Prompt Creando tabla temporal privada
create private temporary table ora$ptt_reporte_vehiculo_propietario(
  vehiculo_id number(10,0),
  num_serie varchar2(18),
  rfc varchar2(13),
  curp varchar2(18),
  correo varchar(200)
) on commit preserve definition;

