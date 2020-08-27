# Provisões de Emergência
<div align="center">
	<img src="https://github.com/GodKelvin/Provisoes_de_emergencia/blob/master/images/img_provisoes_de_emergencia.png">
	<br>
	<i>Artista: Kazuki Takahashi</i>
</div>
Trabalho desenvolvido durante a disciplina de BD1

# Sumário

### 1. COMPONENTES<br>
Integrantes do grupo<br>
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
    a) O sistema proposto poderá fornecer quais tipos de relatórios e informaçes? 
    b) Crie uma lista com os 5 principais relatórios que poderão ser obtidos por meio do sistema proposto!
    
> A Empresa DevCom precisa inicialmente dos seguintes relatórios:
* Relatório que mostre o nome de cada supervisor(a) e a quantidade de empregados supervisionados.
* Relatório relativo aos os supervisores e supervisionados. O resultado deve conter o nome do supervisor e nome do supervisionado além da quantidade total de horas que cada supervisionado tem alocada aos projetos existentes na empresa.
* Relatorio que mostre para cada linha obtida o nome do departamento, o valor individual de cada salario existente no  departamento e a média geral de salarios dentre todos os empregados. Os resultados devem ser apresentados ordenados por departamento.
* Relatório que mostre as informações relacionadas a todos empregados de empresa (sem excluir ninguém). As linhas resultantes devem conter informações sobre: rg, nome, salario do empregado, data de início do salario atual, nomes dos projetos que participa, quantidade de horas e localização nos referidos projetos, numero e nome dos departamentos aos quais está alocado, informações do historico de salário como inicio, fim, e valores de salarios antigos que foram inclusos na referida tabela (caso possuam informações na mesma), além de todas informações relativas aos dependentes. 
>> ##### Observações: <br> a) perceba que este relatório pode conter linhas com alguns dados repetidos (mas não todos). <br>  b) para os empregados que não possuirem alguma destas informações o valor no registro deve aparecer sem informação/nulo. 
* Relatório que obtenha a frequencia absoluta e frequencia relativa da quantidade de cpfs únicos no relatório anterior. Apresente os resultados ordenados de forma decrescente pela frequencia relativa.

 
 
#### 4.3 TABELA DE DADOS DO SISTEMA:
[Tabela contendo exemplos de dados do sistema "Provisões de Emergência" (Arquivos .xlsx)](https://github.com/GodKelvin/Provisoes_de_emergencia/blob/master/arquivos/Exemplo_de_tabelas_Provisoes_de_Emergencia.xlsx "Tabela - Provisões de Emergência")
    
    
### 5.MODELO CONCEITUAL<br>    
![Alt text](https://github.com/GodKelvin/Provisoes_de_emergencia/blob/master/images/modelo_conceitual.png)
    
    
        
    
#### 5.1 Validação do Modelo Conceitual
    [Grupo01]: [Nomes dos que participaram na avaliação]
    [Grupo02]: [Nomes dos que participaram na avaliação]

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
># Marco de Entrega 01: Do item 1 até o item 9.1<br>

#### 9.2	CONSULTAS DAS TABELAS COM FILTROS WHERE (Mínimo 4)<br>
#### 9.3	CONSULTAS QUE USAM OPERADORES LÓGICOS, ARITMÉTICOS E TABELAS OU CAMPOS RENOMEADOS (Mínimo 11)
    a) Criar 5 consultas que envolvam os operadores lógicos AND, OR e Not
    b) Criar no mínimo 3 consultas com operadores aritméticos 
    c) Criar no mínimo 3 consultas com operação de renomear nomes de campos ou tabelas

#### 9.4	CONSULTAS QUE USAM OPERADORES LIKE E DATAS (Mínimo 12) <br>
    a) Criar outras 5 consultas que envolvam like ou ilike
    b) Criar uma consulta para cada tipo de função data apresentada.

#### 9.5	INSTRUÇÕES APLICANDO ATUALIZAÇÃO E EXCLUSÃO DE DADOS (Mínimo 6)<br>
    a) Criar minimo 3 de exclusão
    b) Criar minimo 3 de atualização

#### 9.6	CONSULTAS COM INNER JOIN E ORDER BY (Mínimo 6)<br>
    a) Uma junção que envolva todas as tabelas possuindo no mínimo 2 registros no resultado
    b) Outras junções que o grupo considere como sendo as de principal importância para o trabalho

#### 9.7	CONSULTAS COM GROUP BY E FUNÇÕES DE AGRUPAMENTO (Mínimo 6)<br>
    a) Criar minimo 2 envolvendo algum tipo de junção

#### 9.8	CONSULTAS COM LEFT, RIGHT E FULL JOIN (Mínimo 4)<br>
    a) Criar minimo 1 de cada tipo

#### 9.9	CONSULTAS COM SELF JOIN E VIEW (Mínimo 6)<br>
        a) Uma junção que envolva Self Join (caso não ocorra na base justificar e substituir por uma view)
        b) Outras junções com views que o grupo considere como sendo de relevante importância para o trabalho

#### 9.10	SUBCONSULTAS (Mínimo 4)<br>
     a) Criar minimo 1 envolvendo GROUP BY
     b) Criar minimo 1 envolvendo algum tipo de junção

># Marco de Entrega 02: Do item 9.2 até o ítem 9.10<br>

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


