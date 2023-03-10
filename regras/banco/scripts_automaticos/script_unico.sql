USE [master]
GO
/****** Object:  Database [mybase]    Script Date: 06/02/2023 19:41:39 ******/
CREATE DATABASE [mybase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mybase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\mybase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'mybase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\mybase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [mybase] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mybase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mybase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mybase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mybase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mybase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mybase] SET ARITHABORT OFF 
GO
ALTER DATABASE [mybase] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [mybase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mybase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mybase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mybase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mybase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mybase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mybase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mybase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mybase] SET  ENABLE_BROKER 
GO
ALTER DATABASE [mybase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mybase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mybase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mybase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mybase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mybase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [mybase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mybase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [mybase] SET  MULTI_USER 
GO
ALTER DATABASE [mybase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mybase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mybase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mybase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [mybase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [mybase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [mybase] SET QUERY_STORE = ON
GO
ALTER DATABASE [mybase] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [mybase]
GO
/****** Object:  Table [dbo].[Pessoas]    Script Date: 06/02/2023 19:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pessoas](
	[idPessoa] [varchar](100) NOT NULL,
	[nome] [varchar](100) NOT NULL,
	[dataNascimento] [date] NOT NULL,
	[salario] [float] NULL,
	[observacoes] [varchar](200) NULL,
	[nomeMae] [varchar](50) NULL,
	[nomePai] [varchar](50) NULL,
	[cpf] [varchar](11) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idPessoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_cpf_pessoas]    Script Date: 06/02/2023 19:41:39 ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_cpf_pessoas] ON [dbo].[Pessoas]
(
	[cpf] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_nome_nasc_pessoas]    Script Date: 06/02/2023 19:41:39 ******/
CREATE NONCLUSTERED INDEX [idx_nome_nasc_pessoas] ON [dbo].[Pessoas]
(
	[nome] ASC,
	[dataNascimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[ATUALIZACAO]    Script Date: 06/02/2023 19:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ATUALIZACAO] 
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
			
GO
/****** Object:  StoredProcedure [dbo].[INSERTION]    Script Date: 06/02/2023 19:41:39 ******/
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
/****** Object:  StoredProcedure [dbo].[REMOCAO]    Script Date: 06/02/2023 19:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[REMOCAO]
(@id varchar(100))
AS
 DELETE FROM Pessoas WHERE idPessoa = @id;			
GO
/****** Object:  StoredProcedure [dbo].[SELECTION]    Script Date: 06/02/2023 19:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SELECTION]
AS
 SELECT * FROM Pessoas ORDER BY nome;			
GO
/****** Object:  StoredProcedure [dbo].[SELECTION_ID]    Script Date: 06/02/2023 19:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SELECTION_ID]
(@id varchar(100))
AS
 SELECT * FROM Pessoas WHERE idPessoa = @id;			
GO
USE [master]
GO
ALTER DATABASE [mybase] SET  READ_WRITE 
GO
