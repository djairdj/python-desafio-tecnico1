CREATE PROCEDURE ATUALIZACAO 
(@id varchar(100), @nome varchar(100), @dataNascimento date, @salario float,
@observacoes varchar(200), @nomeMae varchar(50), @nomePai varchar(50), @cpf varchar(11))
AS
 UPDATE Pessoas
		SET nome = @nome,
			dataNascimento = @dataNascimento,
			salario = @salario,
			observacoes = @observacoes,
			nomeMae = @nomeMae,
			nomePai = @nomePai,
			cpf = @cpf
			WHERE idPessoa = @id;
			
