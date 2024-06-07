connect BF_PROY_ADMIN/admin
set serveroutput on
create or replace trigger tr_infraccion
before insert or update of folio
on infraccion
for each row
  declare
    v_folio number;
  begin
    p_folio_infraccion(:new.propietario_id, v_folio);
    case
      when updating('folio') then
        raise_application_error(-20003, 'Error, no se pueden actualizar el folio de la infraccion');
      when inserting then
        if :new.folio = v_folio then
          dbms_output.put_line('El folio a insertar coincide con el calculado! Insertando folio...');
        else
          :new.folio := v_folio;
          dbms_output.put_line('Folio no coincide, insertando folio calculado...');
        end if;
    end case;
  end;
/
show errors