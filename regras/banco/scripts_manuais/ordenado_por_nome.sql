/****** Script do comando SelectTopNRows de SSMS  ******/
SELECT TOP (1000) [idPessoa]
      ,[nome]
      ,[dataNascimento]
      ,[salario]
      ,[observacoes]
  FROM [mybase].[dbo].[Pessoas] order by nome asc