--@Autor(es):       Bueno Hernández Héctor Daniel, Fernández Cano Iván Antonio
--@Fecha creación:  08/05/2024
--@Descripción:     Proyecto final - Creación de objetos

-- Ajustar los valores del usuario y password según corresponda
prompt conectando como usuario HBH_P09_CUENTAS
connect BF_PROY_ADMIN/admin

create table propietario(
  propietario_id number(10,0) not null,
  nombre varchar2(40) not null,
  ap_paterno varchar2(40) not null,
  ap_materno varchar2(40) not null,
  rfc varchar2(13) not null,
  curp varchar2(18) null,
  correo varchar2(200) not null,
  puntos_neg_totales number(5,0) not null,
  constraint propietario_fk primary key(propietario_id)
);

