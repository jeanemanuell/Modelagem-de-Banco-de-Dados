-- Criando um novo Banco de Dados
CREATE DATABASE BD_ACADEMICO;

-- instanciando (executando) o BD_ACADEMICO
USE BD_ACADEMICO;

-- Criando a tabela CURSO
CREATE TABLE CURSO
(
	co_curso	int		not null,
    nome		varchar(40) null
);
-- esqueci de incluir a chave-primária
-- então iremos alterar esta table incluindo
-- uma restrição (contraint) de primary key
alter table CURSO add constraint PK_CURSO 
primary key (co_curso);

-- Criando a tabela TURMA
create table TURMA
(	co_turma		char(11)	not null,
    ano				char(4)		null,
    periodo			char(1)		null,
	descricao		char(50)	null,
    dt_inicial		datetime	null,
    dt_final		datetime	null,
    num_provas		int			null,
    co_curso		int			null -- chave estrangeira
);
-- adicionando uma restrição (constraint) de primary key
alter table TURMA add constraint PK_TURMA 
primary key (co_turma);

-- relacionando esta tabela TURMA com a tabela CURSO
alter table TURMA add constraint FK_TURMA_CURSO
foreign key (co_curso) references CURSO(co_curso);

-- criando a tabela ALUNO
create table ALUNO
(	co_aluno		int				not null,
    dt_nascimento	datetime		null,
    sg_sexo			char(1)			null,
    nome			varchar(20)		null,
    co_estadocivil  char(1)			null,
    no_pai			varchar(70) 	null,
    no_mae			varchar(70)		null
);
-- alterando a tabela ALUNO acrescentando a PRIMARY KEY
alter table ALUNO add constraint PK_ALUNO 
primary key (co_aluno);

-- criando a tabela associativa ALUNO_TURMA
create table ALUNO_TURMA
(	co_aluno			int				not null,
	co_turma			char(11)		not null,
	dt_matricula		datetime		null,
    dt_cancelamento		datetime		null
);
-- agora iremos adicionar uma chave-primária composta
alter table ALUNO_TURMA add constraint PK_AT
primary key (co_aluno, co_turma);

-- relacionando com a tabela TURMA
alter table ALUNO_TURMA add constraint FK_AT_TURMA
foreign key (co_turma) references TURMA(co_turma);

-- relacionando com a tabela ALUNO
alter table ALUNO_TURMA add constraint FK_AT_ALUNO
foreign key (co_aluno) references ALUNO(co_aluno);

create table PROFESSOR
(	co_professor	int				not null,
    sg_sexp			char(1)			null,
    nome			varchar(20)		null,
    dt_nascimento	datetime		null
);
alter table PROFESSOR add constraint PK_PROF
primary key (co_professor);

create table FREQUENCIA
(	co_aluno		int			not null,
	co_turma		char(11)	not null,
	co_disciplina	char(2)		not null,
    dt_frequencia 	datetime	not null,
    frequencia		char(1)		null
);

alter table FREQUENCIA add constraint PK_FREQ
primary key (dt_frequencia);

alter table FREQUENCIA add constraint FK_AT_FREQ1
foreign key (co_turma) references TURMA(co_turma);

alter table FREQUENCIA add constraint FK_AT_FREQ2
foreign key (co_aluno) references ALUNO(co_aluno);

alter table FREQUENCIA add constraint FK_AT_FREQ3
foreign key (co_disciplina) references DISCIPLINA(co_disciplina);



create table PROF_TURM_DISC
(	co_professor	int			not null,
	co_turma		char(11)	not null,	
	co_disciplina	char(2)		not null
);

alter table PROF_TURM_DISC add constraint FK_PROF
foreign key (co_professor) references PROFESSOR(co_professor);

alter table PROF_TURM_DISC  add constraint FK_DISC
foreign key (co_disciplina) references DISCIPLINA(co_disciplina);

alter table PROF_TURM_DISC add constraint FK_TURMA
foreign key (co_turma) references TURMA(co_turma);

create table DISCIPLINA
(	co_disciplina	char(2)		not null,
	no_disciplina	varchar(30)	null
);
alter table DISCIPLINA add constraint PK_DISCIPLINA
primary key (co_disciplina);

create table AVALIACAO
(	co_aluno		int			not null,
	co_turma		char(11)	not null,
    co_disciplina	char(2)		not null,
    co_prova		char(3)		not null,
    dt_avaliacao	datetime	null,
    nt_avaliacao	float(53)	null
);

alter table AVALIACAO add constraint FK_AVAL1
foreign key (co_aluno) references ALUNO(co_aluno);

alter table AVALIACAO add constraint FK_AVAL2
foreign key (co_turma) references TURMA(co_turma);

alter table AVALIACAO  add constraint FK_AVAL3
foreign key (co_disciplina) references DISCIPLINA(co_disciplina);

alter table AVALIACAO  add constraint FK_AVAL4
foreign key (co_prova) references PROVA(co_prova);

create table PROVA
(	co_prova		char(3)		not null,
	ds_prova		varchar(20)	null
);
alter table PROVA add constraint PK_PROVA
primary key (co_prova);

