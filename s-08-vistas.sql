--@Autor(es):       Bueno Hernández Héctor Daniel, Fernández Cano Iván Antonio
--@Fecha creación:  05/06/2024
--@Descripción:     Proyecto final - Vistas

prompt conectando como usuario BF_PROY_ADMIN
connect bf_proy_admin/admin

Prompt
Prompt
Prompt Creando vista v_placas vehiculo
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

Prompt Creando vista para el promedio de CO2
create or replace view v_promedio_co2(
  vehiculo_id, num_serie, modelo, promedio
) as
  select vc.vehiculo_id, v.num_serie, mo.nombre as modelo, avg(vc.medida) as promedio
  from vehiculo_contaminante vc, contaminante c, vehiculo v, modelo mo
  where c.contaminante_id = vc.contaminante_id
    and v.vehiculo_id = vc.vehiculo_id
    and v.modelo_id = mo.modelo_id
    and c.clave='CO2'
  group by vc.vehiculo_id, v.num_serie, mo.nombre;


Prompt Creando vista que muestra el numero de infracciones
Prompt de los propietarios

create or replace view v_num_infracciones(
  propietario_id, nombre, ap_paterno, ap_materno, rfc, num_infracciones
) as
  select d.propietario_id, d.nombre, d.ap_paterno, d.ap_materno, d.rfc,
    count(*) as num_infracciones
  from s_dueño d
  left join infraccion i on d.propietario_id=i.propietario_id
  group by d.propietario_id, d.nombre, d.ap_paterno, d.ap_materno, d.rfc;

Prompt Creando vista que muestre los datos del propietario ocultando datos sensibles
create or replace view v_propietario(
  propietario_id, nombre, ap_paterno, ap_materno, correo, num_licencia
) as
  select p.propietario_id, p.nombre, p.ap_paterno, p.ap_materno, p.correo, l.num_licencia
  from propietario p, licencia l
  where p.propietario_id = l.propietario_id;