--@Autor(es): Bueno Hernández Héctor Daniel, Fernández Cano Iván Antonio
--@Fecha creación: 08/05/2024
--@Descripción: Proyecto final

Prompt Conectando como usuario sys
connect sys/system as sysdba
Prompt Limpiando...

declare 
cursor cur_usuarios is
    select username from dba_users where username like 'BF_PROY%';
  cursor cur_roles is
    select role from dba_roles where role like 'ROL_PROY%';
    
begin
  for r in cur_usuarios loop
  execute immediate 'drop user '||r.username||' cascade';
  end loop;
  
  for r in cur_roles loop
  execute immediate 'drop role '||r.role;
  end loop;
end;
/

Prompt Creando usuarios otorgando permisos
create user bf_proy_invitado identified by invitado;
create user bf_proy_admin identified by admin quota 1024m on users;

create role rol_proy_invitado not identified;
grant create session, create synonym to bf_proy_invitado;

create role rol_proy_admin not identified;
grant create session, create table, create sequence, create procedure, 
  create synonym, create public synonym, create view to bf_proy_admin;

Prompt Listo!
disconnect