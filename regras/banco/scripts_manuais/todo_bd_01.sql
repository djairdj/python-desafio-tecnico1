use mybase;
create table Pessoas (
	idPessoa int identity primary Key,
	nome varchar(100) not null,
	dataNascimento date not null,
	salario float,
	observacoes varchar(200)
);