--@Autor(es):       Bueno Hernández Héctor Daniel, Fernández Cano Iván Antonio
--@Fecha creación:  07/06/2024
--@Descripción:     Proyecto final - Función para calcular el numero de serie de un vehiculo

connect BF_PROY_ADMIN/admin
set serveroutput on
create or replace function fx_num_serie_vehiculo(
  marca number,
  modelo number,
  año number
)return varchar2 is
  v_num_serie varchar2(10);
begin
  if marca = 1 then
    v_num_serie := 'NI';
    if modelo = 1 then
      v_num_serie := v_num_serie||'KI';
    else
      v_num_serie := v_num_serie||'MA';
    end if;
  elsif marca = 2 then
    v_num_serie := 'FO';
    if modelo = 3 then
      v_num_serie := v_num_serie||'ES';
    else
      v_num_serie := v_num_serie||'BR';
    end if;
  elsif marca = 3 then
    v_num_serie := 'HO';
    if modelo = 5 then
      v_num_serie := v_num_serie||'AC';
    else
      v_num_serie := v_num_serie||'CI';
    end if;
  elsif marca = 4 then
    v_num_serie := 'HY';
    if modelo = 7 then
      v_num_serie := v_num_serie||'TU';
    else
      v_num_serie := v_num_serie||'CR';
    end if;
  else
    v_num_serie := 'KI';
    if modelo = 9 then
      v_num_serie := v_num_serie||'SO';
    else
      v_num_serie := v_num_serie||'FO';
    end if;
  end if;
  v_num_serie := v_num_serie||substr(año,3,2);
  v_num_serie := v_num_serie||floor(dbms_random.value(1000,9999));
  return v_num_serie;
end;
/
show errors

