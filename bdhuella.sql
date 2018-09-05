USE [master]
GO
/****** Object:  Database [HuellaCarbono]    Script Date: 05/09/2018 8:40:47 ******/
CREATE DATABASE [HuellaCarbono]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HuellaCarbono', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HuellaCarbono.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HuellaCarbono_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HuellaCarbono_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[Empresa]    Script Date: 05/09/2018 8:40:48 ******/
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
/****** Object:  Table [dbo].[Energia]    Script Date: 05/09/2018 8:40:48 ******/
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
/****** Object:  Table [dbo].[Maquinas]    Script Date: 05/09/2018 8:40:48 ******/
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
/****** Object:  Table [dbo].[Proyecto]    Script Date: 05/09/2018 8:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proyecto](
	[IdProyecto] [int] IDENTITY(1,1) NOT NULL,
	[FechaProyecto] [date] NOT NULL,
	[IdEmpresa] [int] NOT NULL,
 CONSTRAINT [PK_Proyecto] PRIMARY KEY CLUSTERED 
(
	[IdProyecto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Residuos]    Script Date: 05/09/2018 8:40:48 ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 05/09/2018 8:40:48 ******/
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
/****** Object:  Table [dbo].[Vehiculos]    Script Date: 05/09/2018 8:40:48 ******/
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
USE [master]
GO
ALTER DATABASE [HuellaCarbono] SET  READ_WRITE 
GO
