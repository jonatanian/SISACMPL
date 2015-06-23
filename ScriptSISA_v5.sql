
USE SISACMPL
GO
 IF NOT EXISTS(SELECT * FROM sys.schemas WHERE [name] = N'db_accessadmin')      
     EXEC (N'CREATE SCHEMA db_accessadmin')                                   
 GO                                                               

USE SISACMPL
GO
 IF NOT EXISTS(SELECT * FROM sys.schemas WHERE [name] = N'db_backupoperator')      
     EXEC (N'CREATE SCHEMA db_backupoperator')                                   
 GO                                                               

USE SISACMPL
GO
 IF NOT EXISTS(SELECT * FROM sys.schemas WHERE [name] = N'db_datareader')      
     EXEC (N'CREATE SCHEMA db_datareader')                                   
 GO                                                               

USE SISACMPL
GO
 IF NOT EXISTS(SELECT * FROM sys.schemas WHERE [name] = N'db_datawriter')      
     EXEC (N'CREATE SCHEMA db_datawriter')                                   
 GO                                                               

USE SISACMPL
GO
 IF NOT EXISTS(SELECT * FROM sys.schemas WHERE [name] = N'db_ddladmin')      
     EXEC (N'CREATE SCHEMA db_ddladmin')                                   
 GO                                                               

USE SISACMPL
GO
 IF NOT EXISTS(SELECT * FROM sys.schemas WHERE [name] = N'db_denydatareader')      
     EXEC (N'CREATE SCHEMA db_denydatareader')                                   
 GO                                                               

USE SISACMPL
GO
 IF NOT EXISTS(SELECT * FROM sys.schemas WHERE [name] = N'db_denydatawriter')      
     EXEC (N'CREATE SCHEMA db_denydatawriter')                                   
 GO                                                               

USE SISACMPL
GO
 IF NOT EXISTS(SELECT * FROM sys.schemas WHERE [name] = N'db_owner')      
     EXEC (N'CREATE SCHEMA db_owner')                                   
 GO                                                               

USE SISACMPL
GO
 IF NOT EXISTS(SELECT * FROM sys.schemas WHERE [name] = N'db_securityadmin')      
     EXEC (N'CREATE SCHEMA db_securityadmin')                                   
 GO                                                               

USE SISACMPL
GO
 IF NOT EXISTS(SELECT * FROM sys.schemas WHERE [name] = N'dbo')      
     EXEC (N'CREATE SCHEMA dbo')                                   
 GO                                                               

USE SISACMPL
GO
 IF NOT EXISTS(SELECT * FROM sys.schemas WHERE [name] = N'guest')      
     EXEC (N'CREATE SCHEMA guest')                                   
 GO                                                               

USE SISACMPL
GO
 IF NOT EXISTS(SELECT * FROM sys.schemas WHERE [name] = N'INFORMATION_SCHEMA')      
     EXEC (N'CREATE SCHEMA INFORMATION_SCHEMA')                                   
 GO                                                               

USE SISACMPL
GO
 IF NOT EXISTS(SELECT * FROM sys.schemas WHERE [name] = N'sys')      
     EXEC (N'CREATE SCHEMA sys')                                   
 GO                                                               

USE SISACMPL
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'anexo'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'anexo'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[anexo]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[anexo]
(
   [IdAnexo] int IDENTITY(1, 1)  NOT NULL,
   [Correspondencia_Id] int  NOT NULL,
   [DescripcionAnexo] nvarchar(250) DEFAULT NULL  NULL,
   [UbicacionFisica] nvarchar(150) DEFAULT NULL  NULL,
   [NombreAnexo] nvarchar(100)  NOT NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'sisacmpl.anexo',
        N'SCHEMA', N'dbo',
        N'TABLE', N'anexo'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE SISACMPL
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'area'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'area'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[area]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[area]
(
   [IdArea] int IDENTITY(1, 1)  NOT NULL,
   [NombreArea] nvarchar(60)  NOT NULL,
   [DescripcionArea] nvarchar(150) DEFAULT NULL  NULL,
   [Departamento] int DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'sisacmpl.`area`',
        N'SCHEMA', N'dbo',
        N'TABLE', N'area'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE SISACMPL
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'cargo'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'cargo'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[cargo]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[cargo]
(
   [IdCargo] int IDENTITY(1, 1)  NOT NULL,
   [NombreCargo] nvarchar(100)  NOT NULL,
   [DescripcionCargo] nvarchar(150) DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'sisacmpl.cargo',
        N'SCHEMA', N'dbo',
        N'TABLE', N'cargo'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE SISACMPL
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'cargo_tiene_area'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'cargo_tiene_area'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[cargo_tiene_area]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[cargo_tiene_area]
(
   [Cargo_Id] int  NOT NULL,
   [Area_Id] int  NOT NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'sisacmpl.cargo_tiene_area',
        N'SCHEMA', N'dbo',
        N'TABLE', N'cargo_tiene_area'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE SISACMPL
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'correspondencia'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'correspondencia'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[correspondencia]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[correspondencia]
(
   [IdCorrespondencia] int IDENTITY(1, 1)  NOT NULL,
   [FechaEmision] date DEFAULT NULL  NULL,
   [FechaEntrega] date DEFAULT NULL  NULL,
   [Asunto] nvarchar(250) DEFAULT NULL  NULL,
   [RequiereRespuesta] smallint DEFAULT NULL  NULL,
   [URLPDF] nvarchar(150) DEFAULT NULL  NULL,
   [FechaLimiteR] date DEFAULT NULL  NULL,
   [EnRespuestaA] int DEFAULT NULL  NULL,
   [Estatus_Id] int DEFAULT NULL  NULL,
   [Prioridad_Id] int DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'sisacmpl.correspondencia',
        N'SCHEMA', N'dbo',
        N'TABLE', N'correspondencia'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE SISACMPL
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'dependencia'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'dependencia'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[dependencia]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[dependencia]
(
   [IdDependencia] int IDENTITY(1, 1)  NOT NULL,
   [NombreDependencia] nvarchar(200)  NOT NULL,
   [AcronimoDependencia] nvarchar(20) DEFAULT NULL  NULL,
   [DescripcionDependencia] nvarchar(200) DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'sisacmpl.dependencia',
        N'SCHEMA', N'dbo',
        N'TABLE', N'dependencia'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE SISACMPL
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'entidad_externa'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'entidad_externa'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[entidad_externa]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[entidad_externa]
(
   [IdEntidadExterna] int IDENTITY(1, 1)  NOT NULL,
   [NombreEntidad] nvarchar(150)  NOT NULL,
   [CargoEntidad] nvarchar(60) DEFAULT NULL  NULL,
   [AreaEntidad] nvarchar(100) DEFAULT NULL  NULL,
   [Dependencia_Id] int  NOT NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'sisacmpl.entidad_externa',
        N'SCHEMA', N'dbo',
        N'TABLE', N'entidad_externa'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE SISACMPL
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'estatus'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'estatus'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[estatus]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[estatus]
(
   [IdEstatus] int IDENTITY(1, 1)  NOT NULL,
   [NombreEstatus] nvarchar(20)  NOT NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'sisacmpl.estatus',
        N'SCHEMA', N'dbo',
        N'TABLE', N'estatus'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE SISACMPL
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'memorandum'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'memorandum'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[memorandum]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[memorandum]
(
   [IdConsecutivoMemo] int IDENTITY(1, 1)  NOT NULL,
   [IdMemorandum] nvarchar(25)  NOT NULL,
   [Correspondencia_Id] int  NOT NULL,
   [Usuario_Id] int  NOT NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'sisacmpl.memorandum',
        N'SCHEMA', N'dbo',
        N'TABLE', N'memorandum'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE SISACMPL
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'observaciones'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'observaciones'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[observaciones]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[observaciones]
(
   [IdObservaciones] int IDENTITY(1, 1)  NOT NULL,
   [Oficio_Saliente_Id] int  NOT NULL,
   [DescripcionObservaciones] nvarchar(250)  NOT NULL,
   [VistoBueno] binary(1)  NOT NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'sisacmpl.observaciones',
        N'SCHEMA', N'dbo',
        N'TABLE', N'observaciones'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE SISACMPL
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'oficio_entrante'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'oficio_entrante'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[oficio_entrante]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[oficio_entrante]
(
   [IdOficioEntrante] int IDENTITY(1, 1)  NOT NULL,
   [IdOficioDependencia] nvarchar(25)  NOT NULL,
   [DirigidoA] int  NOT NULL,
   [Correspondencia_Id] int  NOT NULL,
   [Entidad_Externa_Id] int  NOT NULL,
   [NombrePortador] nvarchar(150) DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'sisacmpl.oficio_entrante',
        N'SCHEMA', N'dbo',
        N'TABLE', N'oficio_entrante'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE SISACMPL
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'oficio_saliente'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'oficio_saliente'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[oficio_saliente]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[oficio_saliente]
(
   [IdConsecutivo] int IDENTITY(1, 1)  NOT NULL,
   [IdOficioSaliente] nvarchar(25)  NOT NULL,
   [Correspondencia_Id] int  NOT NULL,
   [Usuario_Id] int  NOT NULL,
   [URLAcuse] nvarchar(150) DEFAULT NULL  NULL,
   [FechaAcuse] date DEFAULT NULL  NULL,
   [DirigidoA_Id] int  NOT NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'sisacmpl.oficio_saliente',
        N'SCHEMA', N'dbo',
        N'TABLE', N'oficio_saliente'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE SISACMPL
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'prioridad'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'prioridad'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[prioridad]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[prioridad]
(
   [IdPrioridad] int IDENTITY(1, 1)  NOT NULL,
   [NombrePrioridad] nvarchar(6)  NOT NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'sisacmpl.prioridad',
        N'SCHEMA', N'dbo',
        N'TABLE', N'prioridad'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE SISACMPL
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'rol'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'rol'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[rol]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[rol]
(
   [IdRol] int IDENTITY(1, 1)  NOT NULL,
   [NombreRol] nvarchar(20)  NOT NULL,
   [DescripcionRol] nvarchar(200) DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'sisacmpl.rol',
        N'SCHEMA', N'dbo',
        N'TABLE', N'rol'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE SISACMPL
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'tipo'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'tipo'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[tipo]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[tipo]
(
   [IdTipo] int IDENTITY(1, 1)  NOT NULL,
   [NombreTipo] nvarchar(25)  NOT NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'sisacmpl.tipo',
        N'SCHEMA', N'dbo',
        N'TABLE', N'tipo'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE SISACMPL
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'usuario'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'usuario'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[usuario]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[usuario]
(
   [IdUsuario] int IDENTITY(1, 1)  NOT NULL,
   [Nombre] nvarchar(50)  NOT NULL,
   [ApPaterno] nvarchar(50)  NOT NULL,
   [ApMaterno] nvarchar(50)  NOT NULL,
   [Email] nvarchar(30)  NOT NULL,
   [Password] nvarchar(255)  NOT NULL,
   [Extension] int  NOT NULL,
   [FechaInicio] date DEFAULT NULL  NULL,
   [FechaFin] date DEFAULT NULL  NULL,
   [URLCV] nvarchar(150) DEFAULT NULL  NULL,
   [Activo] smallint DEFAULT NULL  NULL,
   [Cargo_Id] int DEFAULT NULL  NULL,
   [Rol_Id] int DEFAULT NULL  NULL,
   [updated_at] date DEFAULT NULL  NULL,
   [created_at] date DEFAULT NULL  NULL,
   [remember_token] nvarchar(300) DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'sisacmpl.usuario',
        N'SCHEMA', N'dbo',
        N'TABLE', N'usuario'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE SISACMPL
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'usuario_turna_correspondencia'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'usuario_turna_correspondencia'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[usuario_turna_correspondencia]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[usuario_turna_correspondencia]
(
   [Usuario_Id] int  NOT NULL,
   [Correspondencia_Id] int  NOT NULL,
   [FechaTurnadoA] date  NOT NULL,
   [Tipo_Id] int  NOT NULL,
   [UTC_TurnarA_Id] int  NOT NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'sisacmpl.usuario_turna_correspondencia',
        N'SCHEMA', N'dbo',
        N'TABLE', N'usuario_turna_correspondencia'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE SISACMPL
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_anexo_IdAnexo'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[anexo] DROP CONSTRAINT [PK_anexo_IdAnexo]
 GO



ALTER TABLE [dbo].[anexo]
 ADD CONSTRAINT [PK_anexo_IdAnexo]
 PRIMARY KEY 
   CLUSTERED ([IdAnexo] ASC)

GO


USE SISACMPL
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_area_IdArea'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[area] DROP CONSTRAINT [PK_area_IdArea]
 GO



ALTER TABLE [dbo].[area]
 ADD CONSTRAINT [PK_area_IdArea]
 PRIMARY KEY 
   CLUSTERED ([IdArea] ASC)

GO


USE SISACMPL
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_cargo_IdCargo'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[cargo] DROP CONSTRAINT [PK_cargo_IdCargo]
 GO



ALTER TABLE [dbo].[cargo]
 ADD CONSTRAINT [PK_cargo_IdCargo]
 PRIMARY KEY 
   CLUSTERED ([IdCargo] ASC)

GO


USE SISACMPL
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_cargo_tiene_area_Cargo_Id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[cargo_tiene_area] DROP CONSTRAINT [PK_cargo_tiene_area_Cargo_Id]
 GO



ALTER TABLE [dbo].[cargo_tiene_area]
 ADD CONSTRAINT [PK_cargo_tiene_area_Cargo_Id]
 PRIMARY KEY 
   CLUSTERED ([Cargo_Id] ASC, [Area_Id] ASC)

GO


USE SISACMPL
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_correspondencia_IdCorrespondencia'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[correspondencia] DROP CONSTRAINT [PK_correspondencia_IdCorrespondencia]
 GO



ALTER TABLE [dbo].[correspondencia]
 ADD CONSTRAINT [PK_correspondencia_IdCorrespondencia]
 PRIMARY KEY 
   CLUSTERED ([IdCorrespondencia] ASC)

GO


USE SISACMPL
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_dependencia_IdDependencia'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[dependencia] DROP CONSTRAINT [PK_dependencia_IdDependencia]
 GO



ALTER TABLE [dbo].[dependencia]
 ADD CONSTRAINT [PK_dependencia_IdDependencia]
 PRIMARY KEY 
   CLUSTERED ([IdDependencia] ASC)

GO


USE SISACMPL
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_entidad_externa_IdEntidadExterna'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[entidad_externa] DROP CONSTRAINT [PK_entidad_externa_IdEntidadExterna]
 GO



ALTER TABLE [dbo].[entidad_externa]
 ADD CONSTRAINT [PK_entidad_externa_IdEntidadExterna]
 PRIMARY KEY 
   CLUSTERED ([IdEntidadExterna] ASC)

GO


USE SISACMPL
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_estatus_IdEstatus'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[estatus] DROP CONSTRAINT [PK_estatus_IdEstatus]
 GO



ALTER TABLE [dbo].[estatus]
 ADD CONSTRAINT [PK_estatus_IdEstatus]
 PRIMARY KEY 
   CLUSTERED ([IdEstatus] ASC)

GO


USE SISACMPL
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_memorandum_IdConsecutivoMemo'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[memorandum] DROP CONSTRAINT [PK_memorandum_IdConsecutivoMemo]
 GO



ALTER TABLE [dbo].[memorandum]
 ADD CONSTRAINT [PK_memorandum_IdConsecutivoMemo]
 PRIMARY KEY 
   CLUSTERED ([IdConsecutivoMemo] ASC)

GO


USE SISACMPL
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_observaciones_IdObservaciones'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[observaciones] DROP CONSTRAINT [PK_observaciones_IdObservaciones]
 GO



ALTER TABLE [dbo].[observaciones]
 ADD CONSTRAINT [PK_observaciones_IdObservaciones]
 PRIMARY KEY 
   CLUSTERED ([IdObservaciones] ASC, [Oficio_Saliente_Id] ASC)

GO


USE SISACMPL
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_oficio_entrante_IdOficioEntrante'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[oficio_entrante] DROP CONSTRAINT [PK_oficio_entrante_IdOficioEntrante]
 GO



ALTER TABLE [dbo].[oficio_entrante]
 ADD CONSTRAINT [PK_oficio_entrante_IdOficioEntrante]
 PRIMARY KEY 
   CLUSTERED ([IdOficioEntrante] ASC)

GO


USE SISACMPL
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_oficio_saliente_IdConsecutivo'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[oficio_saliente] DROP CONSTRAINT [PK_oficio_saliente_IdConsecutivo]
 GO



ALTER TABLE [dbo].[oficio_saliente]
 ADD CONSTRAINT [PK_oficio_saliente_IdConsecutivo]
 PRIMARY KEY 
   CLUSTERED ([IdConsecutivo] ASC)

GO


USE SISACMPL
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_prioridad_IdPrioridad'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[prioridad] DROP CONSTRAINT [PK_prioridad_IdPrioridad]
 GO



ALTER TABLE [dbo].[prioridad]
 ADD CONSTRAINT [PK_prioridad_IdPrioridad]
 PRIMARY KEY 
   CLUSTERED ([IdPrioridad] ASC)

GO


USE SISACMPL
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_rol_IdRol'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[rol] DROP CONSTRAINT [PK_rol_IdRol]
 GO



ALTER TABLE [dbo].[rol]
 ADD CONSTRAINT [PK_rol_IdRol]
 PRIMARY KEY 
   CLUSTERED ([IdRol] ASC)

GO


USE SISACMPL
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_tipo_IdTipo'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[tipo] DROP CONSTRAINT [PK_tipo_IdTipo]
 GO



ALTER TABLE [dbo].[tipo]
 ADD CONSTRAINT [PK_tipo_IdTipo]
 PRIMARY KEY 
   CLUSTERED ([IdTipo] ASC)

GO


USE SISACMPL
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_usuario_IdUsuario'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[usuario] DROP CONSTRAINT [PK_usuario_IdUsuario]
 GO



ALTER TABLE [dbo].[usuario]
 ADD CONSTRAINT [PK_usuario_IdUsuario]
 PRIMARY KEY 
   CLUSTERED ([IdUsuario] ASC)

GO


USE SISACMPL
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_usuario_turna_correspondencia_Usuario_Id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[usuario_turna_correspondencia] DROP CONSTRAINT [PK_usuario_turna_correspondencia_Usuario_Id]
 GO



ALTER TABLE [dbo].[usuario_turna_correspondencia]
 ADD CONSTRAINT [PK_usuario_turna_correspondencia_Usuario_Id]
 PRIMARY KEY 
   CLUSTERED ([Usuario_Id] ASC, [Correspondencia_Id] ASC, [UTC_TurnarA_Id] ASC)

GO


USE SISACMPL
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'anexo'  AND sc.name = N'dbo'  AND si.name = N'fk_ANEXO_CORRESPONDENCIA1_idx' AND so.type in (N'U'))
   DROP INDEX [dbo].[anexo].[fk_ANEXO_CORRESPONDENCIA1_idx] 
GO
CREATE NONCLUSTERED INDEX [fk_ANEXO_CORRESPONDENCIA1_idx] ON [dbo].[anexo]
(
   [Correspondencia_Id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE SISACMPL
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'area'  AND sc.name = N'dbo'  AND si.name = N'fk_AREA_AREA1_idx' AND so.type in (N'U'))
   DROP INDEX [dbo].[area].[fk_AREA_AREA1_idx] 
GO
CREATE NONCLUSTERED INDEX [fk_AREA_AREA1_idx] ON [dbo].[area]
(
   [Departamento] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE SISACMPL
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'cargo_tiene_area'  AND sc.name = N'dbo'  AND si.name = N'fk_CARGO_TIENE_AREA_AREA1_idx' AND so.type in (N'U'))
   DROP INDEX [dbo].[cargo_tiene_area].[fk_CARGO_TIENE_AREA_AREA1_idx] 
GO
CREATE NONCLUSTERED INDEX [fk_CARGO_TIENE_AREA_AREA1_idx] ON [dbo].[cargo_tiene_area]
(
   [Area_Id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE SISACMPL
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'correspondencia'  AND sc.name = N'dbo'  AND si.name = N'fk_CORRESPONDENCIA_CORRESPONDENCIA1_idx' AND so.type in (N'U'))
   DROP INDEX [dbo].[correspondencia].[fk_CORRESPONDENCIA_CORRESPONDENCIA1_idx] 
GO
CREATE NONCLUSTERED INDEX [fk_CORRESPONDENCIA_CORRESPONDENCIA1_idx] ON [dbo].[correspondencia]
(
   [EnRespuestaA] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE SISACMPL
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'correspondencia'  AND sc.name = N'dbo'  AND si.name = N'fk_CORRESPONDENCIA_Estatus1_idx' AND so.type in (N'U'))
   DROP INDEX [dbo].[correspondencia].[fk_CORRESPONDENCIA_Estatus1_idx] 
GO
CREATE NONCLUSTERED INDEX [fk_CORRESPONDENCIA_Estatus1_idx] ON [dbo].[correspondencia]
(
   [Estatus_Id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE SISACMPL
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'correspondencia'  AND sc.name = N'dbo'  AND si.name = N'fk_CORRESPONDENCIA_PRIORIDAD1_idx' AND so.type in (N'U'))
   DROP INDEX [dbo].[correspondencia].[fk_CORRESPONDENCIA_PRIORIDAD1_idx] 
GO
CREATE NONCLUSTERED INDEX [fk_CORRESPONDENCIA_PRIORIDAD1_idx] ON [dbo].[correspondencia]
(
   [Prioridad_Id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE SISACMPL
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'entidad_externa'  AND sc.name = N'dbo'  AND si.name = N'fk_ENTIDAD_EXTERNA_DEPENDENCIA1_idx' AND so.type in (N'U'))
   DROP INDEX [dbo].[entidad_externa].[fk_ENTIDAD_EXTERNA_DEPENDENCIA1_idx] 
GO
CREATE NONCLUSTERED INDEX [fk_ENTIDAD_EXTERNA_DEPENDENCIA1_idx] ON [dbo].[entidad_externa]
(
   [Dependencia_Id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE SISACMPL
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'memorandum'  AND sc.name = N'dbo'  AND si.name = N'fk_MEMORANDUM_CORRESPONDENCIA1_idx' AND so.type in (N'U'))
   DROP INDEX [dbo].[memorandum].[fk_MEMORANDUM_CORRESPONDENCIA1_idx] 
GO
CREATE NONCLUSTERED INDEX [fk_MEMORANDUM_CORRESPONDENCIA1_idx] ON [dbo].[memorandum]
(
   [Correspondencia_Id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE SISACMPL
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'memorandum'  AND sc.name = N'dbo'  AND si.name = N'fk_MEMORANDUM_USUARIO1_idx' AND so.type in (N'U'))
   DROP INDEX [dbo].[memorandum].[fk_MEMORANDUM_USUARIO1_idx] 
GO
CREATE NONCLUSTERED INDEX [fk_MEMORANDUM_USUARIO1_idx] ON [dbo].[memorandum]
(
   [Usuario_Id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE SISACMPL
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'observaciones'  AND sc.name = N'dbo'  AND si.name = N'fk_OBSERVACIONES_OFICIO_SALIENTE1_idx' AND so.type in (N'U'))
   DROP INDEX [dbo].[observaciones].[fk_OBSERVACIONES_OFICIO_SALIENTE1_idx] 
GO
CREATE NONCLUSTERED INDEX [fk_OBSERVACIONES_OFICIO_SALIENTE1_idx] ON [dbo].[observaciones]
(
   [Oficio_Saliente_Id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE SISACMPL
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'oficio_entrante'  AND sc.name = N'dbo'  AND si.name = N'fk_OFICIO_ENTRANTE_ENTIDAD_EXTERNA1_idx' AND so.type in (N'U'))
   DROP INDEX [dbo].[oficio_entrante].[fk_OFICIO_ENTRANTE_ENTIDAD_EXTERNA1_idx] 
GO
CREATE NONCLUSTERED INDEX [fk_OFICIO_ENTRANTE_ENTIDAD_EXTERNA1_idx] ON [dbo].[oficio_entrante]
(
   [Entidad_Externa_Id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE SISACMPL
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'oficio_saliente'  AND sc.name = N'dbo'  AND si.name = N'fk_OFICIO_SALIENTE_CORRESPONDENCIA1_idx' AND so.type in (N'U'))
   DROP INDEX [dbo].[oficio_saliente].[fk_OFICIO_SALIENTE_CORRESPONDENCIA1_idx] 
GO
CREATE NONCLUSTERED INDEX [fk_OFICIO_SALIENTE_CORRESPONDENCIA1_idx] ON [dbo].[oficio_saliente]
(
   [Correspondencia_Id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE SISACMPL
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'oficio_saliente'  AND sc.name = N'dbo'  AND si.name = N'fk_OFICIO_SALIENTE_ENTIDAD_EXTERNA1_idx' AND so.type in (N'U'))
   DROP INDEX [dbo].[oficio_saliente].[fk_OFICIO_SALIENTE_ENTIDAD_EXTERNA1_idx] 
GO
CREATE NONCLUSTERED INDEX [fk_OFICIO_SALIENTE_ENTIDAD_EXTERNA1_idx] ON [dbo].[oficio_saliente]
(
   [DirigidoA_Id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE SISACMPL
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'oficio_saliente'  AND sc.name = N'dbo'  AND si.name = N'fk_OFICIO_SALIENTE_USUARIO1_idx' AND so.type in (N'U'))
   DROP INDEX [dbo].[oficio_saliente].[fk_OFICIO_SALIENTE_USUARIO1_idx] 
GO
CREATE NONCLUSTERED INDEX [fk_OFICIO_SALIENTE_USUARIO1_idx] ON [dbo].[oficio_saliente]
(
   [Usuario_Id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE SISACMPL
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'oficio_entrante'  AND sc.name = N'dbo'  AND si.name = N'fk_OFICIOENTRANTE_CORRESPONDENCIA1_idx' AND so.type in (N'U'))
   DROP INDEX [dbo].[oficio_entrante].[fk_OFICIOENTRANTE_CORRESPONDENCIA1_idx] 
GO
CREATE NONCLUSTERED INDEX [fk_OFICIOENTRANTE_CORRESPONDENCIA1_idx] ON [dbo].[oficio_entrante]
(
   [Correspondencia_Id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE SISACMPL
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'usuario'  AND sc.name = N'dbo'  AND si.name = N'fk_USUARIO_CARGO_idx' AND so.type in (N'U'))
   DROP INDEX [dbo].[usuario].[fk_USUARIO_CARGO_idx] 
GO
CREATE NONCLUSTERED INDEX [fk_USUARIO_CARGO_idx] ON [dbo].[usuario]
(
   [Cargo_Id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE SISACMPL
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'usuario'  AND sc.name = N'dbo'  AND si.name = N'fk_USUARIO_ROL1_idx' AND so.type in (N'U'))
   DROP INDEX [dbo].[usuario].[fk_USUARIO_ROL1_idx] 
GO
CREATE NONCLUSTERED INDEX [fk_USUARIO_ROL1_idx] ON [dbo].[usuario]
(
   [Rol_Id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE SISACMPL
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'usuario_turna_correspondencia'  AND sc.name = N'dbo'  AND si.name = N'fk_USUARIO_TURNA_CORRESPONDENCIA_CORRESPONDENCIA1_idx' AND so.type in (N'U'))
   DROP INDEX [dbo].[usuario_turna_correspondencia].[fk_USUARIO_TURNA_CORRESPONDENCIA_CORRESPONDENCIA1_idx] 
GO
CREATE NONCLUSTERED INDEX [fk_USUARIO_TURNA_CORRESPONDENCIA_CORRESPONDENCIA1_idx] ON [dbo].[usuario_turna_correspondencia]
(
   [Correspondencia_Id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE SISACMPL
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'usuario_turna_correspondencia'  AND sc.name = N'dbo'  AND si.name = N'fk_USUARIO_TURNA_CORRESPONDENCIA_TIPO1_idx' AND so.type in (N'U'))
   DROP INDEX [dbo].[usuario_turna_correspondencia].[fk_USUARIO_TURNA_CORRESPONDENCIA_TIPO1_idx] 
GO
CREATE NONCLUSTERED INDEX [fk_USUARIO_TURNA_CORRESPONDENCIA_TIPO1_idx] ON [dbo].[usuario_turna_correspondencia]
(
   [Tipo_Id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE SISACMPL
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'usuario_turna_correspondencia'  AND sc.name = N'dbo'  AND si.name = N'fk_USUARIO_TURNA_CORRESPONDENCIA_USUARIO2_idx' AND so.type in (N'U'))
   DROP INDEX [dbo].[usuario_turna_correspondencia].[fk_USUARIO_TURNA_CORRESPONDENCIA_USUARIO2_idx] 
GO
CREATE NONCLUSTERED INDEX [fk_USUARIO_TURNA_CORRESPONDENCIA_USUARIO2_idx] ON [dbo].[usuario_turna_correspondencia]
(
   [UTC_TurnarA_Id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE SISACMPL
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'anexo$fk_ANEXO_CORRESPONDENCIA1'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[anexo] DROP CONSTRAINT [anexo$fk_ANEXO_CORRESPONDENCIA1]
 GO



ALTER TABLE [dbo].[anexo]
 ADD CONSTRAINT [anexo$fk_ANEXO_CORRESPONDENCIA1]
 FOREIGN KEY 
   ([Correspondencia_Id])
 REFERENCES 
   [SISACMPL].[dbo].[correspondencia]     ([IdCorrespondencia])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE SISACMPL
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'area$fk_AREA_AREA1'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[area] DROP CONSTRAINT [area$fk_AREA_AREA1]
 GO



ALTER TABLE [dbo].[area]
 ADD CONSTRAINT [area$fk_AREA_AREA1]
 FOREIGN KEY 
   ([Departamento])
 REFERENCES 
   [SISACMPL].[dbo].[area]     ([IdArea])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE SISACMPL
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'cargo_tiene_area$fk_CARGO_TIENE_AREA_AREA1'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[cargo_tiene_area] DROP CONSTRAINT [cargo_tiene_area$fk_CARGO_TIENE_AREA_AREA1]
 GO



ALTER TABLE [dbo].[cargo_tiene_area]
 ADD CONSTRAINT [cargo_tiene_area$fk_CARGO_TIENE_AREA_AREA1]
 FOREIGN KEY 
   ([Area_Id])
 REFERENCES 
   [SISACMPL].[dbo].[area]     ([IdArea])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'cargo_tiene_area$fk_CARGO_TIENE_AREA_CARGO1'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[cargo_tiene_area] DROP CONSTRAINT [cargo_tiene_area$fk_CARGO_TIENE_AREA_CARGO1]
 GO



ALTER TABLE [dbo].[cargo_tiene_area]
 ADD CONSTRAINT [cargo_tiene_area$fk_CARGO_TIENE_AREA_CARGO1]
 FOREIGN KEY 
   ([Cargo_Id])
 REFERENCES 
   [SISACMPL].[dbo].[cargo]     ([IdCargo])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE SISACMPL
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'correspondencia$fk_CORRESPONDENCIA_CORRESPONDENCIA1'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[correspondencia] DROP CONSTRAINT [correspondencia$fk_CORRESPONDENCIA_CORRESPONDENCIA1]
 GO



ALTER TABLE [dbo].[correspondencia]
 ADD CONSTRAINT [correspondencia$fk_CORRESPONDENCIA_CORRESPONDENCIA1]
 FOREIGN KEY 
   ([EnRespuestaA])
 REFERENCES 
   [SISACMPL].[dbo].[correspondencia]     ([IdCorrespondencia])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'correspondencia$fk_CORRESPONDENCIA_Estatus1'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[correspondencia] DROP CONSTRAINT [correspondencia$fk_CORRESPONDENCIA_Estatus1]
 GO



ALTER TABLE [dbo].[correspondencia]
 ADD CONSTRAINT [correspondencia$fk_CORRESPONDENCIA_Estatus1]
 FOREIGN KEY 
   ([Estatus_Id])
 REFERENCES 
   [SISACMPL].[dbo].[estatus]     ([IdEstatus])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'correspondencia$fk_CORRESPONDENCIA_PRIORIDAD1'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[correspondencia] DROP CONSTRAINT [correspondencia$fk_CORRESPONDENCIA_PRIORIDAD1]
 GO



ALTER TABLE [dbo].[correspondencia]
 ADD CONSTRAINT [correspondencia$fk_CORRESPONDENCIA_PRIORIDAD1]
 FOREIGN KEY 
   ([Prioridad_Id])
 REFERENCES 
   [SISACMPL].[dbo].[prioridad]     ([IdPrioridad])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE SISACMPL
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'entidad_externa$fk_ENTIDAD_EXTERNA_DEPENDENCIA1'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[entidad_externa] DROP CONSTRAINT [entidad_externa$fk_ENTIDAD_EXTERNA_DEPENDENCIA1]
 GO



ALTER TABLE [dbo].[entidad_externa]
 ADD CONSTRAINT [entidad_externa$fk_ENTIDAD_EXTERNA_DEPENDENCIA1]
 FOREIGN KEY 
   ([Dependencia_Id])
 REFERENCES 
   [SISACMPL].[dbo].[dependencia]     ([IdDependencia])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE SISACMPL
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'memorandum$fk_MEMORANDUM_CORRESPONDENCIA1'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[memorandum] DROP CONSTRAINT [memorandum$fk_MEMORANDUM_CORRESPONDENCIA1]
 GO



ALTER TABLE [dbo].[memorandum]
 ADD CONSTRAINT [memorandum$fk_MEMORANDUM_CORRESPONDENCIA1]
 FOREIGN KEY 
   ([Correspondencia_Id])
 REFERENCES 
   [SISACMPL].[dbo].[correspondencia]     ([IdCorrespondencia])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'memorandum$fk_MEMORANDUM_USUARIO1'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[memorandum] DROP CONSTRAINT [memorandum$fk_MEMORANDUM_USUARIO1]
 GO



ALTER TABLE [dbo].[memorandum]
 ADD CONSTRAINT [memorandum$fk_MEMORANDUM_USUARIO1]
 FOREIGN KEY 
   ([Usuario_Id])
 REFERENCES 
   [SISACMPL].[dbo].[usuario]     ([IdUsuario])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE SISACMPL
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'observaciones$fk_OBSERVACIONES_OFICIO_SALIENTE1'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[observaciones] DROP CONSTRAINT [observaciones$fk_OBSERVACIONES_OFICIO_SALIENTE1]
 GO



ALTER TABLE [dbo].[observaciones]
 ADD CONSTRAINT [observaciones$fk_OBSERVACIONES_OFICIO_SALIENTE1]
 FOREIGN KEY 
   ([Oficio_Saliente_Id])
 REFERENCES 
   [SISACMPL].[dbo].[oficio_saliente]     ([IdConsecutivo])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE SISACMPL
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'oficio_entrante$fk_OFICIOENTRANTE_CORRESPONDENCIA1'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[oficio_entrante] DROP CONSTRAINT [oficio_entrante$fk_OFICIOENTRANTE_CORRESPONDENCIA1]
 GO



ALTER TABLE [dbo].[oficio_entrante]
 ADD CONSTRAINT [oficio_entrante$fk_OFICIOENTRANTE_CORRESPONDENCIA1]
 FOREIGN KEY 
   ([Correspondencia_Id])
 REFERENCES 
   [SISACMPL].[dbo].[correspondencia]     ([IdCorrespondencia])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'oficio_entrante$fk_OFICIO_ENTRANTE_ENTIDAD_EXTERNA1'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[oficio_entrante] DROP CONSTRAINT [oficio_entrante$fk_OFICIO_ENTRANTE_ENTIDAD_EXTERNA1]
 GO



ALTER TABLE [dbo].[oficio_entrante]
 ADD CONSTRAINT [oficio_entrante$fk_OFICIO_ENTRANTE_ENTIDAD_EXTERNA1]
 FOREIGN KEY 
   ([Entidad_Externa_Id])
 REFERENCES 
   [SISACMPL].[dbo].[entidad_externa]     ([IdEntidadExterna])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE SISACMPL
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'oficio_saliente$fk_OFICIO_SALIENTE_CORRESPONDENCIA1'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[oficio_saliente] DROP CONSTRAINT [oficio_saliente$fk_OFICIO_SALIENTE_CORRESPONDENCIA1]
 GO



ALTER TABLE [dbo].[oficio_saliente]
 ADD CONSTRAINT [oficio_saliente$fk_OFICIO_SALIENTE_CORRESPONDENCIA1]
 FOREIGN KEY 
   ([Correspondencia_Id])
 REFERENCES 
   [SISACMPL].[dbo].[correspondencia]     ([IdCorrespondencia])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'oficio_saliente$fk_OFICIO_SALIENTE_ENTIDAD_EXTERNA1'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[oficio_saliente] DROP CONSTRAINT [oficio_saliente$fk_OFICIO_SALIENTE_ENTIDAD_EXTERNA1]
 GO



ALTER TABLE [dbo].[oficio_saliente]
 ADD CONSTRAINT [oficio_saliente$fk_OFICIO_SALIENTE_ENTIDAD_EXTERNA1]
 FOREIGN KEY 
   ([DirigidoA_Id])
 REFERENCES 
   [SISACMPL].[dbo].[entidad_externa]     ([IdEntidadExterna])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'oficio_saliente$fk_OFICIO_SALIENTE_USUARIO1'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[oficio_saliente] DROP CONSTRAINT [oficio_saliente$fk_OFICIO_SALIENTE_USUARIO1]
 GO



ALTER TABLE [dbo].[oficio_saliente]
 ADD CONSTRAINT [oficio_saliente$fk_OFICIO_SALIENTE_USUARIO1]
 FOREIGN KEY 
   ([Usuario_Id])
 REFERENCES 
   [SISACMPL].[dbo].[usuario]     ([IdUsuario])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE SISACMPL
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'usuario$fk_USUARIO_CARGO'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[usuario] DROP CONSTRAINT [usuario$fk_USUARIO_CARGO]
 GO



ALTER TABLE [dbo].[usuario]
 ADD CONSTRAINT [usuario$fk_USUARIO_CARGO]
 FOREIGN KEY 
   ([Cargo_Id])
 REFERENCES 
   [SISACMPL].[dbo].[cargo]     ([IdCargo])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'usuario$fk_USUARIO_ROL1'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[usuario] DROP CONSTRAINT [usuario$fk_USUARIO_ROL1]
 GO



ALTER TABLE [dbo].[usuario]
 ADD CONSTRAINT [usuario$fk_USUARIO_ROL1]
 FOREIGN KEY 
   ([Rol_Id])
 REFERENCES 
   [SISACMPL].[dbo].[rol]     ([IdRol])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE SISACMPL
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'usuario_turna_correspondencia$fk_USUARIO_TURNA_CORRESPONDENCIA_CORRESPONDENCIA1'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[usuario_turna_correspondencia] DROP CONSTRAINT [usuario_turna_correspondencia$fk_USUARIO_TURNA_CORRESPONDENCIA_CORRESPONDENCIA1]
 GO



ALTER TABLE [dbo].[usuario_turna_correspondencia]
 ADD CONSTRAINT [usuario_turna_correspondencia$fk_USUARIO_TURNA_CORRESPONDENCIA_CORRESPONDENCIA1]
 FOREIGN KEY 
   ([Correspondencia_Id])
 REFERENCES 
   [SISACMPL].[dbo].[correspondencia]     ([IdCorrespondencia])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'usuario_turna_correspondencia$fk_USUARIO_TURNA_CORRESPONDENCIA_TIPO1'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[usuario_turna_correspondencia] DROP CONSTRAINT [usuario_turna_correspondencia$fk_USUARIO_TURNA_CORRESPONDENCIA_TIPO1]
 GO



ALTER TABLE [dbo].[usuario_turna_correspondencia]
 ADD CONSTRAINT [usuario_turna_correspondencia$fk_USUARIO_TURNA_CORRESPONDENCIA_TIPO1]
 FOREIGN KEY 
   ([Tipo_Id])
 REFERENCES 
   [SISACMPL].[dbo].[tipo]     ([IdTipo])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'usuario_turna_correspondencia$fk_USUARIO_TURNA_CORRESPONDENCIA_USUARIO1'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[usuario_turna_correspondencia] DROP CONSTRAINT [usuario_turna_correspondencia$fk_USUARIO_TURNA_CORRESPONDENCIA_USUARIO1]
 GO



ALTER TABLE [dbo].[usuario_turna_correspondencia]
 ADD CONSTRAINT [usuario_turna_correspondencia$fk_USUARIO_TURNA_CORRESPONDENCIA_USUARIO1]
 FOREIGN KEY 
   ([Usuario_Id])
 REFERENCES 
   [SISACMPL].[dbo].[usuario]     ([IdUsuario])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'usuario_turna_correspondencia$fk_USUARIO_TURNA_CORRESPONDENCIA_USUARIO2'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[usuario_turna_correspondencia] DROP CONSTRAINT [usuario_turna_correspondencia$fk_USUARIO_TURNA_CORRESPONDENCIA_USUARIO2]
 GO



ALTER TABLE [dbo].[usuario_turna_correspondencia]
 ADD CONSTRAINT [usuario_turna_correspondencia$fk_USUARIO_TURNA_CORRESPONDENCIA_USUARIO2]
 FOREIGN KEY 
   ([UTC_TurnarA_Id])
 REFERENCES 
   [SISACMPL].[dbo].[usuario]     ([IdUsuario])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO

