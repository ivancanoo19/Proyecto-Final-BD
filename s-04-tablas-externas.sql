--@Autor(es):       Bueno Hernández Héctor Daniel, Fernández Cano Iván Antonio
--@Fecha creación:  05/06/2024
--@Descripción:     Proyecto final - Tablas externas

Prompt Conectando como sys
connect sys/system as sysdba

Prompt Creando un objeto tipo directory
create or replace directory ext_dir as '/unam-bd/Proyecto-Final-BD/ext';
--otorgar prermisos a bf_proy_admin
grant read, write on directory ext_dir to BF_PROY_ADMIN;

Prompt Conectando como BF_PROY_ADMIN para crear la tabla externa
connect BF_PROY_ADMIN/admin
create table propietario_licencia_revocada(
  nombre varchar2(40),
  ap_paterno varchar2(40),
  ap_materno varchar2(40),
  rfc varchar2(13),
  curp varchar2(18),
  correo varchar2(200)
)
organization external(
  type oracle_loader
  default directory ext_dir
  access parameters(
    records delimited by newline
    badfile ext_dir:'propietario_licencia_revocada_bad.log'
    logfile ext_dir:'propietario_licencia_revocada.log'
    fields terminated by ','
    lrtrim
    missing field values are null
    (
      nombre,ap_paterno,ap_materno,rfc,curp,correo
    )
  )
  location('propietario_licencia_revocada.csv')
)
reject limit unlimited;

Prompt Configurando el directorio
--crear directorio
!mkdir -p /unam-bd/Proyecto-Final-BD/ext
--modificar los permisos del directorio
!chmod 777 /unam-bd/Proyecto-Final-BD/ext

--Prompt Creando archivo de prueba
--!touch /unam-bd/Proyecto-Final-BD/ext/propietario_licencia_revocada.csv
--!chmod 777 /unam-bd/Proyecto-Final-BD/ext/propietario_licencia_revocada.csv
--!echo "Ivan,Fernandez,Cano,IVFC123456ABC,IVFC123456HDFNRPS0,ivan@gmail.com" >> /unam-bd/Proyecto-Final-BD/ext/propietario_licencia_revocada.csv
--!echo "Lesli,Cruz,Buenavista,LECB098765DEF,LECB098765MDFNRL1H," >> /unam-bd/Proyecto-Final-BD/ext/propietario_licencia_revocada.csv
--!echo "Jazmin,Jimenez,Aguirre,,JAJA654738MDFNROC7,jazja@hotmail.com" >> /unam-bd/Proyecto-Final-BD/ext/propietario_licencia_revocada.csv
--!echo "Brenda,Flores,Rivera,BRFR135790GHI,,vrendflor@outlook.com" >> /unam-bd/Proyecto-Final-BD/ext/propietario_licencia_revocada.csv

Promp Configurando el ancho de las columnas
set linesize window
col nombre format a15
col ap_paterno format a15
col ap_materno format a15
col rfc format a15
col curp format a20
col correo format a30

Prompt Mostrando datos
select * from propietario_licencia_revocada;

Prompt Haciendo limpieza (script idempotente)
drop table propietario_licencia_revocada;

