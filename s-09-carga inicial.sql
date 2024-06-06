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

