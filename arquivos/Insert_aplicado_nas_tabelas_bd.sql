/*Eliminando estrutura do banco de dados*/
drop table if exists GRUPO_FAMILIAR cascade;
drop table if exists PESSOA cascade;
drop table if exists PESSOA_CONSOME cascade;
drop table if exists FORNECEDOR cascade;
drop table if exists FORNECEDOR_PRODUTO cascade;
drop table if exists PRODUTO cascade;
drop table if exists TIPO_PRODUTO cascade;


/*Criacao da estrutura das tabelas*/
create table GRUPO_FAMILIAR(
	cod_grupo_familiar SERIAL primary key not null,
	nome_grupo_familiar varchar(30) not null
);


create table PESSOA(
	cod_pessoa SERIAL primary key not null,
	fk_cod_grupo_familiar integer not null,
	nome_pessoa varchar(50) not null,
	cpf varchar(11) not null,
	data_nascimento date not null
);

create table PESSOA_CONSOME(
	cod_pessoa_consome SERIAL primary key not null,
	fk_cod_produto integer not null,
	fk_cod_pessoa integer not null,
	quantidade_produto float not null
);

create table FORNECEDOR(
	cod_fornecedor SERIAL primary key not null,
	nome_fornecedor varchar(30) not null
);

create table FORNECEDOR_PRODUTO(
	cod_fornecedor_produto SERIAL primary key not null,
	fk_cod_fornecedor integer not null,
	fk_cod_produto integer not null
);

create table PRODUTO(
	cod_produto SERIAL primary key not null,
	fk_cod_tipo_produto integer not null,
	preco_produto float not null,
	nome_produto varchar(40) not null
);

create table TIPO_PRODUTO(
	cod_tipo_produto SERIAL primary key not null,
	nome_tipo_produto varchar(30) not null
);

alter table PESSOA
add foreign key(fk_cod_grupo_familiar) references GRUPO_FAMILIAR(cod_grupo_familiar);

alter table PESSOA_CONSOME
add foreign key(fk_cod_produto) references PRODUTO(cod_produto),
add foreign key(fk_cod_pessoa) references PESSOA(cod_pessoa);

alter table FORNECEDOR_PRODUTO
add foreign key(fk_cod_fornecedor) references FORNECEDOR(cod_fornecedor),
add foreign key(fk_cod_produto) references PRODUTO(cod_produto);

alter table PRODUTO
add foreign key(fk_cod_tipo_produto) references TIPO_PRODUTO(cod_tipo_produto);

/*Insercao dos dados*/
insert into grupo_familiar (nome_grupo_familiar)
values('Minha Casa');


insert into pessoa(fk_cod_grupo_familiar, nome_pessoa, cpf, data_nascimento)
values	(1, 'Kelvin L', '12345678901', '1998-08-15'),
		(1, 'Valdeci G', '21343546984', '1977-09-03'),
		(1, 'Clara L', '08775263728', '2007-12-20'),
		(1, 'Kelen L', '08635243647', '1979-07-05');
		
		
insert into fornecedor(nome_fornecedor)
values 	('MegaG'),
		('Ryu Alimentos'),
		('G2F'),
		('Distrimed');
		

insert into tipo_produto(nome_tipo_produto)
values 	('Alimenticio'),
		('Medicinal'),
		('Limpeza Geral'),
		('Limpeza Pessoal');
		

insert into produto(fk_cod_tipo_produto, nome_produto, preco_produto)
values	(1, 'Arroz', 7.79),
		(1, 'Feijão', 5.99),
		(4, 'Pasta de dente', 3.79),
		(2, 'Antibiotico', 17.03),
		(1, 'Peixe', 37.90),
		(3, 'Desinfetante', 2.59);
		
		
insert into fornecedor_produto(fk_cod_fornecedor, fk_cod_produto)
values 	(1,1),
		(1,2),
		(2,5),
		(3,3),
		(3,6),
		(4,4);
	

insert into pessoa_consome(fk_cod_pessoa, fk_cod_produto, quantidade_produto)
values	(1,1,300.0),
		(2,2,200.0),
		(3,4,1),
		(4,3,1),
		(3,5,100),
		(2,6,250),
		(4,5,100),
		(1,2,200),
		(2,1,200);
		