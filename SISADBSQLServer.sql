USE [master]
GO
/****** Object:  Database [SISACMPL]    Script Date: 10/06/2015 12:56:21 p. m. ******/
CREATE DATABASE [SISACMPL]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SISACMPL', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SISACMPL.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SISACMPL_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SISACMPL_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SISACMPL] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SISACMPL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SISACMPL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SISACMPL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SISACMPL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SISACMPL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SISACMPL] SET ARITHABORT OFF 
GO
ALTER DATABASE [SISACMPL] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SISACMPL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SISACMPL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SISACMPL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SISACMPL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SISACMPL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SISACMPL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SISACMPL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SISACMPL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SISACMPL] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SISACMPL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SISACMPL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SISACMPL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SISACMPL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SISACMPL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SISACMPL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SISACMPL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SISACMPL] SET RECOVERY FULL 
GO
ALTER DATABASE [SISACMPL] SET  MULTI_USER 
GO
ALTER DATABASE [SISACMPL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SISACMPL] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SISACMPL] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SISACMPL] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SISACMPL] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SISACMPL', N'ON'
GO
USE [SISACMPL]
GO
/****** Object:  User [CMPL]    Script Date: 10/06/2015 12:56:21 p. m. ******/
CREATE USER [CMPL] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[anexo]    Script Date: 10/06/2015 12:56:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[anexo](
	[IdAnexo] [int] IDENTITY(1,1) NOT NULL,
	[Correspondencia_Id] [int] NOT NULL,
	[DescripcionAnexo] [nvarchar](250) NULL,
	[UbicacionFisica] [nvarchar](150) NULL,
	[NombreAnexo] [nvarchar](100) NULL,
 CONSTRAINT [PK_anexo_IdAnexo] PRIMARY KEY CLUSTERED 
(
	[IdAnexo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[area]    Script Date: 10/06/2015 12:56:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[area](
	[IdArea] [int] IDENTITY(1,1) NOT NULL,
	[NombreArea] [nvarchar](60) NULL DEFAULT (NULL),
	[DescripcionArea] [nvarchar](150) NULL DEFAULT (NULL),
 CONSTRAINT [PK_area_IdArea] PRIMARY KEY CLUSTERED 
(
	[IdArea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cargo]    Script Date: 10/06/2015 12:56:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cargo](
	[IdCargo] [int] IDENTITY(1,1) NOT NULL,
	[NombreCargo] [nvarchar](100) NULL DEFAULT (NULL),
	[DescripcionCargo] [nvarchar](150) NULL DEFAULT (NULL),
 CONSTRAINT [PK_cargo_IdCargo] PRIMARY KEY CLUSTERED 
(
	[IdCargo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[correspondencia]    Script Date: 10/06/2015 12:56:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[correspondencia](
	[IdCorrespondencia] [int] IDENTITY(1,1) NOT NULL,
	[FechaEmision] [date] NULL,
	[FechaEntrega] [date] NULL,
	[Asunto] [nvarchar](250) NULL,
	[Estatus] [nvarchar](20) NULL,
	[RequiereRespuesta] [binary](1) NULL,
	[NombrePortador] [nvarchar](150) NULL,
	[EnRespuestaA] [nvarchar](25) NULL,
	[URLPDF] [nvarchar](150) NULL,
	[Prioridad] [nvarchar](6) NULL,
	[FechaLimiteR] [date] NULL,
	[Anexo_Id] [int] NULL,
	[DirijidoA_Id] [int] NULL,
 CONSTRAINT [PK_correspondencia_IdCorrespondencia] PRIMARY KEY CLUSTERED 
(
	[IdCorrespondencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dependencia]    Script Date: 10/06/2015 12:56:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dependencia](
	[IdDependencia] [int] IDENTITY(1,1) NOT NULL,
	[NombreDependencia] [nvarchar](200) NULL,
	[AcronimoDependencia] [nvarchar](20) NULL,
	[DescripcionDependencia] [nvarchar](200) NULL,
 CONSTRAINT [PK_dependencia_IdDependencia] PRIMARY KEY CLUSTERED 
(
	[IdDependencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[entidad_externa]    Script Date: 10/06/2015 12:56:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[entidad_externa](
	[IdEntidadExterna] [int] IDENTITY(1,1) NOT NULL,
	[NombreEntidad] [nvarchar](150) NULL,
	[CargoEntidad] [nvarchar](60) NULL,
	[AreaEntidad] [nvarchar](100) NULL,
	[Dependencia_Id] [int] NOT NULL,
 CONSTRAINT [PK_entidad_externa_IdEntidadExterna] PRIMARY KEY CLUSTERED 
(
	[IdEntidadExterna] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[memorandum]    Script Date: 10/06/2015 12:56:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[memorandum](
	[IdConsecutivoMemo] [int] IDENTITY(1,1) NOT NULL,
	[IdMemorandum] [nvarchar](25) NOT NULL,
	[Correspondencia_Id] [int] NOT NULL,
	[Usuario_Id] [int] NOT NULL,
 CONSTRAINT [PK_memorandum_IdConsecutivoMemo] PRIMARY KEY CLUSTERED 
(
	[IdConsecutivoMemo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[observaciones]    Script Date: 10/06/2015 12:56:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[observaciones](
	[IdObservaciones] [int] IDENTITY(1,1) NOT NULL,
	[DescripcionObservaciones] [nvarchar](250) NULL,
	[VistoBueno] [binary](1) NULL,
	[Oficio_Saliente_Id] [int] NOT NULL,
 CONSTRAINT [PK_observaciones_IdObservaciones] PRIMARY KEY CLUSTERED 
(
	[IdObservaciones] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[oficio_entrante]    Script Date: 10/06/2015 12:56:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oficio_entrante](
	[IdOficioEntrante] [int] IDENTITY(1,1) NOT NULL,
	[IdOficioDependencia] [nvarchar](25) NOT NULL,
	[Emisor_Id] [int] NOT NULL,
	[Correspodencia_Id] [int] NOT NULL,
	[Entidad_Externa_Id] [int] NOT NULL,
 CONSTRAINT [PK_oficio_entrante_IdOficioEntrante] PRIMARY KEY CLUSTERED 
(
	[IdOficioEntrante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[oficio_saliente]    Script Date: 10/06/2015 12:56:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oficio_saliente](
	[IdConsecutivo] [int] IDENTITY(1,1) NOT NULL,
	[IdOficioSaliente] [nvarchar](25) NOT NULL,
	[Correspondencia_Id] [int] NOT NULL,
	[Usuario_Id] [int] NOT NULL,
	[URLAcuse] [nvarchar](150) NULL,
	[FechaAcuse] [date] NULL,
 CONSTRAINT [PK_oficio_saliente_IdConsecutivo] PRIMARY KEY CLUSTERED 
(
	[IdConsecutivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rol]    Script Date: 10/06/2015 12:56:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rol](
	[IdRol] [int] IDENTITY(1,1) NOT NULL,
	[NombreRol] [nvarchar](20) NULL DEFAULT (NULL),
	[DescripcionRol] [nvarchar](150) NULL DEFAULT (NULL),
 CONSTRAINT [PK_rol_IdRol] PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[usuario]    Script Date: 10/06/2015 12:56:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL DEFAULT (NULL),
	[ApPaterno] [nvarchar](50) NULL DEFAULT (NULL),
	[ApMaterno] [nvarchar](50) NULL DEFAULT (NULL),
	[Email] [nvarchar](30) NULL DEFAULT (NULL),
	[Password] [nvarchar](255) NULL DEFAULT (NULL),
	[Extension] [int] NULL DEFAULT (NULL),
	[FechaInicio] [date] NULL DEFAULT (NULL),
	[FechaFin] [date] NULL DEFAULT (NULL),
	[URLCV] [nvarchar](150) NULL DEFAULT (NULL),
	[Activo] [binary](1) NULL DEFAULT (NULL),
	[Cargo_Id] [int] NOT NULL,
	[Rol_Id] [int] NOT NULL,
	[Area_Id] [int] NOT NULL,
	[updated_at] [date] NULL DEFAULT (NULL),
	[created_at] [date] NULL DEFAULT (NULL),
 CONSTRAINT [PK_usuario_IdUsuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usuario_turna_correspondencia]    Script Date: 10/06/2015 12:56:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario_turna_correspondencia](
	[Usuario_Id] [int] NOT NULL,
	[Correspondencia_Id] [int] NOT NULL,
	[Tipo] [nvarchar](20) NULL,
 CONSTRAINT [PK_usuario_turna_correspondencia_Usuario_Id] PRIMARY KEY CLUSTERED 
(
	[Usuario_Id] ASC,
	[Correspondencia_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [fk_ANEXO_CORRESPONDENCIA1_idx]    Script Date: 10/06/2015 12:56:21 p. m. ******/
CREATE NONCLUSTERED INDEX [fk_ANEXO_CORRESPONDENCIA1_idx] ON [dbo].[anexo]
(
	[Correspondencia_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_ENTIDAD_EXTERNA_DEPENDENCIA1_idx]    Script Date: 10/06/2015 12:56:21 p. m. ******/
CREATE NONCLUSTERED INDEX [fk_ENTIDAD_EXTERNA_DEPENDENCIA1_idx] ON [dbo].[entidad_externa]
(
	[Dependencia_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_MEMORANDUM_CORRESPONDENCIA1_idx]    Script Date: 10/06/2015 12:56:21 p. m. ******/
CREATE NONCLUSTERED INDEX [fk_MEMORANDUM_CORRESPONDENCIA1_idx] ON [dbo].[memorandum]
(
	[Correspondencia_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_MEMORANDUM_USUARIO1_idx]    Script Date: 10/06/2015 12:56:21 p. m. ******/
CREATE NONCLUSTERED INDEX [fk_MEMORANDUM_USUARIO1_idx] ON [dbo].[memorandum]
(
	[Usuario_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_OBSERVACIONES_OFICIO_SALIENTE1_idx]    Script Date: 10/06/2015 12:56:21 p. m. ******/
CREATE NONCLUSTERED INDEX [fk_OBSERVACIONES_OFICIO_SALIENTE1_idx] ON [dbo].[observaciones]
(
	[Oficio_Saliente_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_OFICIO_ENTRANTE_ENTIDAD_EXTERNA1_idx]    Script Date: 10/06/2015 12:56:21 p. m. ******/
CREATE NONCLUSTERED INDEX [fk_OFICIO_ENTRANTE_ENTIDAD_EXTERNA1_idx] ON [dbo].[oficio_entrante]
(
	[Entidad_Externa_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_OFICIOENTRANTE_CORRESPONDENCIA1_idx]    Script Date: 10/06/2015 12:56:21 p. m. ******/
CREATE NONCLUSTERED INDEX [fk_OFICIOENTRANTE_CORRESPONDENCIA1_idx] ON [dbo].[oficio_entrante]
(
	[Correspodencia_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_OFICIO_SALIENTE_CORRESPONDENCIA1_idx]    Script Date: 10/06/2015 12:56:21 p. m. ******/
CREATE NONCLUSTERED INDEX [fk_OFICIO_SALIENTE_CORRESPONDENCIA1_idx] ON [dbo].[oficio_saliente]
(
	[Correspondencia_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_OFICIO_SALIENTE_USUARIO1_idx]    Script Date: 10/06/2015 12:56:21 p. m. ******/
CREATE NONCLUSTERED INDEX [fk_OFICIO_SALIENTE_USUARIO1_idx] ON [dbo].[oficio_saliente]
(
	[Usuario_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_USUARIO_AREA1_idx]    Script Date: 10/06/2015 12:56:21 p. m. ******/
CREATE NONCLUSTERED INDEX [fk_USUARIO_AREA1_idx] ON [dbo].[usuario]
(
	[Area_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_USUARIO_CARGO_idx]    Script Date: 10/06/2015 12:56:21 p. m. ******/
CREATE NONCLUSTERED INDEX [fk_USUARIO_CARGO_idx] ON [dbo].[usuario]
(
	[Cargo_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_USUARIO_ROL1_idx]    Script Date: 10/06/2015 12:56:21 p. m. ******/
CREATE NONCLUSTERED INDEX [fk_USUARIO_ROL1_idx] ON [dbo].[usuario]
(
	[Rol_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_USUARIO_TURNA_CORRESPONDENCIA_CORRESPONDENCIA1_idx]    Script Date: 10/06/2015 12:56:21 p. m. ******/
CREATE NONCLUSTERED INDEX [fk_USUARIO_TURNA_CORRESPONDENCIA_CORRESPONDENCIA1_idx] ON [dbo].[usuario_turna_correspondencia]
(
	[Correspondencia_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[anexo] ADD  DEFAULT (NULL) FOR [DescripcionAnexo]
GO
ALTER TABLE [dbo].[anexo] ADD  DEFAULT (NULL) FOR [UbicacionFisica]
GO
ALTER TABLE [dbo].[anexo] ADD  DEFAULT (NULL) FOR [NombreAnexo]
GO
ALTER TABLE [dbo].[correspondencia] ADD  DEFAULT (NULL) FOR [FechaEmision]
GO
ALTER TABLE [dbo].[correspondencia] ADD  DEFAULT (NULL) FOR [FechaEntrega]
GO
ALTER TABLE [dbo].[correspondencia] ADD  DEFAULT (NULL) FOR [Asunto]
GO
ALTER TABLE [dbo].[correspondencia] ADD  DEFAULT (NULL) FOR [Estatus]
GO
ALTER TABLE [dbo].[correspondencia] ADD  DEFAULT (NULL) FOR [RequiereRespuesta]
GO
ALTER TABLE [dbo].[correspondencia] ADD  DEFAULT (NULL) FOR [NombrePortador]
GO
ALTER TABLE [dbo].[correspondencia] ADD  DEFAULT (NULL) FOR [EnRespuestaA]
GO
ALTER TABLE [dbo].[correspondencia] ADD  DEFAULT (NULL) FOR [URLPDF]
GO
ALTER TABLE [dbo].[correspondencia] ADD  DEFAULT (NULL) FOR [Prioridad]
GO
ALTER TABLE [dbo].[correspondencia] ADD  DEFAULT (NULL) FOR [FechaLimiteR]
GO
ALTER TABLE [dbo].[correspondencia] ADD  DEFAULT (NULL) FOR [Anexo_Id]
GO
ALTER TABLE [dbo].[correspondencia] ADD  DEFAULT (NULL) FOR [DirijidoA_Id]
GO
ALTER TABLE [dbo].[dependencia] ADD  DEFAULT (NULL) FOR [NombreDependencia]
GO
ALTER TABLE [dbo].[dependencia] ADD  DEFAULT (NULL) FOR [AcronimoDependencia]
GO
ALTER TABLE [dbo].[dependencia] ADD  DEFAULT (NULL) FOR [DescripcionDependencia]
GO
ALTER TABLE [dbo].[entidad_externa] ADD  DEFAULT (NULL) FOR [NombreEntidad]
GO
ALTER TABLE [dbo].[entidad_externa] ADD  DEFAULT (NULL) FOR [CargoEntidad]
GO
ALTER TABLE [dbo].[entidad_externa] ADD  DEFAULT (NULL) FOR [AreaEntidad]
GO
ALTER TABLE [dbo].[observaciones] ADD  DEFAULT (NULL) FOR [DescripcionObservaciones]
GO
ALTER TABLE [dbo].[observaciones] ADD  DEFAULT (NULL) FOR [VistoBueno]
GO
ALTER TABLE [dbo].[oficio_saliente] ADD  DEFAULT (NULL) FOR [URLAcuse]
GO
ALTER TABLE [dbo].[oficio_saliente] ADD  DEFAULT (NULL) FOR [FechaAcuse]
GO
ALTER TABLE [dbo].[usuario_turna_correspondencia] ADD  DEFAULT (NULL) FOR [Tipo]
GO
ALTER TABLE [dbo].[anexo]  WITH CHECK ADD  CONSTRAINT [anexo$fk_ANEXO_CORRESPONDENCIA1] FOREIGN KEY([Correspondencia_Id])
REFERENCES [dbo].[correspondencia] ([IdCorrespondencia])
GO
ALTER TABLE [dbo].[anexo] CHECK CONSTRAINT [anexo$fk_ANEXO_CORRESPONDENCIA1]
GO
ALTER TABLE [dbo].[entidad_externa]  WITH CHECK ADD  CONSTRAINT [entidad_externa$fk_ENTIDAD_EXTERNA_DEPENDENCIA1] FOREIGN KEY([Dependencia_Id])
REFERENCES [dbo].[dependencia] ([IdDependencia])
GO
ALTER TABLE [dbo].[entidad_externa] CHECK CONSTRAINT [entidad_externa$fk_ENTIDAD_EXTERNA_DEPENDENCIA1]
GO
ALTER TABLE [dbo].[memorandum]  WITH CHECK ADD  CONSTRAINT [memorandum$fk_MEMORANDUM_CORRESPONDENCIA1] FOREIGN KEY([Correspondencia_Id])
REFERENCES [dbo].[correspondencia] ([IdCorrespondencia])
GO
ALTER TABLE [dbo].[memorandum] CHECK CONSTRAINT [memorandum$fk_MEMORANDUM_CORRESPONDENCIA1]
GO
ALTER TABLE [dbo].[memorandum]  WITH CHECK ADD  CONSTRAINT [memorandum$fk_MEMORANDUM_USUARIO1] FOREIGN KEY([Usuario_Id])
REFERENCES [dbo].[usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[memorandum] CHECK CONSTRAINT [memorandum$fk_MEMORANDUM_USUARIO1]
GO
ALTER TABLE [dbo].[observaciones]  WITH CHECK ADD  CONSTRAINT [observaciones$fk_OBSERVACIONES_OFICIO_SALIENTE1] FOREIGN KEY([Oficio_Saliente_Id])
REFERENCES [dbo].[oficio_saliente] ([IdConsecutivo])
GO
ALTER TABLE [dbo].[observaciones] CHECK CONSTRAINT [observaciones$fk_OBSERVACIONES_OFICIO_SALIENTE1]
GO
ALTER TABLE [dbo].[oficio_entrante]  WITH CHECK ADD  CONSTRAINT [oficio_entrante$fk_OFICIO_ENTRANTE_ENTIDAD_EXTERNA1] FOREIGN KEY([Entidad_Externa_Id])
REFERENCES [dbo].[entidad_externa] ([IdEntidadExterna])
GO
ALTER TABLE [dbo].[oficio_entrante] CHECK CONSTRAINT [oficio_entrante$fk_OFICIO_ENTRANTE_ENTIDAD_EXTERNA1]
GO
ALTER TABLE [dbo].[oficio_entrante]  WITH CHECK ADD  CONSTRAINT [oficio_entrante$fk_OFICIOENTRANTE_CORRESPONDENCIA1] FOREIGN KEY([Correspodencia_Id])
REFERENCES [dbo].[correspondencia] ([IdCorrespondencia])
GO
ALTER TABLE [dbo].[oficio_entrante] CHECK CONSTRAINT [oficio_entrante$fk_OFICIOENTRANTE_CORRESPONDENCIA1]
GO
ALTER TABLE [dbo].[oficio_saliente]  WITH CHECK ADD  CONSTRAINT [oficio_saliente$fk_OFICIO_SALIENTE_CORRESPONDENCIA1] FOREIGN KEY([Correspondencia_Id])
REFERENCES [dbo].[correspondencia] ([IdCorrespondencia])
GO
ALTER TABLE [dbo].[oficio_saliente] CHECK CONSTRAINT [oficio_saliente$fk_OFICIO_SALIENTE_CORRESPONDENCIA1]
GO
ALTER TABLE [dbo].[oficio_saliente]  WITH CHECK ADD  CONSTRAINT [oficio_saliente$fk_OFICIO_SALIENTE_USUARIO1] FOREIGN KEY([Usuario_Id])
REFERENCES [dbo].[usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[oficio_saliente] CHECK CONSTRAINT [oficio_saliente$fk_OFICIO_SALIENTE_USUARIO1]
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [usuario$fk_USUARIO_AREA1] FOREIGN KEY([Area_Id])
REFERENCES [dbo].[area] ([IdArea])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [usuario$fk_USUARIO_AREA1]
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [usuario$fk_USUARIO_CARGO] FOREIGN KEY([Cargo_Id])
REFERENCES [dbo].[cargo] ([IdCargo])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [usuario$fk_USUARIO_CARGO]
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [usuario$fk_USUARIO_ROL1] FOREIGN KEY([Rol_Id])
REFERENCES [dbo].[rol] ([IdRol])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [usuario$fk_USUARIO_ROL1]
GO
ALTER TABLE [dbo].[usuario_turna_correspondencia]  WITH CHECK ADD  CONSTRAINT [usuario_turna_correspondencia$fk_USUARIO_TURNA_CORRESPONDENCIA_CORRESPONDENCIA1] FOREIGN KEY([Correspondencia_Id])
REFERENCES [dbo].[correspondencia] ([IdCorrespondencia])
GO
ALTER TABLE [dbo].[usuario_turna_correspondencia] CHECK CONSTRAINT [usuario_turna_correspondencia$fk_USUARIO_TURNA_CORRESPONDENCIA_CORRESPONDENCIA1]
GO
ALTER TABLE [dbo].[usuario_turna_correspondencia]  WITH CHECK ADD  CONSTRAINT [usuario_turna_correspondencia$fk_USUARIO_TURNA_CORRESPONDENCIA_USUARIO1] FOREIGN KEY([Usuario_Id])
REFERENCES [dbo].[usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[usuario_turna_correspondencia] CHECK CONSTRAINT [usuario_turna_correspondencia$fk_USUARIO_TURNA_CORRESPONDENCIA_USUARIO1]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sisacmpl.anexo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'anexo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sisacmpl.`area`' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sisacmpl.cargo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cargo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sisacmpl.correspondencia' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'correspondencia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sisacmpl.dependencia' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dependencia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sisacmpl.entidad_externa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'entidad_externa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sisacmpl.memorandum' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'memorandum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sisacmpl.observaciones' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'observaciones'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sisacmpl.oficio_entrante' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oficio_entrante'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sisacmpl.oficio_saliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oficio_saliente'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sisacmpl.rol' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rol'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sisacmpl.usuario' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'usuario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sisacmpl.usuario_turna_correspondencia' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'usuario_turna_correspondencia'
GO
USE [master]
GO
ALTER DATABASE [SISACMPL] SET  READ_WRITE 
GO
