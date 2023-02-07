use mybase;
drop table if exists Pessoas;
create table Pessoas (
	idPessoa varchar(100) primary Key,
	nome varchar(100) not null,
	dataNascimento date not null,
	salario float,
	observacoes varchar(200)
);

alter table Pessoas add nomeMae varchar(50);
alter table Pessoas add nomePai varchar(50);
alter table Pessoas add cpf varchar(11) not null;

CREATE NONCLUSTERED INDEX idx_nome_nasc_pessoas
	ON Pessoas(nome, dataNascimento);

CREATE UNIQUE INDEX idx_cpf_pessoas
	ON Pessoas(cpf);

select * from Pessoas;

INSERT INTO Pessoas (idPessoa, nome, dataNascimento, salario, observacoes, nomeMae, nomePai, cpf)
     VALUES (
		   'a77c44ec-3ea2-4e59-a313-fbd0a6f2517e',
		   'Eduardo Gomes',
           '1996-09-23',
		   '26300',
		   'Bal do Skate',
		   'Tina Gomes',
		   'Luiz Gomes',
		   '05771509441');
