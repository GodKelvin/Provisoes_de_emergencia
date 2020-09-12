# Provisões de Emergência
<div align="center">
	<img src="https://github.com/GodKelvin/Provisoes_de_emergencia/blob/master/images/img_provisoes_de_emergencia.png">
	<br>
	<i>Artista: Kazuki Takahashi</i>
</div>
Trabalho desenvolvido durante a disciplina de BD1

# Sumário

### 1. COMPONENTES<br>
Kelvin Lehrback Guilherme<br>

### 2.INTRODUÇÃO E MOTIVAÇÃO<br>
Este documento contém a especificação do projeto do banco de dados Provisões de Emergência 
<br>e motivação da escolha realizada. <br>
O sistema “Provisões de emergência” tem como objetivo contribuir com o  planejamento financeiro de famílias e ONGS, gerando relatórios de preços e/ou dos produtos realmente essenciais para cada realidade num determinado intervalo de tempo. Devido ao cenário que se encontra o ano de 2020, tornou-se ainda mais importante ter um controle financeiro, principalmente quando o assunto é alimentação e saúde. O objetivo inicial do sistema é gerar um relatório listando todos os bens de consumo para a sobrevivência num determinado intervalo de tempo, bem como os seus respectivos preços.
 

### 3.MINI-MUNDO<br>
O sistema “Provisões de emergência” conterá as informações aqui detalhadas.  É necessário o cadastro da quantidade de pessoas. Pessoas são cadastradas por meio do nome, CPF, data de nascimento, grupo familiar a qual pertence e o informe se necessitam ou não de medicamentos, se necessário medicamentos, informar o(s) nome(s) do(s) medicamento(s), a dose diária de cada um e o preço médio (se conhecido o preço) ou um previsto. É necessário também informar a quantidade de comida que as pessoas consomem por dia, bem como quais alimentos essenciais para a preparação das respectivas refeições diárias (arroz, feijão, carne, verduras) e seus respectivos preços (médio ou previsto). Há ainda os gastos com produtos de limpeza, seja ele geral(desinfetantes, sabão para roupas etc) ou pessoal (sabonetes, pasta de dente, etc), informar também o preço médio ou previsto. Para a compra dos produtos, é necessário conhecer os fornecedores. Fornecedores possuem nome e quais produtos eles entregam, podendo ter o(s) produto(s) em estoque ou não. 

### 4.PROTOTIPAÇÃO, PERGUNTAS A SEREM RESPONDIDAS E TABELA DE DADOS<br>
#### 4.1 RASCUNHOS BÁSICOS DA INTERFACE (MOCKUPS)<br>
[Protótipo de telas feito para o sistema "Provisoes de Emergencia" (Arquivo .PDF)](https://github.com/GodKelvin/Provisoes_de_emergencia/blob/master/arquivos/Prototipo_telas.pdf "Provisões de Emergência")

#### 4.2 QUAIS PERGUNTAS PODEM SER RESPONDIDAS COM O SISTEMA PROPOSTO?

**O Sistema "Provisões de Emergência" precisa inicialmente dos seguintes relatórios:**

* Relatório listando todos os produtos (bens de consumo) de determinado grupo familiar.
* Relatório listando o preço (individual e total) dos produtos de cada grupo familiar.
* Relatório listando a quantidade de cada produto necessário de cada grupo familiar.
* Relatório listando quais produtos estão disponíveis para ser entregues por determinado fornecedor.
* Relatório listando qual tipo de produto está sendo mais requisitado nos grupos familiares.
* Relatório listando qual produto está sendo mais requisitado nos grupos familiares.
* Relatório listando as pessoas de cada grupo familiar.
* Relatório listando quais produtos cada pessoa está consumindo.
* Relatório listando todos os produtos cadastrados ordenando pelo tipo.

#### 4.3 TABELA DE DADOS DO SISTEMA:
[Tabela contendo exemplos de dados do sistema "Provisões de Emergência" (Arquivos .xlsx)](https://github.com/GodKelvin/Provisoes_de_emergencia/blob/master/arquivos/Exemplo_de_tabelas_Provisoes_de_Emergencia.xlsx "Tabela - Provisões de Emergência")
    
    
### 5.MODELO CONCEITUAL<br>    
![Alt text](https://github.com/GodKelvin/Provisoes_de_emergencia/blob/master/images/modelo_conceitual.png)
    
    
#### 5.1 Validação do Modelo Conceitual
**PedidON:** Thiago da Costa Freitas, Eduarda Simões<br>
Observações feitas pelos integrantes: *Se o relaciomento "Consome" não deveria ser uma tabela associativa.*<br>

**ATVGen:** Matheus Costa<br>
Observações feitas pelos integrantes: *Não precisaria do endereço do fornecedor e da pessoa? Incluindo assim, algo com geolocalização.*<br>

> Observações em análise.

#### 5.2 Descrição dos dados 
**GRUPO_FAMILIAR**: Tabela que armazena as informações referentes ao grupo familiar que determinada pessoa pertence.<br>
*cod_grupo-familiar*: Campo do tipo inteiro que é utilizado para identificar determinado grupo familiar que a pessoa está inserida.<br>
*nome_grupo_familiar*: Campo do tipo string que nomeia determinado grupo familiar.<br>

**PESSOA**: Tabela que armazena as informações referentes à pessoa.<br>
*cod_pessoa*: Campo do tipo inteiro que identifica determinada pessoa.<br>
*fk_cod_grupo_familiar*: Chave estrangeira do tipo inteiro que identifica à qual grupo familiar essa pessoa está inserida.<br>
*nome_pessoa*: Campo do tipo varchar utilizado para armazenar o nome de cada pessoa.<br>
*cpf*: Campo do tipo varchar que armazena o número de cadastro de pessoa física de cada pessoa.<br>
*data_nascimento*: Campo do tipo date que armazena a data de nascimento da pessoa.<br>

**PESSOA_CONSOME**: Tabela que armazena as informações referentes ao consumo de cada pessoa.<br>
*cod_pessoa*: Campo do tipo inteiro que identifica a tupla contendo as informações de consumo de cada pessoa.<br>
*fk_cod_produto*: Chave estrangeira do tipo inteiro que identifca qual produto a pessoa está consumindo.<br>
*fk_cod_pessoa*: Chave estrangeira do tipo inteiro que identifica qual pessoa está consumindo determinado produto.<br>
*quantidade_produto*: Campo do tipo float que identificar o quanto aquela pessoa está consumindo determinado produto.<br>

**FORNECEDOR**: Tabela que armazena as informações dos fornecedores cadastrados.<br>
*cod_fornecedor*: Campo do tipo inteiro que identifica cada fornecedor no sistema.<br>
*nome_fornecedor*: Campo do tipo varchar que nomeia cada fornecedor disponível no sistema.<br>

**FORNECEDOR_PRODUTO**: Tabela que armazena as informações referentes a qual produto cada fornecedor fornece.<br>
*cod_fornecedor_produto*: Campo do tipo inteiro que identifica a tupla contendo as informações do fornecimento de cada produto.<br>
*fk_cod_fornecedor*: Chave estrangeira do tipo inteiro que identifica qual fornecedor está fornecendo determinado produto.<br>
*fk_cod_produto*: chave estrangeira do tipo inteiro que identifica qual produto está sendo fornecido.

**PRODUTO**: Tabela que armazena as informações referentes à produto.<br>
*cod_produto*: Campo do tipo inteiro que identifica cada produto no sistema.<br>
*fk_cod_tipo_produto*: Chave estrangeira do tipo inteiro que identifica o tipo do produto.<br>
*preco_produto*: Campo do tipo float que armazena o preco aproximado de um produto.<br>
*nome_produto*: Campo do tipo varchar que nomeia cada produto.<br>

**TIPO_PRODUTO**: Tabela que armazena as informações refentes ao tipo de produto.<br>
*cod_tipo_produto*: Campo do tipo inteiro que identifica o tipo de produto.<br>
*nome_tipo_produto*: Campo do tipo varchar que nomeia cada tipo de produto.<br>



### 6	MODELO LÓGICO<br>
![Alt text](https://github.com/GodKelvin/Provisoes_de_emergencia/blob/master/images/modelo_logico.png)

### 7	MODELO FÍSICO<br>
```
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
```
        
       
### 8	INSERT APLICADO NAS TABELAS DO BANCO DE DADOS<br>
[Script de exclusão, criação da estrutura e inserção dos dados (arquivo SQL)](https://github.com/GodKelvin/Provisoes_de_emergencia/blob/master/arquivos/Insert_aplicado_nas_tabelas_bd.sql)


### 9	TABELAS E PRINCIPAIS CONSULTAS<br>

#### 9.1	CONSULTAS DAS TABELAS COM TODOS OS DADOS INSERIDOS (Todas) <br>
[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://github.com/GodKelvin/Provisoes_de_emergencia/blob/master/arquivos/Trabalho_bd1_item_91_Kelvin_Lehrback.ipynb)

#### SEGUNDA ENTREGA: Itens 9.2 até o 9.10
[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://github.com/GodKelvin/Provisoes_de_emergencia/blob/master/arquivos/Trabalho_bd1_item_92_Kelvin_Lehrback.ipynb)

### 10 RELATÓRIOS E GRÁFICOS

#### a) análises e resultados provenientes do banco de dados desenvolvido (usar modelo disponível)
#### b) link com exemplo de relatórios será disponiblizado pelo professor no AVA
#### OBS: Esta é uma atividade de grande relevância no contexto do trabalho. Mantenha o foco nos 5 principais relatórios/resultados visando obter o melhor resultado possível.

    

### 11	AJUSTES DA DOCUMENTAÇÃO, CRIAÇÃO DOS SLIDES E VÍDEO PARA APRESENTAÇAO FINAL <br>

#### a) Modelo (pecha kucha)<br>
#### b) Tempo de apresentação 6:40 

># Marco de Entrega 03: Itens 10 e 11<br>
<br>
<br>
<br> 



### 12 FORMATACAO NO GIT:<br> 
https://help.github.com/articles/basic-writing-and-formatting-syntax/
<comentario no git>
    
##### About Formatting
    https://help.github.com/articles/about-writing-and-formatting-on-github/
    
##### Basic Formatting in Git
    
    https://help.github.com/articles/basic-writing-and-formatting-syntax/#referencing-issues-and-pull-requests
    
    
##### Working with advanced formatting
    https://help.github.com/articles/working-with-advanced-formatting/
#### Mastering Markdown
    https://guides.github.com/features/mastering-markdown/

    
### OBSERVAÇÕES IMPORTANTES

#### Todos os arquivos que fazem parte do projeto (Imagens, pdfs, arquivos fonte, etc..), devem estar presentes no GIT. Os arquivos do projeto vigente não devem ser armazenados em quaisquer outras plataformas.
1. <strong>Caso existam arquivos com conteúdos sigilosos<strong>, comunicar o professor que definirá em conjunto com o grupo a melhor forma de armazenamento do arquivo.

#### Todos os grupos deverão fazer Fork deste repositório e dar permissões administrativas ao usuário do git "profmoisesomena", para acompanhamento do trabalho.

#### Os usuários criados no GIT devem possuir o nome de identificação do aluno (não serão aceitos nomes como Eu123, meuprojeto, pro456, etc). Em caso de dúvida comunicar o professor.


Link para BrModelo:<br>
http://www.sis4.com/brModelo/download.html
<br>


Link para curso de GIT<br>
![https://www.youtube.com/curso_git](https://www.youtube.com/playlist?list=PLo7sFyCeiGUdIyEmHdfbuD2eR4XPDqnN2?raw=true "Title")


