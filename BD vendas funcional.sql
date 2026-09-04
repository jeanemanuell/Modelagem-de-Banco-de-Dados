-- criando uma nova base de dados BD_VENDAS
create database BD_VENDAS;

-- instanciando (levantando em execução) o
-- banco de dados BD_VENDAS
use BD_VENDAS;
-- criando a tabela de dados FORNECEDOR
create table FORNECEDOR (
	CPF_CNPJ_FORNECEDOR  bigint 	  not  null,
	RAZÃO_SOCIAL		 varchar(40)  not null,
    NOME_FANTASIA		 varchar(50)  null,
    ENDEREÇO_FORNECEDOR  varchar(200) null,
    TELEFONE_FORNECEDOR  char   (20)  null,
    EMAIL_FORNECEDOR     varchar(200) null,
    PESSOA_CONTATO		 varchar(20)  null
);
-- alterando a tabela fornecedor para incluir 
-- uma restrição de chave-primária no atributo
-- CPF_CNPJ_FORNECEDOR
alter table FORNECEDOR add constraint PK_FORN
	primary key (CPF_CNPJ_FORNECEDOR);
    
-- criando a tabela FUNCIONARIO
create table FUNCIONARIO
(
	MATR_FUNCIONARIO		integer		not null,
    NOME_COMPLETO		varchar(50) not null,
    SETOR_FUNCIONARIO	varchar(30) null,
    CARGO_FUNCIONARIO	varchar(20) null,
    TURNO_TRABALHO		char(10)	null
    );
-- agora irei alterar a tabela FUNCIONARIO acrescentando
-- uma regra (contraint) de chave-primária para a matricula
alter table FUNCIONARIO add constraint PK_fUNC
primary key (MATR_FUNCIONARIO);

-- criando a tabela FORMA_PGTO
create table FORMA_PGTO (
	COD_FORMA_PGTO			integer			not null,
    DESCRICAO_FORMA_PGTO	varchar(20) 	not null,
    QTDE_PARCELAS			integer			null,
    ALIQ_JUROS				decimal(4,1)	null
    );
-- alterando esta tabela FORMA_PGTO acrescentando
-- a restrição de chave primária
alter table FORMA_PGTO add constraint PK_FORMA_PGTO
	primary key (COD_FORMA_PGTO);
    
-- criando a tabela PEDIDO_COMPRA
-- obs.: esta tabela possuirá 3 relacionamentos
create table PEDIDO_COMPRA (
	NRO_PEDIDO					integer			not null,
    DTHORA_EMISSAO				datetime		not null,
    ALIQ_DESCONTO				decimal(4,1)	null,
    CPF_CNPJ_FORNECEDOR			bigint			null,
    MATR_FUNC_RESPONSAVEL		integer			null,
    COD_FORMA_PGTO				integer			null
);
-- alterando esta tabela PEDIDO_COMPRA, adicionando
-- uma restrição de chave-primária nesta tabela
alter table PEDIDO_COMPRA add constraint PK_PEDIDO
primary key (NRO_PEDIDO);

-- agora iremos criar o relacionamento entre as tabelas
-- de dados FORNECEDOR e PEDIDO_COMPRA
alter table PEDIDO_COMPRA 
add constraint FK_PEDIDO_FORNECEDORR
foreign key (CPF_CNPJ_FORNECEDOR)
references FORNECEDOR(CPF_CNPJ_FORNECEDOR);

-- agora iremos criar o relacionamento entre as tabelas
-- de dados FORMA_PGTO e PEDIDO_COMPRA
alter table PEDIDO_COMPRA 
add constraint FK_PEDIDO_FORMA_PGTO
foreign key (COD_FORMA_PGTO)
references FORMA_PGTO(COD_FORMA_PGTO);

-- agora iremos criar o relacionamento entre as tabelas
-- de dados FUNCIONARIO e PEDIDO_COMPRA
alter table PEDIDO_COMPRA 
add constraint FK_PEDIDO_FUNCIONARIO
foreign key (MATR_FUNC_RESPONSAVEL)
references FUNCIONARIO(MATR_FUNCIONARIO);

