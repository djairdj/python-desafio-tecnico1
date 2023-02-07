CREATE PROCEDURE REMOCAO
(@id varchar(100))
AS
 DELETE FROM Pessoas WHERE idPessoa = @id;			
