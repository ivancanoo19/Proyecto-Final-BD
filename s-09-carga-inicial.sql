--@Autor(es):       Bueno Hernández Héctor Daniel, Fernández Cano Iván Antonio
--@Fecha creación:  05/06/2024
--@Descripción:     Proyecto final - Carga inicial

-- tabla MARCA y MODELO
insert into marca values(marca_seq.nextval, 'NISSAN');
insert into modelo values(modelo_seq.nextval, 'KICKS', marca_seq.currval);
insert into modelo values(modelo_seq.nextval, 'MARCH', marca_seq.currval);

insert into marca values(marca_seq.nextval, 'FORD');
insert into modelo values(modelo_seq.nextval, 'ESCAPE', marca_seq.currval);
insert into modelo values(modelo_seq.nextval, 'BRONCO', marca_seq.currval);

insert into marca values(marca_seq.nextval, 'HONDA');
insert into modelo values(modelo_seq.nextval, 'ACCORD', marca_seq.currval);
insert into modelo values(modelo_seq.nextval, 'CIVIC', marca_seq.currval);

insert into marca values(marca_seq.nextval, 'HYUNDAI');
insert into modelo values(modelo_seq.nextval, 'TUCSON', marca_seq.currval);
insert into modelo values(modelo_seq.nextval, 'CRETA', marca_seq.currval);

insert into marca values(marca_seq.nextval, 'KIA');
insert into modelo values(modelo_seq.nextval, 'SORENTO', marca_seq.currval);
insert into modelo values(modelo_seq.nextval, 'FORTE', marca_seq.currval);

--
--  tabla entidad_pais
--
insert into entidad_pais (entidad_pais_id, clave, nombre) 
  values (entidad_pais_seq.nextval, 'CMX', 'Ciudad de México');

insert into entidad_pais (entidad_pais_id, clave, nombre) 
  values (entidad_pais_seq.nextval, 'JAL', 'Jalisco');

insert into entidad_pais (entidad_pais_id, clave, nombre) 
  values (entidad_pais_seq.nextval, 'NLE', 'Nuevo León');

insert into entidad_pais (entidad_pais_id, clave, nombre) 
  values (entidad_pais_seq.nextval, 'BCN', 'Baja California');

insert into entidad_pais (entidad_pais_id, clave, nombre) 
  values (entidad_pais_seq.nextval, 'GUA', 'Guanajuato');

insert into entidad_pais (entidad_pais_id, clave, nombre) 
  values (entidad_pais_seq.nextval, 'PUE', 'Puebla');

insert into entidad_pais (entidad_pais_id, clave, nombre) 
  values (entidad_pais_seq.nextval, 'EMX', 'Estado de México');

insert into entidad_pais (entidad_pais_id, clave, nombre) 
  values (entidad_pais_seq.nextval, 'SON', 'Sonora');

insert into entidad_pais (entidad_pais_id, clave, nombre) 
  values (entidad_pais_seq.nextval, 'MIC', 'Michoacán');

insert into entidad_pais (entidad_pais_id, clave, nombre) 
  values (entidad_pais_seq.nextval, 'VER', 'Veracruz');

--
--  tabla status_vehiculo
--

insert into status_vehiculo(status_vehiculo_id, nombre, descripcion)
  values(1, 'EN REGLA', 'Vehiculo circula con normalidad');

insert into status_vehiculo(status_vehiculo_id, nombre, descripcion)
  values(2, 'CON LICENCIA EXPIRADA', 'El propietario cuenta con licencia fuera del rango de operacion');

insert into status_vehiculo(status_vehiculo_id, nombre, descripcion)
  values(3, 'CON ADEUDO DE IMPUESTO', 'Se debe un adeudo respecto al impuesto del vehiculo');

insert into status_vehiculo(status_vehiculo_id, nombre, descripcion)
  values(4, 'CON VERIFICACION PENDIENTE', 'Vehiculo rebasó las medidas ambientales y se requiere verificación');

insert into status_vehiculo(status_vehiculo_id, nombre, descripcion)
  values(5, 'SUSPENDIDO', 'Se suspende cualquier actividad del vehiculo por no cumplir alguna de las normas');

--
--  tabla tipo_licencia
--
insert into tipo_licencia(tipo_licencia_id, descripcion, nombre)
  values(1, 'Taxis tipo sedán', 'A');
insert into tipo_licencia(tipo_licencia_id, descripcion, nombre)
  values(2, 'Camionetas que no pueden transportar pasajeros de pie', 'B');
insert into tipo_licencia(tipo_licencia_id, descripcion, nombre)
  values(3, 'Autobuses y camionetas que tienen capacidad para transportar a 20 o más pasajeros', 'C');

--
--  tabla contaminantes
--
insert into contaminantes(contaminante_id, clave, rango, nombre)
  values(contaminante_seq.nextval, 'HC', null, 'Hidrocarburos');

insert into contaminantes(contaminante_id, clave, rango, nombre)
  values(contaminante_seq.nextval, 'CO', null, 'Monóxido de Carbono');

insert into contaminantes(contaminante_id, clave, rango, nombre)
  values(contaminante_seq.nextval, 'NOx', 1, 'Óxido de Nitrógeno');

insert into contaminantes(contaminante_id, clave, rango, nombre)
  values(contaminante_seq.nextval, 'CO2', null, 'Dióxido de Carbono');

--
--  tabla tipo_transmision
--
insert into tipo_transmision(tipo_transmision_id, nombre, descripcion)
  values(1, 'M', 'Manual');
insert into tipo_transmision(tipo_transmision_id, nombre, descripcion)
  values(2, 'A', 'Automática');

--
--  tabla placa
--  (placas sin asignar en el catalogo)
--

insert into placa (placa_id, num_placa, fecha_asignacion, esta_activa, vehiculo_id, entidad_pais_id)
values (placa_seq.nextval, 'JGN491', sysdate, 1, null, 1);

insert into placa (placa_id, num_placa, fecha_asignacion, esta_activa, vehiculo_id, entidad_pais_id)
values (placa_seq.nextval, 'OLO324', sysdate, 1, null, 2);

insert into placa (placa_id, num_placa, fecha_asignacion, esta_activa, vehiculo_id, entidad_pais_id)
values (placa_seq.nextval, 'BBY659', sysdate, 1, null, 3);

insert into placa (placa_id, num_placa, fecha_asignacion, esta_activa, vehiculo_id, entidad_pais_id)
values (placa_seq.nextval, 'QKA332', sysdate, 1, null, 4);

insert into placa (placa_id, num_placa, fecha_asignacion, esta_activa, vehiculo_id, entidad_pais_id)
values (placa_seq.nextval, 'JHI711', sysdate, 1, null, 5);

insert into placa (placa_id, num_placa, fecha_asignacion, esta_activa, vehiculo_id, entidad_pais_id)
values (placa_seq.nextval, 'PQS212', sysdate, 1, null, 6);

insert into placa (placa_id, num_placa, fecha_asignacion, esta_activa, vehiculo_id, entidad_pais_id)
values (placa_seq.nextval, 'MAN924', sysdate, 1, null, 7);

insert into placa (placa_id, num_placa, fecha_asignacion, esta_activa, vehiculo_id, entidad_pais_id)
values (placa_seq.nextval, 'NBU863', sysdate, 1, null, 8);

insert into placa (placa_id, num_placa, fecha_asignacion, esta_activa, vehiculo_id, entidad_pais_id)
values (placa_seq.nextval, 'LOK123', sysdate, 1, null, 9);

insert into placa (placa_id, num_placa, fecha_asignacion, esta_activa, vehiculo_id, entidad_pais_id)
values (placa_seq.nextval, 'KKE187', sysdate, 1, null, 10);


---
---     tabla propietario y vehiculo
---

--
--  (1)
--


insert into propietario(propietario_id, nombre, ap_paterno, ap_materno, rfc, curp, correo, puntos_neg_totales) 
  values(propietario_seq.nextval, 'Hector', 'Bueno', 'Hernandez', 'BDH870123HPL', 'BUHH870123HDFNRD01', 'hector.bueno@gmail.com', 0);

insert into licencia(licencia_id, licencia_anterior_id, num_licencia, foto, firma, huella_izq, fecha_inicio, fecha_fin, propietario_id, tipo_licencia_id)
  values(licencia_seq.nextval, null, 12345678, empty_blob(), empty_blob(), empty_blob(), sysdate, to_date('06/06/2027','dd/mm/yyyy'), propietario_seq.currval, null);

insert into vehiculo(vehiculo_id, fecha_status, año, num_serie, es_transporte_pub, es_carga, es_particular, fecha_inicio, fecha_fin, 
  num_serie_dispositivo, fecha_registro_dispositivo, propietario_id, status_vehiculo_id, modelo_id)
  values(vehiculo_seq.nextval, sysdate, 2023, '1HGCM82633A004352', 0, 0, 1, to_date('15-01-2023', 'dd-mm-yyyy'), null, 'DISP001', 
  to_date('15-01-2023', 'dd-mm-yyyy'), propietario_seq.currval, 1, 3);

insert into particular(vehiculo_id, num_bolsas_aire, abs, tipo_transmision_id)
  values(vehiculo_seq.currval, 4, 1, 1);

insert into placa(placa_id, num_placa, fecha_asignacion, esta_activa, vehiculo_id, entidad_pais_id)
  values(placa_seq.nextval, 'ABC123', to_date('15-01-2023', 'dd-mm-yyyy'), 1, vehiculo_seq.currval, 1);


--
--  (2)
--

insert into propietario(propietario_id, nombre, ap_paterno, ap_materno, rfc, curp, correo, puntos_neg_totales)
  values(propietario_seq.nextval, 'Lesliee', 'Cruz', 'Buenavista', 'CSL920215MTF', 'CRBL920215MDFNLL02', 'lesliee.cruz@gmail.com', 0);

insert into licencia(licencia_id, licencia_anterior_id, num_licencia, foto, firma, huella_izq, fecha_inicio, fecha_fin, propietario_id, tipo_licencia_id)
  values(licencia_seq.nextval, null, 87654321, empty_blob(), empty_blob(), empty_blob(), to_date('27/03/2022','dd/mm/yyyy'), to_date('27/03/2025','dd/mm/yyyy'), 
  propietario_seq.currval, null);

insert into vehiculo(vehiculo_id, fecha_status, año, num_serie, es_transporte_pub, es_carga, es_particular, fecha_inicio, fecha_fin, 
  num_serie_dispositivo, fecha_registro_dispositivo, propietario_id, status_vehiculo_id, modelo_id)
  values(vehiculo_seq.nextval, to_date('20-05-2023', 'dd-mm-yyyy'), 2023, 'JHMCM82633C004353', 0, 0, 1, 
  to_date('20-05-2023', 'dd-mm-yyyy'), null, 'DISP002', to_date('20-05-2023', 'dd-mm-yyyy'), propietario_seq.currval, 1, 7);

insert into carga(vehiculo_id, capacidad_ton, capacidad_m3, num_remolques)
  values(vehiculo_seq.currval, 1.0, null, null);

insert into vehiculo_contaminante(vehiculo_contaminante_id, medida, vehiculo_id, contaminante_id)
  values(vehiculo_contaminante_seq.nextval, 0.09, vehiculo_seq.currval, 1);

insert into placa(placa_id, num_placa, fecha_asignacion, esta_activa, vehiculo_id, entidad_pais_id)
  values(placa_seq.nextval, 'DEF456', to_date('20-05-2023', 'dd-mm-yyyy'), 1, vehiculo_seq.currval, 2);



--
--  (3)
--


insert into propietario(propietario_id, nombre, ap_paterno, ap_materno, rfc, curp, correo, puntos_neg_totales) 
  values(propietario_seq.nextval, 'Ivan', 'Fernandez', 'Cano', 'FIC880406HPL', 'FECA880406HDFNIN03', 'ivan.fernandez@gmail.com', 0);

insert into licencia(licencia_id, licencia_anterior_id, num_licencia, foto, firma, huella_izq, fecha_inicio, fecha_fin, propietario_id, tipo_licencia_id)
  values(licencia_seq.nextval, null, 98765432, empty_blob(), empty_blob(), empty_blob(), to_date('01/01/2021','dd/mm/yyyy'), to_date('01/01/2024','dd/mm/yyyy'), 
  propietario_seq.currval, 2);
insert into licencia(licencia_id, licencia_anterior_id, num_licencia, foto, firma, huella_izq, fecha_inicio, fecha_fin, propietario_id, tipo_licencia_id)
  values(licencia_seq.nextval, 4, 23456789, empty_blob(), empty_blob(), empty_blob(), to_date('02/02/2024','dd/mm/yyyy'), to_date('02/02/2027','dd/mm/yyyy'), 
  propietario_seq.currval, 2);

insert into vehiculo(vehiculo_id, fecha_status, año, num_serie, es_transporte_pub, es_carga, es_particular, fecha_inicio, fecha_fin, 
  num_serie_dispositivo, fecha_registro_dispositivo, propietario_id, status_vehiculo_id, modelo_id)
  values(vehiculo_seq.nextval, to_date('10-03-2024', 'dd-mm-yyyy'), 2024, '2HGCM82633A004354', 0, 0, 1, 
  to_date('10-03-2024', 'dd-mm-yyyy'), null, 'DISP003', to_date('10-03-2024', 'dd-mm-yyyy'), propietario_seq.currval, 1, 5);

insert into transporte_pub(vehiculo_id, pasajeros_sentados, pasajeros_parados, tipo_licencia_id)
  values(vehiculo_seq.currval, 18, 0, 2);

insert into vehiculo_contaminante(vehiculo_contaminante_id, medida, vehiculo_id, contaminante_id)
  values(vehiculo_contaminante_seq.nextval, 0.80, vehiculo_seq.currval, 2);

insert into vehiculo_contaminante(vehiculo_contaminante_id, medida, vehiculo_id, contaminante_id)
  values(vehiculo_contaminante_seq.nextval, 2.75, vehiculo_seq.currval, 4);

insert into placa(placa_id, num_placa, fecha_asignacion, esta_activa, vehiculo_id, entidad_pais_id)
  values(placa_seq.nextval, 'GHI789', to_date('10-03-2024', 'dd-mm-yyyy'), 1, vehiculo_seq.currval, 3);



--
--  (4)
--

insert into propietario(propietario_id, nombre, ap_paterno, ap_materno, rfc, curp, correo, puntos_neg_totales) 
  values(propietario_seq.nextval, 'Brenda', 'Flores', 'Rivera', 'FBR900512MTF', 'FLRB900512MDFNNB04', 'brenda.flores@gmail.com', 0);

insert into licencia(licencia_id, licencia_anterior_id, num_licencia, foto, firma, huella_izq, fecha_inicio, fecha_fin, propietario_id, tipo_licencia_id)
  values(licencia_seq.nextval, null, 76543210, empty_blob(), empty_blob(), empty_blob(), to_date('30/04/2023','dd/mm/yyyy'), to_date('30/04/2026','dd/mm/yyyy'), 
  propietario_seq.currval, 3);

insert into vehiculo(vehiculo_id, fecha_status, año, num_serie, es_transporte_pub, es_carga, es_particular, fecha_inicio, fecha_fin, 
  num_serie_dispositivo, fecha_registro_dispositivo, propietario_id, status_vehiculo_id, modelo_id)
  values(vehiculo_seq.nextval, to_date('25-11-2023', 'dd-mm-yyyy'), 2023, '3HGCM82633A004355', 0, 0, 1, 
  to_date('25-11-2023', 'dd-mm-yyyy'), null, 'DISP004', to_date('25-11-2023', 'dd-mm-yyyy'), propietario_seq.currval, 1, 8);

insert into transporte_pub(vehiculo_id, pasajeros_sentados, pasajeros_parados, tipo_licencia_id)
  values(vehiculo_seq.currval, 25, 20, 3);

insert into placa(placa_id, num_placa, fecha_asignacion, esta_activa, vehiculo_id, entidad_pais_id)
  values(placa_seq.nextval, 'JKL012', to_date('25-11-2023', 'dd-mm-yyyy'), 1, vehiculo_seq.currval, 4);


--
--  (5)
--

insert into propietario(propietario_id, nombre, ap_paterno, ap_materno, rfc, curp, correo, puntos_neg_totales) 
  values(propietario_seq.nextval, 'Jazmin', 'Jimenez', 'Aguirre', 'JAM950304MTF', 'JIAJ950304MDFNJM05', 'maria.jimenez@gmail.com', 0);

insert into licencia(licencia_id, licencia_anterior_id, num_licencia, foto, firma, huella_izq, fecha_inicio, fecha_fin, propietario_id, tipo_licencia_id)
  values(licencia_seq.nextval, null, 65432109, empty_blob(), empty_blob(), empty_blob(), to_date('05/10/2021','dd/mm/yyyy'), to_date('05/10/2021','dd/mm/yyyy'), 
  propietario_seq.currval, null);

insert into vehiculo(vehiculo_id, fecha_status, año, num_serie, es_transporte_pub, es_carga, es_particular, fecha_inicio, fecha_fin, 
  num_serie_dispositivo, fecha_registro_dispositivo, propietario_id, status_vehiculo_id, modelo_id)
  values(vehiculo_seq.nextval, to_date('06-06-2024', 'dd-mm-yyyy'), 2024, '4HGCM82633A004356', 0, 0, 1, 
  to_date('06-06-2024', 'dd-mm-yyyy'), null, 'DISP005', to_date('06-06-2024', 'dd-mm-yyyy'), propietario_seq.currval, 1, 10);

insert into particular(vehiculo_id, num_bolsas_aire, abs, tipo_transmision_id)
  values(vehiculo_seq.currval, 2, 1, 2);

insert into vehiculo_contaminante(vehiculo_contaminante_id, medida, vehiculo_id, contaminante_id)
  values(vehiculo_contaminante_seq.nextval, 0.40, vehiculo_seq.currval, 3);

insert into placa(placa_id, num_placa, fecha_asignacion, esta_activa, vehiculo_id, entidad_pais_id)
  values(placa_seq.nextval, 'MNO345', to_date('06-06-2024', 'dd-mm-yyyy'), 1, vehiculo_seq.currval, 5);



--
--  (6)
--

insert into propietario(propietario_id, nombre, ap_paterno, ap_materno, rfc, curp, correo, puntos_neg_totales)
  values(propietario_seq.nextval, 'Juan', 'Perez', 'Lopez', 'JPL890123HTH', 'PEJL890123HMCRLN04', 'juan.perez@gmail.com', 0);

insert into licencia(licencia_id, licencia_anterior_id, num_licencia, foto, firma, huella_izq, fecha_inicio, fecha_fin, propietario_id, tipo_licencia_id)
  values(licencia_seq.nextval, null, 54321098, empty_blob(), empty_blob(), empty_blob(), to_date('29/04/2022','dd/mm/yyyy'), to_date('29/04/2022','dd/mm/yyyy'), 
  propietario_seq.currval, 2);

--  1er vehiculo
insert into vehiculo(vehiculo_id, fecha_status, año, num_serie, es_transporte_pub, es_carga, es_particular, fecha_inicio, fecha_fin, 
  num_serie_dispositivo, fecha_registro_dispositivo, propietario_id, status_vehiculo_id, modelo_id)
  values(vehiculo_seq.nextval, sysdate, 2023, '5TGCM82633A004357', 0, 1, 0, 
  sysdate, null, 'DISP006', sysdate, propietario_seq.currval, 4, 7);

insert into transporte_pub(vehiculo_id, pasajeros_sentados, pasajeros_parados, tipo_licencia_id)
  values(vehiculo_seq.currval, 10, 0, 2);

insert into placa(placa_id, num_placa, fecha_asignacion, esta_activa, vehiculo_id, entidad_pais_id)
  values(placa_seq.nextval, 'MKH842', sysdate, 1, vehiculo_seq.currval, 4);

insert into vehiculo_contaminante(vehiculo_contaminante_id, medida, vehiculo_id, contaminante_id)
  values(vehiculo_contaminante_seq.nextval, 0.20, vehiculo_seq.currval, 1);

--  2do vehiculo
insert into vehiculo(vehiculo_id, fecha_status, año, num_serie, es_transporte_pub, es_carga, es_particular, fecha_inicio, fecha_fin, 
  num_serie_dispositivo, fecha_registro_dispositivo, propietario_id, status_vehiculo_id, modelo_id)
  values(vehiculo_seq.nextval, to_date('20-08-2023', 'dd-mm-yyyy'), 2023, '6UGCM82633A004358', 1, 0, 0, 
  to_date('20-08-2023', 'dd-mm-yyyy'), to_date('20-10-2023', 'dd-mm-yyyy'), 'DISP007', to_date('20-08-2023', 'dd-mm-yyyy'), propietario_seq.currval, 1, 10);

insert into transporte_pub(vehiculo_id, pasajeros_sentados, pasajeros_parados, tipo_licencia_id)
  values(vehiculo_seq.currval, 10, 0, 2);

insert into vehiculo_contaminante(vehiculo_contaminante_id, medida, vehiculo_id, contaminante_id)
  values(vehiculo_contaminante_seq.nextval, 0.40, vehiculo_seq.currval, 2);

insert into placa(placa_id, num_placa, fecha_asignacion, esta_activa, vehiculo_id, entidad_pais_id)
  values(placa_seq.nextval, 'AWQ387', to_date('20-08-2023', 'dd-mm-yyyy'), 0, vehiculo_seq.currval, 5);



--
--  (7)
--
insert into propietario(propietario_id, nombre, ap_paterno, ap_materno, rfc, curp, correo, puntos_neg_totales) 
  values(propietario_seq.nextval, 'Maria', 'Gonzalez', 'Ramirez', 'MGR850213MCH', 'GORM850213MDFMZN05', 'maria.gonzalez@gmail.com', 0);

insert into licencia(licencia_id, licencia_anterior_id, num_licencia, foto, firma, huella_izq, fecha_inicio, fecha_fin, propietario_id, tipo_licencia_id)
  values(licencia_seq.nextval, null, 43210987, empty_blob(), empty_blob(), empty_blob(), to_date('07/09/2018','dd/mm/yyyy'), to_date('07/09/2021','dd/mm/yyyy'), 
  propietario_seq.currval, 1);
insert into licencia(licencia_id, licencia_anterior_id, num_licencia, foto, firma, huella_izq, fecha_inicio, fecha_fin, propietario_id, tipo_licencia_id)
  values(licencia_seq.nextval, 8, 32109876, empty_blob(), empty_blob(), empty_blob(), to_date('19/10/2021','dd/mm/yyyy'), to_date('19/10/2024','dd/mm/yyyy'), 
  propietario_seq.currval, 1);

insert into vehiculo(vehiculo_id, fecha_status, año, num_serie, es_transporte_pub, es_carga, es_particular, fecha_inicio, fecha_fin, 
  num_serie_dispositivo, fecha_registro_dispositivo, propietario_id, status_vehiculo_id, modelo_id)
  values(vehiculo_seq.nextval, to_date('12-12-2023', 'dd-mm-yyyy'), 2023, '7VGCM82633A004359', 0, 0, 1, 
  to_date('12-12-2023', 'dd-mm-yyyy'), null, 'DISP008', to_date('12-12-2023', 'dd-mm-yyyy'), propietario_seq.currval, 1, 5);

insert into transporte_pub(vehiculo_id, pasajeros_sentados, pasajeros_parados, tipo_licencia_id)
  values(vehiculo_seq.currval, 4, 0, 1);

insert into placa(placa_id, num_placa, fecha_asignacion, esta_activa, vehiculo_id, entidad_pais_id)
  values(placa_seq.nextval, 'PQR678', to_date('12-12-2023', 'dd-mm-yyyy'), 1, vehiculo_seq.currval, 4);


--
--  (8)
--
insert into propietario(propietario_id, nombre, ap_paterno, ap_materno, rfc, curp, correo, puntos_neg_totales) 
  values(propietario_seq.nextval, 'Carlos', 'Hernandez', 'Martinez', 'CHM801011HPL', 'HEMC801011HDFNRL06', 'carlos.hernandez@gmail.com', 0);

insert into licencia(licencia_id, licencia_anterior_id, num_licencia, foto, firma, huella_izq, fecha_inicio, fecha_fin, propietario_id, tipo_licencia_id)
  values(licencia_seq.nextval, null, 21098765, empty_blob(), empty_blob(), empty_blob(), to_date('08/03/2020','dd/mm/yyyy'), to_date('08/03/2023','dd/mm/yyyy'), 
  propietario_seq.currval, 3);

-- 1er vehiculo
insert into vehiculo(vehiculo_id, fecha_status, año, num_serie, es_transporte_pub, es_carga, es_particular, fecha_inicio, fecha_fin, 
  num_serie_dispositivo, fecha_registro_dispositivo, propietario_id, status_vehiculo_id, modelo_id)
  values (vehiculo_seq.nextval, to_date('15-03-2023', 'dd-mm-yyyy'), 2023, '2HGCM82633A004360', 0, 1, 0, 
  to_date('15-03-2023', 'dd-mm-yyyy'), to_date('10-05-2023', 'dd-mm-yyyy'), 'DISP011', to_date('15-03-2023', 'dd-mm-yyyy'), 
  propietario_seq.currval, 4, 7);

insert into transporte_pub(vehiculo_id, pasajeros_sentados, pasajeros_parados, tipo_licencia_id)
  values(vehiculo_seq.currval, 30, 25, 3);

insert into placa(placa_id, num_placa, fecha_asignacion, esta_activa, vehiculo_id, entidad_pais_id)
  values(placa_seq.nextval, 'STU789', to_date('15-03-2023', 'dd-mm-yyyy'), 0, vehiculo_seq.currval, 3);

-- 2do vehiculo
insert into vehiculo(vehiculo_id, fecha_status, año, num_serie, es_transporte_pub, es_carga, es_particular, fecha_inicio, fecha_fin, 
  num_serie_dispositivo, fecha_registro_dispositivo, propietario_id, status_vehiculo_id, modelo_id)
  values(vehiculo_seq.nextval, to_date('20-05-2023', 'dd-mm-yyyy'), 2023, '9HGCM82633A004361', 0, 1, 0, 
  to_date('20-05-2023', 'dd-mm-yyyy'), to_date('17-07-2023', 'dd-mm-yyyy'), 'DISP014', to_date('20-05-2023', 'dd-mm-yyyy'), 
  propietario_seq.currval, 1, 3);

insert into transporte_pub(vehiculo_id, pasajeros_sentados, pasajeros_parados, tipo_licencia_id)
  values(vehiculo_seq.currval, 22, 10, 3);

insert into placa(placa_id, num_placa, fecha_asignacion, esta_activa, vehiculo_id, entidad_pais_id)
  values(placa_seq.nextval, 'UVW890', to_date('20-05-2023', 'dd-mm-yyyy'), 0, vehiculo_seq.currval, 4);

-- 3er vehiculo
insert into vehiculo(vehiculo_id, fecha_status, año, num_serie, es_transporte_pub, es_carga, es_particular, fecha_inicio, fecha_fin, 
  num_serie_dispositivo, fecha_registro_dispositivo, propietario_id, status_vehiculo_id, modelo_id)
  values(vehiculo_seq.nextval, to_date('10-07-2023', 'dd-mm-yyyy'), 2023, '3HGCM82633A004362', 0, 0, 1, 
  to_date('10-07-2023', 'dd-mm-yyyy'), null, 'DISP017', to_date('10-07-2023', 'dd-mm-yyyy'), propietario_seq.currval, 1, 8);

insert into transporte_pub(vehiculo_id, pasajeros_sentados, pasajeros_parados, tipo_licencia_id)
  values(vehiculo_seq.currval, 28, 20, 3);

insert into vehiculo_contaminante(vehiculo_contaminante_id, medida, vehiculo_id, contaminante_id)
  values(vehiculo_contaminante_seq.nextval, 0.60, vehiculo_seq.currval, 3);

insert into placa(placa_id, num_placa, fecha_asignacion, esta_activa, vehiculo_id, entidad_pais_id)
  values(placa_seq.nextval, 'WXY901', to_date('10-07-2023', 'dd-mm-yyyy'), 1, vehiculo_seq.currval, 3);

--
--  (9)
--
insert into propietario(propietario_id, nombre, ap_paterno, ap_materno, rfc, curp, correo, puntos_neg_totales) 
  values(propietario_seq.nextval, 'Laura', 'Diaz', 'Sanchez', 'LDS950405MTF', 'DASL950405MDFNLR07', 'laura.diaz@gmail.com', 0);

insert into licencia(licencia_id, licencia_anterior_id, num_licencia, foto, firma, huella_izq, fecha_inicio, fecha_fin, propietario_id, tipo_licencia_id)
  values(licencia_seq.nextval, null, 90876543, empty_blob(), empty_blob(), empty_blob(), to_date('06/06/2021','dd/mm/yyyy'), sysdate, 
  propietario_seq.currval, null);

insert into vehiculo(vehiculo_id, fecha_status, año, num_serie, es_transporte_pub, es_carga, es_particular, fecha_inicio, fecha_fin, 
  num_serie_dispositivo, fecha_registro_dispositivo, propietario_id, status_vehiculo_id, modelo_id)
  values (vehiculo_seq.nextval, to_date('25-09-2023', 'dd-mm-yyyy'), 2023, '1HGCM82633A004363', 0, 0, 1, 
  to_date('25-09-2023', 'dd-mm-yyyy'), to_date('02-03-2024', 'dd-mm-yyyy'), 'DISP020', to_date('25-09-2023', 'dd-mm-yyyy'), 
  propietario_seq.currval, 4, 1);

insert into carga(vehiculo_id, capacidad_ton, capacidad_m3, num_remolques)
  values(vehiculo_seq.currval, 20, 80, 2);

insert into placa(placa_id, num_placa, fecha_asignacion, esta_activa, vehiculo_id, entidad_pais_id)
  values(placa_seq.nextval, 'XYZ012', to_date('25-09-2023', 'dd-mm-yyyy'), 0, vehiculo_seq.currval, 1);


--
--  (10)
--

insert into propietario(propietario_id, nombre, ap_paterno, ap_materno, rfc, curp, correo, puntos_neg_totales) 
  values(propietario_seq.nextval, 'Jose', 'Lopez', 'Hernandez', 'JLH780912HBC', 'LOHJ780912HDFMRL08', 'jose.lopez@gmail.com', 0);

insert into licencia(licencia_id, licencia_anterior_id, num_licencia, foto, firma, huella_izq, fecha_inicio, fecha_fin, propietario_id, tipo_licencia_id)
  values(licencia_seq.nextval, null, 12345670, empty_blob(), empty_blob(), empty_blob(), to_date('31/12/2023','dd/mm/yyyy'), to_date('31/12/2024','dd/mm/yyyy'), 
  propietario_seq.currval, null);

-- 1er vehiculo
insert into vehiculo(vehiculo_id, fecha_status, año, num_serie, es_transporte_pub, es_carga, es_particular, fecha_inicio, fecha_fin, 
  num_serie_dispositivo, fecha_registro_dispositivo, propietario_id, status_vehiculo_id, modelo_id)
  values(vehiculo_seq.nextval, to_date('15-07-2023', 'dd-mm-yyyy'), 2023, '2HGCM82633A004369', 0, 1, 1, 
  to_date('15-07-2023', 'dd-mm-yyyy'), sysdate, 'DISP025', to_date('15-07-2023', 'dd-mm-yyyy'), propietario_seq.currval, 1, 8);

insert into particular(vehiculo_id, num_bolsas_aire, abs, tipo_transmision_id)
  values(vehiculo_seq.currval, 6, 1, 2);

insert into vehiculo_contaminante(vehiculo_contaminante_id, medida, vehiculo_id, contaminante_id)
  values(vehiculo_contaminante_seq.nextval, 1.03, vehiculo_seq.currval, 4);

insert into placa(placa_id, num_placa, fecha_asignacion, esta_activa, vehiculo_id, entidad_pais_id)
  values(placa_seq.nextval, 'BZC997', to_date('15-07-2023', 'dd-mm-yyyy'), 0, vehiculo_seq.currval, 10);

-- 2do vehiculo
insert into vehiculo(vehiculo_id, fecha_status, año, num_serie, es_transporte_pub, es_carga, es_particular, fecha_inicio, fecha_fin, 
  num_serie_dispositivo, fecha_registro_dispositivo, propietario_id, status_vehiculo_id, modelo_id)
  values(vehiculo_seq.nextval, sysdate, 2023, '3HGCM82633A004375', 1, 0, 0, 
  sysdate, null, 'DISP030', sysdate, propietario_seq.currval, 1, 2);

insert into particular(vehiculo_id, num_bolsas_aire, abs, tipo_transmision_id)
  values(vehiculo_seq.currval, 4, 0, 1);

insert into placa(placa_id, num_placa, fecha_asignacion, esta_activa, vehiculo_id, entidad_pais_id)
  values(placa_seq.nextval, 'KIL777', sysdate, 1, vehiculo_seq.currval, 10);




--
--  (11)
--
insert into propietario (propietario_id, nombre, ap_paterno, ap_materno, rfc, curp, correo, puntos_neg_totales) 
  values(propietario_seq.nextval, 'Ana', 'Martinez', 'Garcia', 'AMG870726MPL', 'MAGA870726MDFNNA09', 'ana.martinez@gmail.com', 0);


--
--  (12)
--
insert into propietario (propietario_id, nombre, ap_paterno, ap_materno, rfc, curp, correo, puntos_neg_totales) 
  values(propietario_seq.nextval, 'Luis', 'Rodriguez', 'Perez', 'LRP960816HPL', 'ROPJ960816HDFNLJ10', 'luis.rodriguez@gmail.com', 0);

--
--  (13)
--
insert into propietario (propietario_id, nombre, ap_paterno, ap_materno, rfc, curp, correo, puntos_neg_totales) 
  values(propietario_seq.nextval, 'Isabel', 'Ramirez', 'Lopez', 'IRL820512MTF', 'RALI820512MDFNSL11', 'isabel.ramirez@gmail.com', 0);


--
--  (14)
--
insert into propietario (propietario_id, nombre, ap_paterno, ap_materno, rfc, curp, correo, puntos_neg_totales) 
  values(propietario_seq.nextval, 'Fernando', 'Garcia', 'Hernandez', 'FGH790601HPL', 'GAHF790601HDFNRN12', 'fernando.garcia@gmail.com', 0);


--
--  (15)
--
insert into propietario (propietario_id, nombre, ap_paterno, ap_materno, rfc, curp, correo, puntos_neg_totales) 
  values(propietario_seq.nextval, 'Patricia', 'Hernandez', 'Gomez', 'PHG880401MTF', 'HEGP880401MDFNRT13', 'patricia.hernandez@gmail.com', 0);