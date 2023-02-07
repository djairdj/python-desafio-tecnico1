CREATE PROCEDURE SELECTION_ID
(@id varchar(100))
AS
 SELECT * FROM Pessoas WHERE idPessoa = @id;			
