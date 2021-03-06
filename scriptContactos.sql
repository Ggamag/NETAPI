USE [BDContact]
GO
/****** Object:  Table [dbo].[Contacto]    Script Date: 04/06/2020 12:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contacto](
	[IdPersona] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
 CONSTRAINT [PK_Contacto] PRIMARY KEY CLUSTERED 
(
	[IdPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Contacto] ON 

INSERT [dbo].[Contacto] ([IdPersona], [Nombre], [Telefono], [Email], [FechaNacimiento]) VALUES (1, N'Geovani Gama', N'5551008911', N'ggama.mc3@gmail.com', CAST(N'1981-03-14' AS Date))
SET IDENTITY_INSERT [dbo].[Contacto] OFF
/****** Object:  StoredProcedure [dbo].[SP_CRUD_CONTACT]    Script Date: 04/06/2020 12:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CRUD_CONTACT]
@ACTION INT,
@ID INT,
@NAME VARCHAR(100),
@PHONE VARCHAR(50),
@MAIL VARCHAR(50),
@FECHA DATE
AS
BEGIN
	IF @ACTION = 1
		BEGIN
			INSERT INTO CONTACTO (Nombre,Telefono,Email,FechaNacimiento)
			VALUES(@NAME,@PHONE,@MAIL, @FECHA);
		END;
	ELSE IF @ACTION = 2
		UPDATE CONTACTO SET Nombre = @NAME,Telefono = @PHONE,Email = @MAIL,FechaNacimiento = @FECHA WHERE IdPersona = @ID;
		
	ELSE
		BEGIN
			DELETE FROM CONTACTO WHERE IdPersona = @ID;
		END;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_CONTACTOS]    Script Date: 04/06/2020 12:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GET_CONTACTOS]
AS
BEGIN
SELECT IdPersona, Nombre,Telefono,Email,FechaNacimiento FROM CONTACTO C;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_SEARCH_CONTACTO]    Script Date: 04/06/2020 12:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SEARCH_CONTACTO]
@NAME VARCHAR(100)
AS
BEGIN
SELECT IdPersona, Nombre,Telefono,Email,FechaNacimiento 
FROM CONTACTO C
WHERE C.Nombre LIKE '%' + @NAME + '%';
END;
GO
