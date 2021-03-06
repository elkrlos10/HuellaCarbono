USE [master]
GO
/****** Object:  Database [HuellaCarbono]    Script Date: 12/10/2018 15:50:04 ******/
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
/****** Object:  Table [dbo].[DetalleHuella]    Script Date: 12/10/2018 15:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleHuella](
	[IdDetalle] [int] IDENTITY(1,1) NOT NULL,
	[IdHuella] [int] NOT NULL,
	[Porcentaje] [float] NOT NULL,
	[Estado] [bit] NULL,
 CONSTRAINT [PK_DetalleHuella] PRIMARY KEY CLUSTERED 
(
	[IdDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 12/10/2018 15:50:04 ******/
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
/****** Object:  Table [dbo].[Encuesta]    Script Date: 12/10/2018 15:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Encuesta](
	[IdEncuesta] [int] IDENTITY(1,1) NOT NULL,
	[IdProyecto] [int] NULL,
	[TipoPersona] [int] NULL,
	[TipoTransporte] [varchar](30) NULL,
	[TipoCombustible] [varchar](30) NULL,
	[Km] [float] NULL,
	[Nun_Acopanantes] [int] NULL,
	[VuelosNacionales] [int] NULL,
	[VuelosInternacionales] [int] NULL,
	[HorasVuelo] [int] NULL,
	[CantidadCuadernos] [int] NULL,
	[CantidadSobres] [int] NULL,
	[CantidadResmas] [int] NULL,
	[Puntos_Eco] [bit] NULL,
	[Residuos] [bit] NULL,
	[Aviso] [bit] NULL,
	[Luz] [varchar](15) NULL,
	[Aparatos] [varchar](15) NULL,
	[Computador] [varchar](15) NULL,
 CONSTRAINT [PK_Encuesta] PRIMARY KEY CLUSTERED 
(
	[IdEncuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Energia]    Script Date: 12/10/2018 15:50:04 ******/
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
/****** Object:  Table [dbo].[FactorEmision]    Script Date: 12/10/2018 15:50:04 ******/
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
	[EmisionAvion] [float] NULL,
 CONSTRAINT [PK_FactorEmision] PRIMARY KEY CLUSTERED 
(
	[IdFactor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Huella]    Script Date: 12/10/2018 15:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Huella](
	[IdHuella] [int] IDENTITY(1,1) NOT NULL,
	[IdProyecto] [int] NOT NULL,
	[Toneledas] [float] NOT NULL,
	[Fecha] [date] NOT NULL,
	[TipoArbol] [varchar](20) NULL,
	[Zona] [varchar](20) NULL,
	[Precisar] [bit] NULL,
	[EstadoCompensacion] [bit] NULL,
 CONSTRAINT [PK_Huella] PRIMARY KEY CLUSTERED 
(
	[IdHuella] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Maquinas]    Script Date: 12/10/2018 15:50:04 ******/
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
/****** Object:  Table [dbo].[Proyecto]    Script Date: 12/10/2018 15:50:04 ******/
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
/****** Object:  Table [dbo].[Residuos]    Script Date: 12/10/2018 15:50:04 ******/
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
/****** Object:  Table [dbo].[TipoVehiculos]    Script Date: 12/10/2018 15:50:04 ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 12/10/2018 15:50:04 ******/
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
/****** Object:  Table [dbo].[Vehiculos]    Script Date: 12/10/2018 15:50:04 ******/
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
SET IDENTITY_INSERT [dbo].[DetalleHuella] ON 

INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (1, 1, 30, 1)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (2, 2, 50, 1)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (3, 3, 20, 1)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (4, 4, 0, 0)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (5, 6, 30, 0)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (6, 7, 0, 0)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (7, 8, 50, 0)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (8, 9, 30, 0)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (9, 10, 30, 0)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (10, 11, 45, 0)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (11, 12, 30, 0)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (12, 13, 30, 0)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (13, 14, 30, 0)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (14, 15, 39, 0)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (15, 16, 39, 0)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (16, 17, 39, 0)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (17, 18, 39, 0)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (18, 19, 39, 0)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (19, 20, 20, 0)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (20, 21, 2, 0)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (21, 22, 30, 0)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (22, 23, 3, 0)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (23, 24, 3, 0)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (24, 25, 2, 0)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (25, 26, 3, 0)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (26, 27, 30, 0)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (28, 1, 70, 1)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (29, 2, 50, 1)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (30, 3, 80, 1)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (31, 4, 100, 0)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (32, 26, 97, 0)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (33, 7, 100, 0)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (34, 28, 30, 0)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (35, 29, 30, 0)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (36, 30, 20, 0)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (37, 31, 23, 0)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (38, 32, 23, 0)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (39, 33, 3, 0)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (40, 34, 3, 0)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (41, 35, 23, 0)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (42, 36, 1, 0)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (43, 37, 50, 0)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (44, 37, 50, 0)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (45, 38, 0, 0)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (46, 39, 2, 0)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (47, 40, 30, 0)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (48, 41, 23, 0)
INSERT [dbo].[DetalleHuella] ([IdDetalle], [IdHuella], [Porcentaje], [Estado]) VALUES (49, 42, 2, 0)
SET IDENTITY_INSERT [dbo].[DetalleHuella] OFF
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
INSERT [dbo].[Empresa] ([IdEmpresa], [NombreEmpresa], [Nit], [Email], [Direccion], [TipoEmpresa], [IdUsuario]) VALUES (36, N'Prueba', N'123456', N's@s.com', N'cl 45', 2, 37)
SET IDENTITY_INSERT [dbo].[Empresa] OFF
SET IDENTITY_INSERT [dbo].[Encuesta] ON 

INSERT [dbo].[Encuesta] ([IdEncuesta], [IdProyecto], [TipoPersona], [TipoTransporte], [TipoCombustible], [Km], [Nun_Acopanantes], [VuelosNacionales], [VuelosInternacionales], [HorasVuelo], [CantidadCuadernos], [CantidadSobres], [CantidadResmas], [Puntos_Eco], [Residuos], [Aviso], [Luz], [Aparatos], [Computador]) VALUES (1, 0, 1, N'Bicicleta', N'', 114, 0, 32, 32, 10, 7, 7, 9, 0, 1, 1, N'', N'', N'')
INSERT [dbo].[Encuesta] ([IdEncuesta], [IdProyecto], [TipoPersona], [TipoTransporte], [TipoCombustible], [Km], [Nun_Acopanantes], [VuelosNacionales], [VuelosInternacionales], [HorasVuelo], [CantidadCuadernos], [CantidadSobres], [CantidadResmas], [Puntos_Eco], [Residuos], [Aviso], [Luz], [Aparatos], [Computador]) VALUES (2, 0, 1, N'Automovil', NULL, 41, 0, 28, 12, 15, 9, 12, 7, 0, 1, 1, N'no', N'A veces', N'si')
INSERT [dbo].[Encuesta] ([IdEncuesta], [IdProyecto], [TipoPersona], [TipoTransporte], [TipoCombustible], [Km], [Nun_Acopanantes], [VuelosNacionales], [VuelosInternacionales], [HorasVuelo], [CantidadCuadernos], [CantidadSobres], [CantidadResmas], [Puntos_Eco], [Residuos], [Aviso], [Luz], [Aparatos], [Computador]) VALUES (3, 0, 1, N'Automovil', NULL, 45, 1, 17, 12, 17, 9, 6, 6, 0, 1, 1, N'no', N'no', N'no')
INSERT [dbo].[Encuesta] ([IdEncuesta], [IdProyecto], [TipoPersona], [TipoTransporte], [TipoCombustible], [Km], [Nun_Acopanantes], [VuelosNacionales], [VuelosInternacionales], [HorasVuelo], [CantidadCuadernos], [CantidadSobres], [CantidadResmas], [Puntos_Eco], [Residuos], [Aviso], [Luz], [Aparatos], [Computador]) VALUES (4, 0, 1, N'Automovil', N'Gas', 9, 1, 4, 4, 8, 4, 6, 5, 0, 1, 1, N'no', N'si', N'si')
INSERT [dbo].[Encuesta] ([IdEncuesta], [IdProyecto], [TipoPersona], [TipoTransporte], [TipoCombustible], [Km], [Nun_Acopanantes], [VuelosNacionales], [VuelosInternacionales], [HorasVuelo], [CantidadCuadernos], [CantidadSobres], [CantidadResmas], [Puntos_Eco], [Residuos], [Aviso], [Luz], [Aparatos], [Computador]) VALUES (5, 0, 2, N'Bicicleta', N'? undefined:undefined ?', 28, 0, 4, 4, 4, 5, 0, 0, 0, 1, 1, N'no', N'no', N'si')
SET IDENTITY_INSERT [dbo].[Encuesta] OFF
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
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (36, 75, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (37, 76, 5, 8, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (38, 77, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (39, 78, 5, 9, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (40, 79, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (41, 80, 20, 35, 1)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (42, 82, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (43, 83, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (44, 84, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (45, 85, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (46, 86, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (47, 87, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (48, 88, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (50, 89, 5, 3, 1)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (51, 90, 3, 8, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (52, 91, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (53, 92, 20, 30, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (54, 99, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (55, 100, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (56, 101, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (57, 102, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (58, 103, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (59, 104, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (60, 106, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (61, 107, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (62, 105, 20, 9, 1)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (63, 108, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (64, 109, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (65, 110, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (66, 111, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (67, 112, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (68, 113, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (69, 114, 13, 23, 1)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (71, 115, 50, 30, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (72, 116, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (73, 117, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (75, 118, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (76, 119, 2, 5, 1)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (77, 120, 2, 6, 1)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (78, 121, 5, 3, 1)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (79, 122, 26, 55, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (80, 123, 5, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (81, 125, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (82, 126, 5, 3, 1)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (83, 127, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (84, 128, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (85, 129, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (86, 130, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (87, 135, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (88, 139, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (89, 140, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (90, 141, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (91, 142, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (92, 143, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (93, 144, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (94, 145, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (95, 146, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (96, 147, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (97, 157, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (98, 158, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (99, 161, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (100, 162, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (101, 163, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (102, 164, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (103, 165, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (104, 166, 0, 0, 0)
GO
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (105, 167, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (106, 169, 20, 30, 1)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (107, 170, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (108, 171, 50, 60, 1)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (109, 173, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (110, 188, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (111, 189, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (112, 190, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (113, 191, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (114, 192, 60, 60, 1)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (115, 193, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (116, 199, 3, 6, 1)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (117, 200, 0, 0, 0)
INSERT [dbo].[Energia] ([IdEnergia], [IdProyecto], [EnergiaKwh], [Gas], [EnergiaRenovable]) VALUES (118, 201, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[Energia] OFF
SET IDENTITY_INSERT [dbo].[FactorEmision] ON 

INSERT [dbo].[FactorEmision] ([IdFactor], [Gasolina_Km], [Diesel_Km], [Gas_M3], [Gasolina_Ltr], [Diesel_Ltr], [ResiduoSolido], [Energia], [EmisionAvion]) VALUES (1, 7.62, 10.28, 1.98, 7.62, 10.28, 2.84, 0.2, 9.82)
SET IDENTITY_INSERT [dbo].[FactorEmision] OFF
SET IDENTITY_INSERT [dbo].[Huella] ON 

INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (1, 78, 1684.27, CAST(N'2018-09-17' AS Date), N'La Salada', N'Pino', 1, 1)
INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (2, 79, 0, CAST(N'2018-09-17' AS Date), N'La Salada', N'Acacia', 1, 1)
INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (3, 85, 0, CAST(N'2018-09-18' AS Date), N'La Salada', N'Acacia', 0, 1)
INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (4, 86, 0, CAST(N'2018-09-18' AS Date), N'Urabá', N'Acacia', 0, 1)
INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (5, 98, 45, CAST(N'2018-09-20' AS Date), N'Pino', N'La Salada', 1, 0)
INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (6, 99, 1307592, CAST(N'2018-09-20' AS Date), N'La Salada', N'Pino', 0, 0)
INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (7, 100, 217.93, CAST(N'2018-09-20' AS Date), NULL, NULL, 0, 1)
INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (8, 101, 13.08, CAST(N'2018-09-20' AS Date), N'La Salada', N'Pino', 0, 0)
INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (9, 113, 3.57, CAST(N'2018-09-20' AS Date), N'La Salada', N'Pino', 0, 0)
INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (10, 0, 794.72, CAST(N'2018-09-24' AS Date), N'La Salada', N'Pino', 0, 0)
INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (11, 123, 195.38, CAST(N'2018-09-24' AS Date), N'Urabá', N'Acacia', 0, 0)
INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (12, 129, 1.98, CAST(N'2018-09-27' AS Date), N'Urabá', N'Pino', 0, 0)
INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (13, 129, 1.98, CAST(N'2018-09-27' AS Date), N'Urabá', N'Pino', 0, 0)
INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (14, 130, 4.49, CAST(N'2018-09-27' AS Date), N'Urabá', N'Pino', 0, 0)
INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (15, 139, 1.19, CAST(N'2018-09-28' AS Date), N'La Salada', N'Acacia', 0, 0)
INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (16, 139, 1.19, CAST(N'2018-09-28' AS Date), N'La Salada', N'Acacia', 0, 0)
INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (17, 139, 1.19, CAST(N'2018-09-28' AS Date), N'La Salada', N'Acacia', 0, 0)
INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (18, 139, 1.19, CAST(N'2018-09-28' AS Date), N'La Salada', N'Acacia', 0, 0)
INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (19, 139, 1.19, CAST(N'2018-09-28' AS Date), N'La Salada', N'Acacia', 0, 0)
INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (20, 140, 0, CAST(N'2018-09-28' AS Date), N'Urabá', N'Pino', 0, 0)
INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (21, 141, 0, CAST(N'2018-09-28' AS Date), N'Urabá', N'Acacia', 0, 0)
INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (22, 142, 0, CAST(N'2018-09-28' AS Date), N'La Salada', N'Acacia', 0, 0)
INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (23, 143, 0, CAST(N'2018-09-28' AS Date), N'La Salada', N'Pino', 0, 0)
INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (24, 144, 0, CAST(N'2018-09-28' AS Date), N'La Salada', N'Pino', 0, 0)
INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (25, 145, 0, CAST(N'2018-09-28' AS Date), N'Urabá', N'Pino', 0, 0)
INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (26, 146, 0, CAST(N'2018-09-28' AS Date), N'La Salada', N'Acacia', 0, 1)
INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (27, 147, 0, CAST(N'2018-09-28' AS Date), N'La Salada', N'Acacia', 0, 0)
INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (28, 157, 14.26, CAST(N'2018-10-08' AS Date), N'Urabá', N'Pino', 0, 0)
INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (29, 158, 2.38, CAST(N'2018-10-08' AS Date), N'La Salada', N'Pino', 0, 0)
INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (30, 161, 2.38, CAST(N'2018-10-08' AS Date), N'La Salada', N'Acacia', 0, 0)
INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (31, 162, 8.99, CAST(N'2018-10-08' AS Date), N'Urabá', N'Acacia', 0, 0)
INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (32, 163, 6.87, CAST(N'2018-10-08' AS Date), N'La Salada', N'Pino', 0, 0)
INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (33, 164, 3.57, CAST(N'2018-10-08' AS Date), N'La Salada', N'Pino', 0, 0)
INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (34, 165, 1.19, CAST(N'2018-10-08' AS Date), N'Urabá', N'Acacia', 0, 0)
INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (35, 166, 2.38, CAST(N'2018-10-08' AS Date), N'Urabá', N'Acacia', 0, 0)
INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (36, 167, 0, CAST(N'2018-10-08' AS Date), N'La Salada', N'Acacia', 0, 0)
INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (37, 169, 481.22, CAST(N'2018-10-08' AS Date), N'Urabá', N'Acacia', 0, 1)
INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (38, 170, 0, CAST(N'2018-10-09' AS Date), NULL, NULL, 0, 0)
INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (39, 173, 0, CAST(N'2018-10-09' AS Date), N'La Salada', N'Acacia', 0, 0)
INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (40, 186, 14.26, CAST(N'2018-10-11' AS Date), N'Urabá', N'Pino', 0, 0)
INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (41, 197, 1.19, CAST(N'2018-10-12' AS Date), N'La Salada', N'Pino', 0, 0)
INSERT [dbo].[Huella] ([IdHuella], [IdProyecto], [Toneledas], [Fecha], [TipoArbol], [Zona], [Precisar], [EstadoCompensacion]) VALUES (42, 199, 215.78, CAST(N'2018-10-12' AS Date), N'La Salada', N'Pino', 0, 0)
SET IDENTITY_INSERT [dbo].[Huella] OFF
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
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (38, 75, 2, 34.02, 23, 34.02, 46, 3)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (39, 76, 5, 11.34, 4, 22.68, 4, 9)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (40, 77, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (41, 78, 57, 136.08, 58, 136.08, 43, 90)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (42, 79, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (43, 80, 50, 11.34, 3, 94.5, 5, 52)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (44, 81, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (45, 82, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (46, 83, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (47, 84, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (48, 85, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (49, 86, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (50, 87, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (51, 88, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (52, 89, 5, 302.4, 4, 302.4, 45, 2)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (53, 90, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (54, 91, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (55, 92, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (56, 94, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (57, 96, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (58, 97, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (59, 98, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (60, 99, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (61, 100, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (62, 101, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (63, 102, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (64, 103, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (66, 104, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (67, 106, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (68, 105, 3, 18.9, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (69, 107, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (70, 108, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (71, 109, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (72, 110, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (73, 111, 2, 34.02, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (74, 112, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (75, 113, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (76, 114, 24, 366.66, 47, 45.36, 25, 335)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (77, 115, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (78, 116, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (79, 117, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (80, 118, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (81, 119, 2, 260.82, 22, 124.74, 4, 33)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (82, 120, 10, 166.32, 7, 124.74, 2, 6)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (83, 121, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (84, 122, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (85, 123, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (86, 125, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (87, 126, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (88, 127, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (89, 128, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (90, 129, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (91, 130, 23, 11.34, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (92, 134, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (93, 135, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (94, 139, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (95, 140, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (96, 141, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (97, 142, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (98, 143, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (99, 144, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (100, 145, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (101, 146, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (102, 147, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (103, 157, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (104, 158, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (105, 161, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (106, 162, 23, 22.68, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (107, 163, 2, 11.34, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (108, 164, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (109, 165, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (110, 166, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (111, 167, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (112, 169, 20, 113.4, 50, 113.4, 60, 30)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (113, 170, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (114, 171, 2, 226.8, 5, 1134, 60, 500)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (115, 172, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (116, 173, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (117, 188, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (118, 189, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (119, 190, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (120, 191, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (121, 192, 2, 22.68, 2, 30.24, 1, 5)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (122, 193, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (123, 199, 23, 260.82, 3, 11.34, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (124, 200, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Maquinas] ([IdMaquina], [IdProyecto], [Can_Gasolina], [Lts_Gasolina], [Can_Diesel], [Lts_Diesel], [Can_GasNatural], [Lts_GasNatural]) VALUES (125, 201, 0, 0, 0, 0, 0, 0)
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
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (75, CAST(N'2018-09-17' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (76, CAST(N'2018-09-17' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (77, CAST(N'2018-09-17' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (78, CAST(N'2018-09-17' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (79, CAST(N'2018-09-17' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (80, CAST(N'2018-09-17' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (81, CAST(N'2018-09-17' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (82, CAST(N'2018-09-17' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (83, CAST(N'2018-09-17' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (84, CAST(N'2018-09-18' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (85, CAST(N'2018-09-18' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (86, CAST(N'2018-09-18' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (87, CAST(N'2018-09-18' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (88, CAST(N'2018-09-18' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (89, CAST(N'2018-09-19' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (90, CAST(N'2018-09-19' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (91, CAST(N'2018-09-19' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (92, CAST(N'2018-09-19' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (93, CAST(N'2018-09-19' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (94, CAST(N'2018-09-19' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (95, CAST(N'2018-09-19' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (96, CAST(N'2018-09-19' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (97, CAST(N'2018-09-19' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (98, CAST(N'2018-09-19' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (99, CAST(N'2018-09-20' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (100, CAST(N'2018-09-20' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (101, CAST(N'2018-09-20' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (102, CAST(N'2018-09-20' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (103, CAST(N'2018-09-20' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (104, CAST(N'2018-09-20' AS Date), 31, 1)
GO
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (105, CAST(N'2018-09-20' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (106, CAST(N'2018-09-20' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (107, CAST(N'2018-09-20' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (108, CAST(N'2018-09-20' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (109, CAST(N'2018-09-20' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (110, CAST(N'2018-09-20' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (111, CAST(N'2018-09-20' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (112, CAST(N'2018-09-20' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (113, CAST(N'2018-09-20' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (114, CAST(N'2018-09-20' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (115, CAST(N'2018-09-20' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (116, CAST(N'2018-09-20' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (117, CAST(N'2018-09-20' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (118, CAST(N'2018-09-20' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (119, CAST(N'2018-09-20' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (120, CAST(N'2018-09-21' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (121, CAST(N'2018-09-24' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (122, CAST(N'2018-09-24' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (123, CAST(N'2018-09-24' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (124, CAST(N'2018-09-26' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (125, CAST(N'2018-09-26' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (126, CAST(N'2018-09-26' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (127, CAST(N'2018-09-27' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (128, CAST(N'2018-09-27' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (129, CAST(N'2018-09-27' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (130, CAST(N'2018-09-27' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (131, CAST(N'2018-09-27' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (132, CAST(N'2018-09-27' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (133, CAST(N'2018-09-27' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (134, CAST(N'2018-09-27' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (135, CAST(N'2018-09-27' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (136, CAST(N'2018-09-28' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (137, CAST(N'2018-09-28' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (138, CAST(N'2018-09-28' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (139, CAST(N'2018-09-28' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (140, CAST(N'2018-09-28' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (141, CAST(N'2018-09-28' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (142, CAST(N'2018-09-28' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (143, CAST(N'2018-09-28' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (144, CAST(N'2018-09-28' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (145, CAST(N'2018-09-28' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (146, CAST(N'2018-09-28' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (147, CAST(N'2018-09-28' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (148, CAST(N'2018-10-02' AS Date), 36, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (149, CAST(N'2018-10-02' AS Date), 36, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (150, CAST(N'2018-10-02' AS Date), 36, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (151, CAST(N'2018-10-02' AS Date), 36, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (152, CAST(N'2018-10-02' AS Date), 36, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (153, CAST(N'2018-10-02' AS Date), 36, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (154, CAST(N'2018-10-02' AS Date), 36, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (155, CAST(N'2018-10-02' AS Date), 36, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (156, CAST(N'2018-10-02' AS Date), 36, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (157, CAST(N'2018-10-08' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (158, CAST(N'2018-10-08' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (159, CAST(N'2018-10-08' AS Date), 36, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (160, CAST(N'2018-10-08' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (161, CAST(N'2018-10-08' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (162, CAST(N'2018-10-08' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (163, CAST(N'2018-10-08' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (164, CAST(N'2018-10-08' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (165, CAST(N'2018-10-08' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (166, CAST(N'2018-10-08' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (167, CAST(N'2018-10-08' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (168, CAST(N'2018-10-08' AS Date), 36, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (169, CAST(N'2018-10-08' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (170, CAST(N'2018-10-09' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (171, CAST(N'2018-10-09' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (172, CAST(N'2018-10-09' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (173, CAST(N'2018-10-09' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (174, CAST(N'2018-10-09' AS Date), 36, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (175, CAST(N'2018-10-09' AS Date), 36, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (176, CAST(N'2018-10-11' AS Date), 36, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (177, CAST(N'2018-10-11' AS Date), 36, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (178, CAST(N'2018-10-11' AS Date), 36, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (179, CAST(N'2018-10-11' AS Date), 36, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (180, CAST(N'2018-10-11' AS Date), 36, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (181, CAST(N'2018-10-11' AS Date), 36, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (182, CAST(N'2018-10-11' AS Date), 36, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (183, CAST(N'2018-10-11' AS Date), 36, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (184, CAST(N'2018-10-11' AS Date), 36, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (185, CAST(N'2018-10-11' AS Date), 36, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (186, CAST(N'2018-10-11' AS Date), 36, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (187, CAST(N'2018-10-11' AS Date), 36, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (188, CAST(N'2018-10-11' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (189, CAST(N'2018-10-11' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (190, CAST(N'2018-10-11' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (191, CAST(N'2018-10-11' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (192, CAST(N'2018-10-11' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (193, CAST(N'2018-10-11' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (194, CAST(N'2018-10-11' AS Date), 36, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (195, CAST(N'2018-10-11' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (196, CAST(N'2018-10-11' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (197, CAST(N'2018-10-12' AS Date), 36, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (198, CAST(N'2018-10-12' AS Date), 36, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (199, CAST(N'2018-10-12' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (200, CAST(N'2018-10-12' AS Date), 31, 1)
INSERT [dbo].[Proyecto] ([IdProyecto], [FechaProyecto], [IdEmpresa], [Etapa]) VALUES (201, CAST(N'2018-10-12' AS Date), 31, 1)
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
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (34, 75, 0, 0, 0, 5, 6)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (35, 76, 0, 0, 0, 5, 6)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (36, 77, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (37, 78, 1, 1, 1, 43, 56)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (38, 79, 1, 1, 1, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (39, 80, 1, 1, 1, 20, 2)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (40, 81, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (41, 82, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (42, 83, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (43, 84, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (45, 85, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (46, 86, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (47, 87, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (48, 88, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (49, 89, 1, 1, 0, 5, 8)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (50, 90, 1, 1, 1, 3, 3)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (51, 91, 0, 1, 1, 1, 3)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (52, 92, 0, 0, 0, 2, 5)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (53, 99, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (54, 100, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (55, 101, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (56, 102, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (57, 103, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (58, 104, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (59, 106, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (60, 105, 1, 1, 0, 80, 100)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (61, 107, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (62, 108, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (63, 109, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (64, 110, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (65, 111, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (66, 112, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (67, 113, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (68, 114, 0, 0, 0, 5, 6)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (69, 115, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (70, 116, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (71, 117, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (72, 118, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (73, 119, 1, 1, 1, 5, 6)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (74, 120, 1, 1, 1, 3, 3)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (75, 121, 1, 1, 1, 25, 3)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (76, 122, 0, 0, 0, 23, 3)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (77, 123, 0, 0, 0, 5, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (78, 125, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (79, 126, 1, 1, 1, 5, 6)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (80, 127, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (81, 128, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (82, 129, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (83, 130, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (84, 135, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (85, 139, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (86, 140, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (87, 141, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (88, 142, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (89, 143, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (90, 144, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (91, 145, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (92, 146, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (93, 147, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (94, 157, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (95, 158, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (96, 161, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (97, 162, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (98, 163, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (99, 164, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (100, 165, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (101, 166, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (102, 167, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (103, 169, 1, 1, 1, 10, 50)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (104, 170, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (105, 171, 1, 1, 1, 20, 5)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (106, 173, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (107, 188, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (108, 189, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (109, 190, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (110, 191, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (111, 192, 1, 1, 1, 1, 1)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (112, 193, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (113, 199, 1, 1, 1, 3, 2)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (114, 200, 0, 0, 0, 0, 0)
INSERT [dbo].[Residuos] ([IdResiduo], [IdProyecto], [SeparacionResiduos], [ProgramaReciclaje], [Compostaje], [Can_ResiduosSolidos], [Can_RediduosRecicla]) VALUES (115, 201, 0, 0, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[Residuos] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Password], [TipoUsuario]) VALUES (32, N'a@a.com', N'123456', 1)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Password], [TipoUsuario]) VALUES (33, N'b@b.com', N'123456', 1)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Password], [TipoUsuario]) VALUES (34, N'e@e.com', N'123456', 1)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Password], [TipoUsuario]) VALUES (35, N'tcc@a.com', N'123456', 1)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Password], [TipoUsuario]) VALUES (36, N'julideantonio2002@gmail.com', N'123456', 1)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Password], [TipoUsuario]) VALUES (37, N's@s.com', N'123456', 1)
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
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (51, 75, 5, 3, 2, 3, 4, 6)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (52, 76, 6, 3, 2, 9, 4, 9)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (53, 77, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (54, 78, 25, 69, 48, 96, 70, 39)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (55, 79, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (56, 80, 60, 8, 2, 60, 3, 85)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (58, 81, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (59, 82, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (60, 83, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (61, 84, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (62, 85, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (63, 86, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (64, 87, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (65, 88, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (66, 89, 5, 20, 4, 6, 7, 8)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (67, 90, 10, 60, 28, 38, 3, 40)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (68, 91, 1, 20, 1, 20, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (69, 92, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (70, 93, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (71, 94, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (72, 95, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (73, 96, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (74, 97, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (75, 98, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (76, 99, 56, 33, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (77, 100, 56, 33, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (78, 101, 55, 33, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (79, 102, 25, 69, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (80, 103, 22, 69, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (82, 104, 26, 3, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (83, 105, 30, 60, 30, 60, 20, 60)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (84, 106, 23, 33, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (85, 107, 23, 68, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (86, 108, 23, 63, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (87, 109, 55, 33, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (88, 110, 16, 69, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (89, 111, 43, 66, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (90, 112, 5, 36, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (91, 113, 22, 9, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (92, 114, 25, 3, 56, 34, 22, 507)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (93, 115, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (94, 116, 23, 33, 55, 99, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (95, 117, 56, 33, 55, 36, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (96, 118, 23, 69, 56, 96, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (97, 119, 23, 55, 42, 69, 22, 6)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (98, 120, 23, 64, 25, 44, 21, 33)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (99, 121, 23, 25, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (100, 122, 23, 24, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (101, 123, 23, 63, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (102, 125, 2, 23, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (103, 126, 2, 65, 4, 3, 7, 9)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (104, 127, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (105, 128, 23, 5, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (106, 129, 23, 5, 0, 0, 0, 0)
GO
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (107, 130, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (108, 133, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (109, 134, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (110, 135, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (111, 137, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (112, 139, 2, 3, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (113, 140, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (114, 141, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (115, 142, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (116, 143, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (117, 144, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (118, 145, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (119, 146, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (120, 147, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (121, 157, 2, 36, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (122, 158, 2, 6, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (123, 160, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (124, 161, 2, 6, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (125, 162, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (126, 163, 23, 6, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (127, 164, 2, 9, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (128, 165, 2, 3, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (129, 166, 20, 6, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (130, 167, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (131, 169, 50, 30, 50, 30, 60, 30)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (132, 170, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (133, 171, 50, 600, 30, 50, 12, 30)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (134, 172, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (135, 173, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (136, 177, 23, 69, 56, 6, 5, 3)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (137, 178, 25, 36, 23, 9, 2, 69)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (138, 179, 23, 3, 23, 3, 2, 3)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (139, 180, 23, 36, 23, 66, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (140, 181, 2, 6, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (141, 183, 23, 69, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (142, 184, 23, 6, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (143, 185, 2, 3, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (144, 186, 56, 36, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (146, 187, 3, 6, 36, 36, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (147, 188, 2, 6, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (148, 189, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (149, 190, 23, 36, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (150, 191, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (151, 192, 2, 120, 2, 120, 1, 60)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (152, 193, 2, 6, 2, 9, 2, 6)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (153, 197, 2, 3, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (154, 198, 23, 36, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (155, 199, 23, 6, 2, 3, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (156, 200, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Vehiculos] ([IdVehiculos], [IdProyecto], [Can_Gasolina], [Km_Gasolina], [Can_Diesel], [Km_Diesel], [Can_GasNatural], [Km_GasNatural]) VALUES (157, 201, 0, 0, 0, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[Vehiculos] OFF
USE [master]
GO
ALTER DATABASE [HuellaCarbono] SET  READ_WRITE 
GO
