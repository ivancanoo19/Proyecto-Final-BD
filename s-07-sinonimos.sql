--@Autor(es):       Bueno Hernández Héctor Daniel, Fernández Cano Iván Antonio
--@Fecha creación:  05/06/2024
--@Descripción:     Proyecto final - Creación de objetos

prompt conectando como usuario BF_PROY_ADMIN
connect bf_proy_admin/admin

Prompt
Prompt
Prompt Creando sinonimos publicos para usuario admin
create or replace public synonym s_auto for bf_proy_admin.vehiculo;
create or replace public synonym s_dueño for bf_proy_admin.propietario;
create or replace public synonym s_vv for bf_proy_admin.vehiculo_verificacion;
create or replace public synonym s_vc for bf_proy_admin.vehiculo_contaminante;


Prompt Otorgando permisos de lectura al usuario invitado
grant select on contaminante to bf_proy_invitado;
grant select on modelo to bf_proy_invitado;
grant select on marca to bf_proy_invitado;
grant select on status_vehiculo to bf_proy_invitado;
grant select on entidad_pais to bf_proy_invitado;

Prompt Creando sinonimos para usuario invitado
connect bf_proy_invitado/invitado

create or replace synonym s_contaminante for bf_proy_admin.contaminante;
create or replace synonym s_modelo for bf_proy_admin.modelo;
create or replace synonym s_marca for bf_proy_admin.marca;
create or replace synonym s_status_vehiculo for bf_proy_admin.status_vehiculo;
create or replace synonym s_entidad_pais for bf_proy_admin.entidad_pais;


--
--  Bloque anómnimo empleado para crear sinonimos privados
--  para cada tabla existente
--

Prompt Creando sinonimos privados para cada tabla
connect bf_proy_admin/admin

declare
  cursor cur_tablas is
    select table_name from user_tables;

begin
  for r in cur_tablas loop
    execute immediate 'create or replace synonym ' 
      || 'bf_' || lower(r.table_name) || ' for ' || r.table_name;
  end loop;
end;
/
show errors