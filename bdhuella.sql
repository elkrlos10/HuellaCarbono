USE [master]
GO
/****** Object:  Database [HuellaCarbono]    Script Date: 14/09/2018 16:08:36 ******/
CREATE DATABASE [HuellaCarbono]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HuellaCarbono', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLSERV2014\MSSQL\DATA\HuellaCarbono.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HuellaCarbono_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLSERV2014\MSSQL\DATA\HuellaCarbono_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HuellaCarbono] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HuellaCarbono].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HuellaCarbono] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HuellaCarbono] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HuellaCarbono] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HuellaCarbono] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HuellaCarbono] SET ARITHABORT OFF 
GO
ALTER DATABASE [HuellaCarbono] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HuellaCarbono] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HuellaCarbono] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HuellaCarbono] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HuellaCarbono] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HuellaCarbono] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HuellaCarbono] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HuellaCarbono] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HuellaCarbono] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HuellaCarbono] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HuellaCarbono] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HuellaCarbono] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HuellaCarbono] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HuellaCarbono] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HuellaCarbono] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HuellaCarbono] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HuellaCarbono] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HuellaCarbono] SET RECOVERY FULL 
GO
ALTER DATABASE [HuellaCarbono] SET  MULTI_USER 
GO
ALTER DATABASE [HuellaCarbono] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HuellaCarbono] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HuellaCarbono] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HuellaCarbono] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HuellaCarbono] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HuellaCarbono', N'ON'
GO
USE [HuellaCarbono]
GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 14/09/2018 16:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empresa](
	[IdEmpresa] [int] IDENTITY(1,1) NOT NULL,
	[NombreEmpresa] [varchar](150) NOT NULL,
	[Nit] [varchar](20) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[TipoEmpresa] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Empresa] PRIMARY KEY CLUSTERED 
(
	[IdEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Energia]    Script Date: 14/09/2018 16:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Energia](
	[IdEnergia] [int] IDENTITY(1,1) NOT NULL,
	[IdProyecto] [int] NOT NULL,
	[EnergiaKwh] [float] NOT NULL,
	[Gas] [float] NOT NULL,
	[EnergiaRenovable] [bit] NOT NULL,
 CONSTRAINT [PK_Energia] PRIMARY KEY CLUSTERED 
(
	[IdEnergia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FactorEmision]    Script Date: 14/09/2018 16:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactorEmision](
	[IdFactor] [int] IDENTITY(1,1) NOT NULL,
	[Gasolina_Km] [float] NOT NULL,
	[Diesel_Km] [float] NOT NULL,
	[Gas_M3] [float] NOT NULL,
	[Gasolina_Ltr] [float] NOT NULL,
	[Diesel_Ltr] [float] NOT NULL,
	[ResiduoSolido] [float] NULL,
	[Energia] [float] NULL,
 CONSTRAINT [PK_FactorEmision] PRIMARY KEY CLUSTERED 
(
	[IdFactor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Huella]    Script Date: 14/09/2018 16:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Huella](
	[IdHuella] [int] IDENTITY(1,1) NOT NULL,
	[IdProyecto] [int] NOT NULL,
	[Toneledas] [float] NOT NULL,
	[fecha] [date] NOT NULL,
	[Porcentaje] [float] NOT NULL,
 CONSTRAINT [PK_Huella] PRIMARY KEY CLUSTERED 
(
	[IdHuella] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Maquinas]    Script Date: 14/09/2018 16:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maquinas](
	[IdMaquina] [int] IDENTITY(1,1) NOT NULL,
	[IdProyecto] [int] NOT NULL,
	[Can_Gasolina] [int] NOT NULL,
	[Lts_Gasolina] [float] NOT NULL,
	[Can_Diesel] [int] NOT NULL,
	[Lts_Diesel] [float] NOT NULL,
	[Can_GasNatural] [int] NOT NULL,
	[Lts_GasNatural] [float] NOT NULL,
 CONSTRAINT [PK_Maquinas] PRIMARY KEY CLUSTERED 
(
	[IdMaquina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Proyecto]    Script Date: 14/09/2018 16:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proyecto](
	[IdProyecto] [int] IDENTITY(1,1) NOT NULL,
	[FechaProyecto] [date] NOT NULL,
	[IdEmpresa] [int] NOT NULL,
	[Etapa] [int] NOT NULL,
 CONSTRAINT [PK_Proyecto] PRIMARY KEY CLUSTERED 
(
	[IdProyecto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Residuos]    Script Date: 14/09/2018 16:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Residuos](
	[IdResiduo] [int] IDENTITY(1,1) NOT NULL,
	[IdProyecto] [int] NOT NULL,
	[SeparacionResiduos] [bit] NOT NULL,
	[ProgramaReciclaje] [bit] NOT NULL,
	[Compostaje] [bit] NOT NULL,
	[Can_ResiduosSolidos] [float] NOT NULL,
	[Can_RediduosRecicla] [float] NOT NULL,
 CONSTRAINT [PK_Residuos] PRIMARY KEY CLUSTERED 
(
	[IdResiduo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TipoVehiculos]    Script Date: 14/09/2018 16:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoVehiculos](
	[IdTipoCamion] [int] IDENTITY(1,1) NOT NULL,
	[Modelo] [varchar](20) NOT NULL,
	[Marca] [varchar](50) NOT NULL,
	[Combustible] [varchar](20) NOT NULL,
	[Cilindraje] [varchar](20) NOT NULL,
	[FactorEmision] [varchar](20) NOT NULL,
 CONSTRAINT [PK_TipoVehiculos] PRIMARY KEY CLUSTERED 
(
	[IdTipoCamion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 14/09/2018 16:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[NombreUsuario] [varchar](50) NOT NULL,
	[Password] [varchar](150) NOT NULL,
	[TipoUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Vehiculos]    Script Date: 14/09/2018 16:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehiculos](
	[IdVehiculos] [int] IDENTITY(1,1) NOT NULL,
	[IdProyecto] [int] NOT NULL,
	[Can_Gasolina] [int] NOT NULL,
	[Km_Gasolina] [float] NOT NULL,
	[Can_Diesel] [int] NOT NULL,
	[Km_Diesel] [float] NOT NULL,
	[Can_GasNatural] [int] NOT NULL,
	[Km_GasNatural] [float] NOT NULL,
 CONSTRAINT [PK_Vehiculos] PRIMARY KEY CLUSTERED 
(
	[IdVehiculos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Empresa] ON 

INSERT [dbo].[Empresa] ([IdEmpresa], [NombreEmpresa], [Nit], [Email], [Direccion], [TipoEmpresa], [IdUsuario]) VALUES (13, N'Sena', N'123456', N'a@a.com', N'cl 70', 1, 14)
INSERT [dbo].[Empresa] ([IdEmpresa], [NombreEmpresa], [Nit], [Email], [Direccion], [TipoEmpresa], [IdUsuario]) VALUES (14, N'sena2', N'123456', N'a@aq.com', N'cl 70', 1, 15)
INSERT [dbo].[Empresa] ([IdEmpresa], [NombreEmpresa], [Nit], [Email], [Direccion], [TipoEmpresa], [IdUsuario]) VALUES (15, N'sena 5', N'123456', N'r@n.com', N'cl k9', 1, 16)
INSERT [dbo].[Empresa] ([IdEmpresa], [NombreEmpresa], [Nit], [Email], [Direccion], [TipoEmpresa], [IdUsuario]) VALUES (16, N'senat', N'123456', N'g@g.com', N'cl89', 1, 17)
INSERT [dbo].[Empresa] ([IdEmpresa], [NombreEmpresa], [Nit], [Email], [Direccion], [TipoEmpresa], [IdUsuario]) VALUES (17, N'carlos', N'123456', N'q@qq.com', N'cl', 1, 18)
INSERT [dbo].[Empresa] ([IdEmpresa], [NombreEmpresa], [Nit], [Email], [Direccion], [TipoEmpresa], [IdUsuario]) VALUES (18, N'carlos', N'123456', N'q@qq.com', N'cl', 1, 19)
INSERT [dbo].[Empresa] ([IdEmpresa], [NombreEmpresa], [Nit], [Email], [Direccion], [TipoEmpresa], [IdUsuario]) VALUES (19, N'g', N'145638', N'd@d.com', N'gv', 1, 20)
INSERT [dbo].[Empresa] ([IdEmpresa], [NombreEmpresa], [Nit], [Email], [Direccion], [TipoEmpresa], [IdUsuario]) VALUES (20, N'prueba', N'123456', N't@t.com', N'gv', 1, 21)
INSERT [dbo].[Empresa] ([IdEmpresa], [NombreEmpresa], [Nit], [Email], [Direccion], [TipoEmpresa], [IdUsuario]) VALUES (21, N'y', N'123456', N'w@w.com', N'hj', 1, 22)
INSERT [dbo].[Empresa] ([IdEmpresa], [NombreEmpresa], [Nit], [Email], [Direccion], [TipoEmpresa], [IdUsuario]) VALUES (22, N'h', N'123456', N'ag@b.com', N'gb', 1, 23)
INSERT [dbo].[Empresa] ([IdEmpresa], [NombreEmpresa], [Nit], [Email], [Direccion], [TipoEmpresa], [IdUsuario]) VALUES (23, N'y', N'123456', N'e@e.com', N'h', 1, 24)
INSERT [dbo].[Empresa] ([IdEmpresa], [NombreEmpresa], [Nit], [Email], [Direccion], [TipoEmpresa], [IdUsuario]) VALUES (24, N'y', N'123456', N'u@u.co', N'gc', 1, 25)
INSERT [dbo].[Empresa] ([IdEmpresa], [NombreEmpresa], [Nit], [Email], [Direccion], [TipoEmpresa], [IdUsuario]) VALUES (25, N'th', N'123456', N'eh@g.com', N'rt', 1, 26)
INSERT [dbo].[Empresa] ([IdEmpresa], [NombreEmpresa], [Nit], [Email], [Direccion], [TipoEmpresa], [IdUsuario]) VALUES (26, N'x', N'123456', N'a@a.comq', N'f', 1, 27)
INSERT [dbo].[Empresa] ([IdEmpresa], [NombreEmpresa], [Nit], [Email], [Direccion], [TipoEmpresa], [IdUsuario]) VALUES (27, N'hha', N'123456', N'ae@a.com', N'hh', 1, 28)
INSERT [dbo].[Empresa] ([IdEmpresa], [NombreEmpresa], [Nit], [Email], [Direccion], [TipoEmpresa], [IdUsuario]) VALUES (28, N'd', N'123456', N'q@w.co', N'cl', 1, 29)
INSERT [dbo].[Empresa] ([IdEmpresa], [NombreEmpresa], [Nit], [Email], [Direccion], [TipoEmpresa], [IdUsuario]) VALUES (29, N'th', N'123456', N'a@aeee.com', N'qhha', 1, 30)
INSERT [dbo].[Empresa] ([IdEmpresa], [NombreEmpresa], [Nit], [Email], [Direccion], [TipoEmpresa], [IdUsuario]) VALUES (30, N'@', N'123456', N'a@ar.com', N'g', 1, 31)
INSERT [dbo].[Empresa] ([IdEmpresa], [NombreEmpresa], [Nit], [Email], [Direccion], [TipoEmpresa], [IdUsuario]) VALUES (31, N'prueba ', N'123456', N'a@a.com', N'cl', 1, 32)
INSERT [dbo].[Empresa] ([IdEmpresa], [NombreEmpresa], [Nit], [Email], [Direccion], [TipoEmpresa], [IdUsuario]) VALUES (32, N'Sena', N'123456', N'b@b.com', N'ck 78 ', 1, 33)
INSERT [dbo].[Empresa] ([IdEmpresa], [NombreEmpresa], [Nit], [Email], [Direccion], [TipoEmpresa], [IdUsuario]) VALUES (33, N'Sena', N'123456', N'e@e.com', N'cll 50', 1, 34)
INSERT [dbo].[Empresa] ([IdEmpresa], [NombreEmpresa], [Nit], [Email], [Direccion], [TipoEmpresa], [IdUsuario]) VALUES (34, N'Tcc', N'123456', N'tcc@a.com', N'cl', 2, 35)
INSERT [dbo].[Empresa] ([IdEmpresa], [NombreEmpresa], [Nit], [Email], [Direccion], [TipoEmpresa], [IdUsuario]) VALUES (35, N'Juliana', N'123456', N'julideantonio2002@gmail.com', N'cll 30', 2, 36)
SET IDENTITY_INSERT [dbo].[Empresa] OFF
SET IDENTITY_INSERT [dbo].[Energia] ON 

INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (2, 1, 45, 55, 1)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (3, 12, 54, 39, 1)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (4, 13, 5, 5, 1)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (5, 18, 300, 209, 1)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (6, 19, 3, 5, 1)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (7, 23, 3, 5, 1)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (8, 23, 3, 55, 1)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (9, 26, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (10, 26, 0, 300, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (11, 28, 55, 55, 1)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (12, 29, 69, 35, 1)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (13, 30, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (14, 31, 50, 55, 1)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (15, 35, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (16, 36, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (18, 37, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (19, 39, 69, 58, 1)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (20, 40, 56, 58, 1)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (21, 41, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (22, 43, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (23, 52, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (24, 53, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (25, 54, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (26, 55, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (27, 56, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (28, 57, 25, 66, 1)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (29, 58, 69, 58, 1)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (30, 59, 583, 800, 1)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (31, 60, 5, 6, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (32, 71, 59, 54, 1)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (33, 72, 69, 34, 1)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (34, 73, 36, 4, 1)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (35, 74, 5, 10, 1)
SET IDENTITY_INSERT [dbo].[Energia] OFF
SET IDENTITY_INSERT [dbo].[FactorEmision] ON 

INSERT [dbo].[FactorEmision] ([IdFactor], [Gasolina_Km], [Diesel_Km], [Gas_M3], [Gasolina_Ltr], [Diesel_Ltr], [ResiduoSolido], [Energia]) VALUES (1, 7.62, 10.28, 1.98, 0, 0, 2.84, 0.2)
SET IDENTITY_INSERT [dbo].[FactorEmision] OFF
SET IDENTITY_INSERT [dbo].[Maquinas] ON 

INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (2, 1, 3, 0, 25, 0, 33, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (3, 12, 63, 0, 87, 0, 55, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (4, 13, 239, 0, 55, 0, 55, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (5, 18, 10, 0, 20, 0, 20, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (6, 19, 5, 143.64, 33, 136.07999999999998, 58, 58)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (7, 19, 5, 542.9591999999999, 33, 514.38240000000008, 58, 58)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (8, 22, 24, 117.17999999999999, 12, 366.65999999999997, 85, 64)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (12, 23, 567, 117.18, 544, 321.3, 36, 966)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (13, 26, 3, 11.34, 50, 22.68, 31, 32)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (14, 28, 236, 207.9, 11, 124.74, 22, 66)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (15, 29, 36, 219.24, 556, 249.48, 55, 33)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (16, 30, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (17, 31, 5, 11.34, 8, 22.68, 8, 66)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (18, 35, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (19, 36, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (20, 37, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (21, 39, 364, 207.9, 88, 2090.34, 48, 66)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (22, 40, 23, 219.24, 36, 370.44, 54, 23)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (23, 41, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (24, 43, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (25, 52, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (26, 53, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (27, 54, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (28, 55, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (29, 56, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (30, 57, 58, 136.08, 57, 351.54, 52, 3)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (31, 58, 58, 136.08, 47, 136.08, 89, 69)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (32, 59, 23, 374.22, 12, 204.12, 23, 8)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (33, 60, 54, 124.74, 55, 374.22, 47, 33)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (34, 71, 58, 49.14, 46, 124.74, 78, 69)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (35, 72, 56, 124.74, 23, 166.32, 56, 49)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (36, 73, 54, 136.08, 5, 1394.82, 54, 33)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (37, 74, 29, 264.6, 47, 1270.08, 809, 39)
SET IDENTITY_INSERT [dbo].[Maquinas] OFF
SET IDENTITY_INSERT [dbo].[Proyecto] ON 

INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (6, CAST(N'2018-09-07' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (7, CAST(N'2018-09-07' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (8, CAST(N'2018-09-07' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (9, CAST(N'2018-09-07' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (10, CAST(N'2018-09-07' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (11, CAST(N'2018-09-07' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (12, CAST(N'2018-09-07' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (13, CAST(N'2018-09-07' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (14, CAST(N'2018-09-07' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (15, CAST(N'2018-09-07' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (16, CAST(N'2018-09-07' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (17, CAST(N'2018-09-07' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (18, CAST(N'2018-09-10' AS Date), 33, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (19, CAST(N'2018-09-10' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (20, CAST(N'2018-09-10' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (21, CAST(N'2018-09-10' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (22, CAST(N'2018-09-10' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (23, CAST(N'2018-09-10' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (24, CAST(N'2018-09-10' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (25, CAST(N'2018-09-10' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (26, CAST(N'2018-09-10' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (27, CAST(N'2018-09-11' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (28, CAST(N'2018-09-11' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (29, CAST(N'2018-09-11' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (30, CAST(N'2018-09-11' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (31, CAST(N'2018-09-11' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (32, CAST(N'2018-09-12' AS Date), 34, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (33, CAST(N'2018-09-12' AS Date), 34, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (34, CAST(N'2018-09-12' AS Date), 34, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (35, CAST(N'2018-09-13' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (36, CAST(N'2018-09-13' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (37, CAST(N'2018-09-13' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (38, CAST(N'2018-09-13' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (39, CAST(N'2018-09-13' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (40, CAST(N'2018-09-13' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (41, CAST(N'2018-09-13' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (42, CAST(N'2018-09-13' AS Date), 35, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (43, CAST(N'2018-09-13' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (44, CAST(N'2018-09-13' AS Date), 35, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (45, CAST(N'2018-09-13' AS Date), 35, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (46, CAST(N'2018-09-13' AS Date), 35, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (47, CAST(N'2018-09-13' AS Date), 35, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (48, CAST(N'2018-09-13' AS Date), 35, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (49, CAST(N'2018-09-13' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (50, CAST(N'2018-09-13' AS Date), 35, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (51, CAST(N'2018-09-14' AS Date), 35, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (52, CAST(N'2018-09-14' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (53, CAST(N'2018-09-14' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (54, CAST(N'2018-09-14' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (55, CAST(N'2018-09-14' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (56, CAST(N'2018-09-14' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (57, CAST(N'2018-09-14' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (58, CAST(N'2018-09-14' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (59, CAST(N'2018-09-14' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (60, CAST(N'2018-09-14' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (61, CAST(N'2018-09-14' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (62, CAST(N'2018-09-14' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (63, CAST(N'2018-09-14' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (64, CAST(N'2018-09-14' AS Date), 35, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (65, CAST(N'2018-09-14' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (66, CAST(N'2018-09-14' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (67, CAST(N'2018-09-14' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (68, CAST(N'2018-09-14' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (69, CAST(N'2018-09-14' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (70, CAST(N'2018-09-14' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (71, CAST(N'2018-09-14' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (72, CAST(N'2018-09-14' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (73, CAST(N'2018-09-14' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (74, CAST(N'2018-09-14' AS Date), 31, 1)
SET IDENTITY_INSERT [dbo].[Proyecto] OFF
SET IDENTITY_INSERT [dbo].[Residuos] ON 

INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (2, 1, 1, 1, 1, 33, 55)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (3, 12, 1, 1, 1, 56, 5)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (4, 13, 1, 1, 1, 66, 66)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (5, 18, 1, 1, 1, 80, 60)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (6, 19, 0, 1, 1, 5860, 50)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (7, 23, 1, 1, 1, 60, 3)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (8, 26, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (9, 28, 1, 1, 1, 556, 55)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (10, 29, 1, 1, 1, 55, 33)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (11, 30, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (12, 31, 1, 1, 1, 5, 5)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (13, 35, 1, 1, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (14, 36, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (15, 37, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (16, 39, 1, 1, 1, 5, 36)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (17, 40, 1, 1, 1, 56, 88)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (18, 41, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (19, 43, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (20, 52, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (21, 53, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (23, 54, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (24, 55, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (25, 56, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (26, 57, 1, 1, 1, 63, 80)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (27, 58, 1, 1, 1, 36, 59)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (28, 59, 1, 1, 1, 2, 70)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (29, 60, 1, 1, 1, 56, 58)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (30, 71, 1, 1, 1, 869, 58)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (31, 72, 1, 1, 1, 7, 9)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (32, 73, 1, 1, 1, 54, 63)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (33, 74, 1, 1, 1, 87, 69)
SET IDENTITY_INSERT [dbo].[Residuos] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Password], [TipoUsuario]) VALUES (32, N'a@a.com', N'123456', 1)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Password], [TipoUsuario]) VALUES (33, N'b@b.com', N'123456', 1)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Password], [TipoUsuario]) VALUES (34, N'e@e.com', N'123456', 1)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Password], [TipoUsuario]) VALUES (35, N'tcc@a.com', N'123456', 1)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Password], [TipoUsuario]) VALUES (36, N'julideantonio2002@gmail.com', N'123456', 1)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
SET IDENTITY_INSERT [dbo].[Vehiculos] ON 

INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (5, 1, 20, 13, 23, 33, 55, 99)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (6, 7, 3, 66, 2, 22, 69, 34)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (7, 8, 2, 333, 22, 69, 46, 99)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (8, 9, 3, 6, 9, 6, 5, 9)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (9, 9, 3, 6, 9, 6, 5, 9)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (10, 1, 5, 9, 7, 6, 8, 6)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (11, 1, 3, 66, 6, 77, 9, 88)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (12, 13, 3, 36, 5, 6, 5, 6)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (13, 15, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (14, 15, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (15, 17, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (16, 18, 30, 60, 30, 90, 40, 50)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (17, 19, 23, 69, 20, 30, 50, 306)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (18, 20, 30, 56, 80, 36, 54, 36)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (19, 21, 23, 36, 55, 63, 24, 89)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (20, 22, 63, 22, 15, 34, 507, 369)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (21, 22, 63, 22, 15, 34, 507, 369)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (23, 23, 12, 49, 87, 348, 51, 33)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (24, 25, 3, 0, 2, 0, 0, 3)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (25, 26, 3, 6, 6, 3, 9, 3)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (26, 28, 250, 3, 55, 33, 255, 6)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (27, 29, 32, 33, 25, 36, 23, 33)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (28, 30, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (29, 31, 5, 30, 8, 40, 3, 30)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (30, 35, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (31, 36, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (32, 37, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (33, 38, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (34, 39, 36, 58, 55, 33, 55, 6)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (35, 40, 36, 69, 23, 69, 58, 33)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (36, 41, 12, 12, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (37, 43, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (38, 52, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (39, 53, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (40, 54, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (41, 55, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (42, 56, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (43, 57, 90, 36, 58, 63, 23, 63)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (44, 58, 53, 90, 23, 8, 47, 60)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (45, 59, 56, 36, 23, 99, 23, 25)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (46, 60, 25, 33, 85, 66, 46, 33)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (47, 71, 10, 36, 58, 66, 58, 39)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (48, 72, 64, 55, 123, 936, 56, 563)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (49, 73, 24, 69, 25, 36, 45, 36)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (50, 74, 50, 66, 47, 90, 50, 36)
SET IDENTITY_INSERT [dbo].[Vehiculos] OFF
USE [master]
GO
ALTER DATABASE [HuellaCarbono] SET  READ_WRITE 
GO
