USE [master]
GO
/****** Object:  Database [Isipoint]    Script Date: 08/28/2018 12:35:03 ******/
CREATE DATABASE [Isipoint] ON  PRIMARY 
( NAME = N'Isipoint', FILENAME = N'D:\Datos\Isipoint.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Isipoint_log', FILENAME = N'D:\Datos\Isipoint_1.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Isipoint] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Isipoint].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Isipoint] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Isipoint] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Isipoint] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Isipoint] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Isipoint] SET ARITHABORT OFF
GO
ALTER DATABASE [Isipoint] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Isipoint] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Isipoint] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Isipoint] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Isipoint] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Isipoint] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Isipoint] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Isipoint] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Isipoint] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Isipoint] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Isipoint] SET  DISABLE_BROKER
GO
ALTER DATABASE [Isipoint] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Isipoint] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Isipoint] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Isipoint] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Isipoint] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Isipoint] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Isipoint] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Isipoint] SET  READ_WRITE
GO
ALTER DATABASE [Isipoint] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Isipoint] SET  MULTI_USER
GO
ALTER DATABASE [Isipoint] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Isipoint] SET DB_CHAINING OFF
GO
USE [Isipoint]
GO
/****** Object:  Table [dbo].[universidades]    Script Date: 08/28/2018 12:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[universidades](
	[id] [int] NOT NULL,
	[universidad] [nvarchar](50) NULL,
	[tipo] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[universidades] ([id], [universidad], [tipo]) VALUES (1, N'Escuela Superior de Administración Pública (ESAP)', N'pública')
INSERT [dbo].[universidades] ([id], [universidad], [tipo]) VALUES (2, N'Universidad Nacional de Colombia (UNAL)', N'pública')
INSERT [dbo].[universidades] ([id], [universidad], [tipo]) VALUES (3, N' Universidad Distrital Francisco José de Caldas', N'pública')
INSERT [dbo].[universidades] ([id], [universidad], [tipo]) VALUES (4, N'Universidad Militar Nueva Granada (UMNG)', N'pública')
INSERT [dbo].[universidades] ([id], [universidad], [tipo]) VALUES (5, N'Universidad Nacional Abierta y a Distancia (UNAD)', N'pública')
INSERT [dbo].[universidades] ([id], [universidad], [tipo]) VALUES (6, N'Universidad Pedagógica Nacional', N'pública')
INSERT [dbo].[universidades] ([id], [universidad], [tipo]) VALUES (7, N'Universidad Colegio Mayor de Cundinamarca ', N'pública')
INSERT [dbo].[universidades] ([id], [universidad], [tipo]) VALUES (8, N'Corporación Universitaria Minuto de Dios', N'Privadas')
/****** Object:  Table [dbo].[internet]    Script Date: 08/28/2018 12:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[internet](
	[id] [int] NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_internet] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[internet] ([id], [descripcion]) VALUES (1, N'Tiene Internet')
INSERT [dbo].[internet] ([id], [descripcion]) VALUES (2, N'Sin Internet')
/****** Object:  Table [dbo].[Areas]    Script Date: 08/28/2018 12:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Areas](
	[id] [int] NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Areas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Areas] ([id], [descripcion]) VALUES (1, N'rural')
INSERT [dbo].[Areas] ([id], [descripcion]) VALUES (2, N'Urbana')
/****** Object:  Table [dbo].[AlumnosEncuesta]    Script Date: 08/28/2018 12:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlumnosEncuesta](
	[id] [int] NOT NULL,
	[nombres] [nchar](10) NULL,
	[apellidos] [nchar](10) NULL,
	[id_universidad] [int] NULL,
	[id_semestre] [int] NULL,
	[id_area] [int] NULL,
	[id_internet] [int] NULL,
	[GastosMatricula] [int] NULL,
 CONSTRAINT [PK_AlumnosEncuesta] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AlumnosEncuesta] ([id], [nombres], [apellidos], [id_universidad], [id_semestre], [id_area], [id_internet], [GastosMatricula]) VALUES (1, N'kabuto    ', N'yakushi   ', 8, 1, 2, 1, 4000)
INSERT [dbo].[AlumnosEncuesta] ([id], [nombres], [apellidos], [id_universidad], [id_semestre], [id_area], [id_internet], [GastosMatricula]) VALUES (2, N'Kakashi   ', N'Hatake    ', 5, 3, 1, 2, 5600)
INSERT [dbo].[AlumnosEncuesta] ([id], [nombres], [apellidos], [id_universidad], [id_semestre], [id_area], [id_internet], [GastosMatricula]) VALUES (3, N'Hayate    ', N'Gekkō     ', 1, 2, 1, 2, 2000)
INSERT [dbo].[AlumnosEncuesta] ([id], [nombres], [apellidos], [id_universidad], [id_semestre], [id_area], [id_internet], [GastosMatricula]) VALUES (4, N'Dan       ', N'Katō      ', 6, 1, 2, 1, 10000)
INSERT [dbo].[AlumnosEncuesta] ([id], [nombres], [apellidos], [id_universidad], [id_semestre], [id_area], [id_internet], [GastosMatricula]) VALUES (5, N'pepe      ', N'pepe      ', 1, 1, 1, 1, 565656)
/****** Object:  ForeignKey [FK__AlumnosEn__id_ar__1A14E395]    Script Date: 08/28/2018 12:35:03 ******/
ALTER TABLE [dbo].[AlumnosEncuesta]  WITH CHECK ADD FOREIGN KEY([id_area])
REFERENCES [dbo].[Areas] ([id])
GO
/****** Object:  ForeignKey [FK__AlumnosEn__id_in__1B0907CE]    Script Date: 08/28/2018 12:35:03 ******/
ALTER TABLE [dbo].[AlumnosEncuesta]  WITH CHECK ADD FOREIGN KEY([id_internet])
REFERENCES [dbo].[internet] ([id])
GO
/****** Object:  ForeignKey [FK__AlumnosEn__id_un__1920BF5C]    Script Date: 08/28/2018 12:35:03 ******/
ALTER TABLE [dbo].[AlumnosEncuesta]  WITH CHECK ADD FOREIGN KEY([id_universidad])
REFERENCES [dbo].[universidades] ([id])
GO
