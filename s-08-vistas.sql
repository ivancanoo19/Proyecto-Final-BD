--@Autor(es):       Bueno Hernández Héctor Daniel, Fernández Cano Iván Antonio
--@Fecha creación:  05/06/2024
--@Descripción:     Proyecto final - Vistas

prompt conectando como usuario BF_PROY_ADMIN
connect bf_proy_admin/admin

Prompt
Prompt
Prompt Creando vistas
create or replace view v_placas_vehiculo(
  vehiculo_id, nombre_modelo, nombre_marca, num_placa, esta_activa, clave
) as 
  select v.vehiculo_id, mo.nombre as nombre_modelo, ma.descripcion as nombre_marca,
    p.num_placa, p.esta_activa, ep.clave
  from vehiculo v, modelo mo, marca ma, placa p, entidad_pais ep
  where ep.entidad_pais_id=p.entidad_pais_id
    and v.vehiculo_id=p.vehiculo_id
    and v.modelo_id=mo.modelo_id
    and ma.marca_id=mo.marca_id;
    