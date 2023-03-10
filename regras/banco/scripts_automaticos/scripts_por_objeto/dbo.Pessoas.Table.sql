USE [mybase]
GO
/****** Object:  Table [dbo].[Pessoas]    Script Date: 06/02/2023 19:39:56 ******/
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
/****** Object:  Index [idx_cpf_pessoas]    Script Date: 06/02/2023 19:39:56 ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_cpf_pessoas] ON [dbo].[Pessoas]
(
	[cpf] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_nome_nasc_pessoas]    Script Date: 06/02/2023 19:39:56 ******/
CREATE NONCLUSTERED INDEX [idx_nome_nasc_pessoas] ON [dbo].[Pessoas]
(
	[nome] ASC,
	[dataNascimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
