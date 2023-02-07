USE [mybase]
GO
/****** Object:  StoredProcedure [dbo].[INSERTION]    Script Date: 06/02/2023 19:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INSERTION] 
(@id varchar(100), @nome varchar(100), @dataNascimento date, @salario float,
@observacoes varchar(200), @nomeMae varchar(50), @nomePai varchar(50), @cpf varchar(11))
AS
 INSERT INTO Pessoas(idPessoa, nome, dataNascimento, salario, observacoes, nomeMae, nomePai, cpf) 
		values(
			@id, @nome, @dataNascimento, @salario, @observacoes, @nomeMae, @nomePai, @cpf
			) 
			
GO
