USE [mybase]
GO
/****** Object:  StoredProcedure [dbo].[SELECTION_ID]    Script Date: 06/02/2023 19:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SELECTION_ID]
(@id varchar(100))
AS
 SELECT * FROM Pessoas WHERE idPessoa = @id;			
GO
