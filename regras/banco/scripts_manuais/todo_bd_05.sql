CREATE PROCEDURE INSERTION 
(@id varchar(100), @nome varchar(100), @dataNascimento date, @salario float,
@observacoes varchar(200), @nomeMae varchar(50), @nomePai varchar(50), @cpf varchar(11))
AS
 INSERT INTO Pessoas(idPessoa, nome, dataNascimento, salario, observacoes, nomeMae, nomePai, cpf) 
		values(
			@id, @nome, @dataNascimento, @salario, @observacoes, @nomeMae, @nomePai, @cpf
			) 
			
