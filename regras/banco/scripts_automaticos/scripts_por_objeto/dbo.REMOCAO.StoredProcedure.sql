USE [mybase]
GO
/****** Object:  StoredProcedure [dbo].[REMOCAO]    Script Date: 06/02/2023 19:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[REMOCAO]
(@id varchar(100))
AS
 DELETE FROM Pessoas WHERE idPessoa = @id;			
GO
