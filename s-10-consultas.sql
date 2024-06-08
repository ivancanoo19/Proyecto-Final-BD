--@Autor(es):       Bueno Hernández Héctor Daniel, Fernández Cano Iván Antonio
--@Fecha creación:  07/06/2024
--@Descripción:     Proyecto final - Consultas

Prompt
Prompt
Prompt
Prompt ======================================================================================
Prompt Generar una sentencia SQL que muestre el nombre, apellido paterno y rfc de aquellos 
Prompt propietarios que cuentan con alguna infraccion y que además han contado con licencias 
Prompt en el pasado que se encuentran asociadas a su licencia actual. Adicionalmente, mostrar
Prompt el número de infracciones de cada propietario. 
Prompt ======================================================================================

select s.nombre, s.ap_paterno, v.rfc, v.num_infracciones
  from s_dueño s
join v_num_infracciones v
  on s.propietario_id = v.propietario_id
join licencia l
  on s.propietario_id = l.propietario_id
where licencia_anterior_id is not null;

Prompt
Prompt
Prompt
Prompt =======================================================================================
Prompt Se busca generar un reporte de aquellos propietarios que hayan contado con una licencia
Prompt revocada en el pasado cuyo curp se encuentre registrado en la tabla que contiene dichos
Prompt datos. El reporte debe contiener el id del propietario, su nombre, apellido paterno y 
Prompt correo electrónico en caso de encontrarse registrado. 
Prompt =======================================================================================

select p.propietario_id, plr.nombre, plr.ap_paterno, plr.correo
  from propietario p
join propietario_licencia_revocada plr
  on p.curp = plr.curp;
  
Prompt
Prompt
Prompt
Prompt ==================================================================================  
Prompt Generar una sentencia SQL que muestre el id, nombre y apellido paterno de aquellos
Prompt propietarios que cuenten con más de una licencia. Mostrar de igual forma el número
Prompt de licencias con las que cuenta cada propietario. 
Prompt ==================================================================================

select l.propietario_id, p.nombre, p.ap_paterno, count(*) as num_licencias
  from licencia l, propietario p
where p.propietario_id = l.propietario_id
group by l.propietario_id, p.nombre, p.ap_paterno
having count(*) > 1;

Prompt
Prompt
Prompt
Prompt ================================================================================
Prompt Mostrar el identificador, el número y el nombre de la entidad a la que pertenece 
Prompt de la placa cuya fecha de asignación es la más antigua. 
Prompt ================================================================================

select p.placa_id, p.num_placa, e.nombre
  from placa p, entidad_pais e
where p.entidad_pais_id = e.entidad_pais_id
  and fecha_asignacion = (
  select min(fecha_asignacion)
    from placa
  );


@s-03-tablas-temporales

Prompt
Prompt
Prompt
Prompt ================================================================================
Prompt Generar una sentencia que inserte datos a la tabla temporal a partir de un reporte
Prompt entre vehiculo y propietario
Prompt ================================================================================

insert into ora$ptt_reporte_vehiculo_propietario(vehiculo_id, num_serie, rfc, curp, correo)
select v.vehiculo_id, v.num_serie, p.rfc, p.curp, p.correo
from vehiculo v, propietario p
where v.propietario_id = p.propietario_id;

select * from ora$ptt_reporte_vehiculo_propietario
  where rfc like 'F%';

Prompt
Prompt
Prompt
Prompt ================================================================================
Prompt Mostrar solamente aquellas placas que se encuentran activas, junto con su entidad
Prompt a la que pertenecen y el numero de serie del vehiculo al que pertenecen
Prompt ================================================================================

select p.num_placa, ep.nombre as nombre_entidad, p.esta_activa, v.num_serie,
  m.nombre as modelo
from entidad_pais ep
natural join placa p
natural join vehiculo v
join modelo m using(modelo_id)
where p.esta_activa = 1;

Prompt
Prompt
Prompt
Prompt ================================================================================
Prompt Mostrar aquellos vehiculos que son carga y particular a la vez
Prompt a la que pertenecen y el numero de serie del vehiculo al que pertenecen
Prompt ================================================================================

select propietario_id, nombre, rfc, vehiculo_id from(
  select p.propietario_id, p.nombre, p.rfc, v.vehiculo_id
  from propietario p
  left join vehiculo v on p.propietario_id = v.propietario_id
  minus
  select p.propietario_id, p.nombre, p.rfc, v.vehiculo_id
  from propietario p
  left join vehiculo v on p.propietario_id = v.propietario_id
  where v.vehiculo_id is not null
);