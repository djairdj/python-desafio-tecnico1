USE [mybase]
GO
/****** Object:  StoredProcedure [dbo].[SELECTION]    Script Date: 06/02/2023 19:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SELECTION]
AS
 SELECT * FROM Pessoas ORDER BY nome;			
GO
