--@Autor(es):       Bueno Hernández Héctor Daniel, Fernández Cano Iván Antonio
--@Fecha creación:  06/06/2024
--@Descripción:     Proyecto final - Trigger para checar el número de licencias

connect BF_PROY_ADMIN/admin
set serveroutput on
create or replace trigger tr_num_licencias
  before insert
  on licencia
  for each row
  declare
    v_count number;

  begin
    case 
      when inserting then
        select count(*) into v_count
          from licencia l
        where :new.propietario_id = l.propietario_id;
        --checar el número de licencias del propietario
        if v_count < 3 then
          dbms_output.put_line('Insertando licencia...');
        else
          raise_application_error(-20002, 'Error, el propietario con id: '||:new.propietario_id
          ||' ya cuenta tres licencias.');
        end if;
    end case;
  end;
  /
  show errors