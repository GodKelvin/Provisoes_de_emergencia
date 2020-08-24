drop table if exists GRUPO_FAMILIAR cascade;
drop table if exists PESSOA cascade;
drop table if exists PESSOA_CONSOME cascade;
drop table if exists FORNECEDOR cascade;
drop table if exists FORNECEDOR_PRODUTO cascade;
drop table if exists PRODUTO cascade;
drop table if exists TIPO_PRODUTO cascade;



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