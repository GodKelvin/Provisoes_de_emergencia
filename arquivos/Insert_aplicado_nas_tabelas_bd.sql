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
values	('Minha Casa'),
		('Familia de pescadores - VV'),
		('Taberna dos viajantes - ANDO');


insert into pessoa(fk_cod_grupo_familiar, nome_pessoa, cpf, data_nascimento)
values	(1, 'Kelvin L', '83087427853', '1998-08-15'),
		(1, 'Valdeci G', '61576870880', '1977-09-03'),
		(1, 'Clara L', '80663532787', '2007-12-20'),
		(1, 'Kelen L', '6410440979', '1979-07-05'),
		(2, 'Sebastian da Silva', '69505791607', '1986-12-02'),
		(2, 'Eliot S', '14101087830', '1988-01-28'),
		(2, 'Tião Moreira', '92251924876', '1983-05-03'),
		(2, 'Haley Quinn', '2407861736', '1996-06-05'),
		(2, 'Nair P', '27148449286', '1993-05-29'),
		(2, 'Fabio Brazza', '10176554130', '1998-09-08'),
		(3, 'Alexander Kernel', '43490663063', '1990-09-06'),
		(3, 'Rita da Conquista', '73490663063', '1996-08-26'),
		(3, 'Arthur Excalibur','46733400006', '1998-07-30'),
		(3, 'Morgan Freeman', '09248073000', '1961-05-08'),
		(3, 'Gerald de Rivia', '49033310082', '1934-10-09'),
		(3, 'Merlin de Avalon', '93397782007', '1960-05-17'),
		(3, 'Gawayn Cristan', '11873481047', '1995-07-27'),
		(3, 'Borz Graal', '16521580060', '1955-08-21'),
		(3, 'Mordred Moreira', '63320779052', '1955-08-21'),
		(3, 'Derfel da Silva', '88385078053', '1923-12-31');
		
		
insert into fornecedor(nome_fornecedor)
values 	('MegaG'),
		('Ryu Alimentos'),
		('G2F'),
		('Distrimed'),
		('Famarcia do povo'),
		('Alimentos CIA'),
		('Limpeza do dia');
		

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
		(3, 'Desinfetante', 2.59),
		(1, 'Macarrão', 4.39),
		(1, 'Farinha', 5.39),
		(2, 'Enxak', 10.99),
		(1, 'Maçã', 2.38),
		(2, 'Insulina', 6.99),
		(4, 'Alcool em gel', 11.99),
		(3, 'Cloro', 10.79),
		(1, 'Café', 3.99),
		(3, 'Sabonete', 0.98),
		(1, 'Carne de porco', 9.90), 	
		(1, 'Sopa enlatada', 4.55),		
		(2, 'Xarope', 5.00),			
		(4, 'Shampoo', 3.40),			
		(3, 'Sacos de lixo', 2.50),
		(1, 'Leite condensado', 5.95),	
		(3, 'Sabão em pó', 7.90),	
		(3, 'Água sanitária', 11.29),	
		(1, 'Tomate Carmem', 3.59),	
		(1, 'Presunto Fatiado', 8.80),	
		(1, 'Batata Monalise', 3.85),	
		(1, 'Ovos brancos', 6.70),	
		(1, 'Filé de Frango', 19.99),	
		(2, 'Dorflex', 3.68),	
		(2, 'Vitamina C', 8.59);		
		
		
insert into fornecedor_produto(fk_cod_fornecedor, fk_cod_produto)
values 	(1,1),
		(1,2),
		(2,5),
		(3,3),
		(3,6),
		(4,4),
		(5,10),
		(6,7),
		(7,12),
		(1,8),
		(6,9),
		(4,11),
		(2,16),
		(7,20),
		(3,19),
		(5,18),
		(1,21),
		(2,22),
		(3,23),
		(4,24),
		(5,25),
		(6,26),
		(7,27),
		(5,28),
		(4,29),
		(3,30);
	

insert into pessoa_consome(fk_cod_pessoa, fk_cod_produto, quantidade_produto)
values	(1,1,300.0),
		(2,2,200.0),
		(3,4,1),
		(4,3,1),
		(3,5,100),
		(2,6,250),
		(4,5,100),
		(1,2,200),
		(2,1,200),
		(5,7,22),
		(6,8,100),
		(7,9,8),
		(8,10,3),
		(9,11,100),
		(10,12,500),
		(5,1,200),
		(6,2,300),
		(7,2,1),
		(8,6,150),
		(9,1,100),
		(10,2,150),
		(5,14,100),
		(11,16,200),
		(12,17,15),
		(13,20,5),
		(15,5,100),
		(16,10,10),
		(17,2,200),
		(19, 8,100),
		(20, 7,240),
		(11, 1,200),
		(9, 16, 400),
		(12, 3,2),
		(6, 13,3),
		(1, 21,120),
		(2, 22,100),
		(3, 23,1),
		(4,25,2),
		(5,24,3),
		(6,25,4),
		(7,26,5),
		(8,27,6),
		(9,28,7),
		(10,29,8),
		(11,30,9),
		(12, 1,10),
		(13,2,1),
		(14,3,2),
		(15,4,100),
		(16,5,200),
		(17,6,4),
		(18,7,5),
		(19,8,6),
		(20,9,87),
		(1,10,8),
		(2,11,9),
		(3,12,10),
		(4,13,200);