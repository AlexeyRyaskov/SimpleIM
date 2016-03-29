
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/25/2016 15:40:28
-- Generated from EDMX file: D:\Документы\Visual Studio 2013\Projects\SimpleIM\SimpleIM\Data\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [aspnet-SimpleIM-20160313083256];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_AspNetUserRoles_AspNetRoles]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_AspNetUserRoles_AspNetRoles];
GO
IF OBJECT_ID(N'[dbo].[FK_AspNetUserRoles_AspNetUsers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_AspNetUserRoles_AspNetUsers];
GO
IF OBJECT_ID(N'[dbo].[FK_LocationsEmployees]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EmployeeSet] DROP CONSTRAINT [FK_LocationsEmployees];
GO
IF OBJECT_ID(N'[dbo].[FK_EmployeesRooms]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EmployeeSet] DROP CONSTRAINT [FK_EmployeesRooms];
GO
IF OBJECT_ID(N'[dbo].[FK_LocationsRooms]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RoomSet] DROP CONSTRAINT [FK_LocationsRooms];
GO
IF OBJECT_ID(N'[dbo].[FK_CompaniesEmployees]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EmployeeSet] DROP CONSTRAINT [FK_CompaniesEmployees];
GO
IF OBJECT_ID(N'[dbo].[FK_DepartmentsEmployees]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EmployeeSet] DROP CONSTRAINT [FK_DepartmentsEmployees];
GO
IF OBJECT_ID(N'[dbo].[FK_EmployeeContactInformation]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ContactInformationSet] DROP CONSTRAINT [FK_EmployeeContactInformation];
GO
IF OBJECT_ID(N'[dbo].[FK_EmployeePosition]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EmployeeSet] DROP CONSTRAINT [FK_EmployeePosition];
GO
IF OBJECT_ID(N'[dbo].[FK_TaskEvent]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EventSet] DROP CONSTRAINT [FK_TaskEvent];
GO
IF OBJECT_ID(N'[dbo].[FK_InformationSystemTask]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TaskSet] DROP CONSTRAINT [FK_InformationSystemTask];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[C__MigrationHistory]', 'U') IS NOT NULL
    DROP TABLE [dbo].[C__MigrationHistory];
GO
IF OBJECT_ID(N'[dbo].[AspNetRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetRoles];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserClaims]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserClaims];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserLogins]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserLogins];
GO
IF OBJECT_ID(N'[dbo].[AspNetUsers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUsers];
GO
IF OBJECT_ID(N'[dbo].[DepartmentSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DepartmentSet];
GO
IF OBJECT_ID(N'[dbo].[EmployeeSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EmployeeSet];
GO
IF OBJECT_ID(N'[dbo].[ContactInformationSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ContactInformationSet];
GO
IF OBJECT_ID(N'[dbo].[LocationSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[LocationSet];
GO
IF OBJECT_ID(N'[dbo].[CompanySet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CompanySet];
GO
IF OBJECT_ID(N'[dbo].[RoomSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RoomSet];
GO
IF OBJECT_ID(N'[dbo].[TaskSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TaskSet];
GO
IF OBJECT_ID(N'[dbo].[InformationSystemSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[InformationSystemSet];
GO
IF OBJECT_ID(N'[dbo].[EventSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EventSet];
GO
IF OBJECT_ID(N'[dbo].[Positions]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Positions];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserRoles];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'C__MigrationHistory'
CREATE TABLE [dbo].[C__MigrationHistory] (
    [MigrationId] nvarchar(150)  NOT NULL,
    [ContextKey] nvarchar(300)  NOT NULL,
    [Model] varbinary(max)  NOT NULL,
    [ProductVersion] nvarchar(32)  NOT NULL
);
GO

-- Creating table 'AspNetRoles'
CREATE TABLE [dbo].[AspNetRoles] (
    [Id] nvarchar(128)  NOT NULL,
    [Name] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'AspNetUserClaims'
CREATE TABLE [dbo].[AspNetUserClaims] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] nvarchar(128)  NOT NULL,
    [ClaimType] nvarchar(max)  NULL,
    [ClaimValue] nvarchar(max)  NULL
);
GO

-- Creating table 'AspNetUserLogins'
CREATE TABLE [dbo].[AspNetUserLogins] (
    [LoginProvider] nvarchar(128)  NOT NULL,
    [ProviderKey] nvarchar(128)  NOT NULL,
    [UserId] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'AspNetUsers'
CREATE TABLE [dbo].[AspNetUsers] (
    [Id] nvarchar(128)  NOT NULL,
    [Email] nvarchar(256)  NULL,
    [EmailConfirmed] bit  NOT NULL,
    [PasswordHash] nvarchar(max)  NULL,
    [SecurityStamp] nvarchar(max)  NULL,
    [PhoneNumber] nvarchar(max)  NULL,
    [PhoneNumberConfirmed] bit  NOT NULL,
    [TwoFactorEnabled] bit  NOT NULL,
    [LockoutEndDateUtc] datetime  NULL,
    [LockoutEnabled] bit  NOT NULL,
    [AccessFailedCount] int  NOT NULL,
    [UserName] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'DepartmentSet'
CREATE TABLE [dbo].[DepartmentSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ParentId] int  NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'EmployeeSet'
CREATE TABLE [dbo].[EmployeeSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Image] tinyint  NULL,
    [FName] nvarchar(max)  NOT NULL,
    [SName] nvarchar(max)  NOT NULL,
    [SSName] nvarchar(max)  NOT NULL,
    [DateOfBirth] nvarchar(max)  NOT NULL,
    [Locations_Id] int  NOT NULL,
    [Rooms_Id] int  NULL,
    [Companies_Id] int  NULL,
    [Departments_Id] int  NULL,
    [Positions_Id] int  NULL
);
GO

-- Creating table 'ContactInformationSet'
CREATE TABLE [dbo].[ContactInformationSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Type] tinyint  NOT NULL,
    [Value] nvarchar(max)  NOT NULL,
    [Employee_Id] int  NULL
);
GO

-- Creating table 'LocationSet'
CREATE TABLE [dbo].[LocationSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'CompanySet'
CREATE TABLE [dbo].[CompanySet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'RoomSet'
CREATE TABLE [dbo].[RoomSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Locations_Id] int  NOT NULL
);
GO

-- Creating table 'TaskSet'
CREATE TABLE [dbo].[TaskSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [TaskType] tinyint  NOT NULL,
    [Source] tinyint  NOT NULL,
    [Data] nvarchar(max)  NOT NULL,
    [Destination_Id] int  NULL
);
GO

-- Creating table 'InformationSystemSet'
CREATE TABLE [dbo].[InformationSystemSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [ISType] nvarchar(max)  NOT NULL,
    [Address] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'EventSet'
CREATE TABLE [dbo].[EventSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [EventDateTime] datetime  NOT NULL,
    [TaskState] tinyint  NOT NULL,
    [Task_Id] int  NULL
);
GO

-- Creating table 'Positions'
CREATE TABLE [dbo].[Positions] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'AspNetUserRoles'
CREATE TABLE [dbo].[AspNetUserRoles] (
    [AspNetRoles_Id] nvarchar(128)  NOT NULL,
    [AspNetUsers_Id] nvarchar(128)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [MigrationId], [ContextKey] in table 'C__MigrationHistory'
ALTER TABLE [dbo].[C__MigrationHistory]
ADD CONSTRAINT [PK_C__MigrationHistory]
    PRIMARY KEY CLUSTERED ([MigrationId], [ContextKey] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetRoles'
ALTER TABLE [dbo].[AspNetRoles]
ADD CONSTRAINT [PK_AspNetRoles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [PK_AspNetUserClaims]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [LoginProvider], [ProviderKey], [UserId] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [PK_AspNetUserLogins]
    PRIMARY KEY CLUSTERED ([LoginProvider], [ProviderKey], [UserId] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUsers'
ALTER TABLE [dbo].[AspNetUsers]
ADD CONSTRAINT [PK_AspNetUsers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'DepartmentSet'
ALTER TABLE [dbo].[DepartmentSet]
ADD CONSTRAINT [PK_DepartmentSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'EmployeeSet'
ALTER TABLE [dbo].[EmployeeSet]
ADD CONSTRAINT [PK_EmployeeSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ContactInformationSet'
ALTER TABLE [dbo].[ContactInformationSet]
ADD CONSTRAINT [PK_ContactInformationSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'LocationSet'
ALTER TABLE [dbo].[LocationSet]
ADD CONSTRAINT [PK_LocationSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CompanySet'
ALTER TABLE [dbo].[CompanySet]
ADD CONSTRAINT [PK_CompanySet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'RoomSet'
ALTER TABLE [dbo].[RoomSet]
ADD CONSTRAINT [PK_RoomSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TaskSet'
ALTER TABLE [dbo].[TaskSet]
ADD CONSTRAINT [PK_TaskSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'InformationSystemSet'
ALTER TABLE [dbo].[InformationSystemSet]
ADD CONSTRAINT [PK_InformationSystemSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'EventSet'
ALTER TABLE [dbo].[EventSet]
ADD CONSTRAINT [PK_EventSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Positions'
ALTER TABLE [dbo].[Positions]
ADD CONSTRAINT [PK_Positions]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [AspNetRoles_Id], [AspNetUsers_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [PK_AspNetUserRoles]
    PRIMARY KEY CLUSTERED ([AspNetRoles_Id], [AspNetUsers_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UserId] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId'
CREATE INDEX [IX_FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]
ON [dbo].[AspNetUserClaims]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId'
CREATE INDEX [IX_FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
ON [dbo].[AspNetUserLogins]
    ([UserId]);
GO

-- Creating foreign key on [AspNetRoles_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetRoles]
    FOREIGN KEY ([AspNetRoles_Id])
    REFERENCES [dbo].[AspNetRoles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AspNetUsers_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetUsers]
    FOREIGN KEY ([AspNetUsers_Id])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRoles_AspNetUsers'
CREATE INDEX [IX_FK_AspNetUserRoles_AspNetUsers]
ON [dbo].[AspNetUserRoles]
    ([AspNetUsers_Id]);
GO

-- Creating foreign key on [Locations_Id] in table 'EmployeeSet'
ALTER TABLE [dbo].[EmployeeSet]
ADD CONSTRAINT [FK_LocationsEmployees]
    FOREIGN KEY ([Locations_Id])
    REFERENCES [dbo].[LocationSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LocationsEmployees'
CREATE INDEX [IX_FK_LocationsEmployees]
ON [dbo].[EmployeeSet]
    ([Locations_Id]);
GO

-- Creating foreign key on [Rooms_Id] in table 'EmployeeSet'
ALTER TABLE [dbo].[EmployeeSet]
ADD CONSTRAINT [FK_EmployeesRooms]
    FOREIGN KEY ([Rooms_Id])
    REFERENCES [dbo].[RoomSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmployeesRooms'
CREATE INDEX [IX_FK_EmployeesRooms]
ON [dbo].[EmployeeSet]
    ([Rooms_Id]);
GO

-- Creating foreign key on [Locations_Id] in table 'RoomSet'
ALTER TABLE [dbo].[RoomSet]
ADD CONSTRAINT [FK_LocationsRooms]
    FOREIGN KEY ([Locations_Id])
    REFERENCES [dbo].[LocationSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LocationsRooms'
CREATE INDEX [IX_FK_LocationsRooms]
ON [dbo].[RoomSet]
    ([Locations_Id]);
GO

-- Creating foreign key on [Companies_Id] in table 'EmployeeSet'
ALTER TABLE [dbo].[EmployeeSet]
ADD CONSTRAINT [FK_CompaniesEmployees]
    FOREIGN KEY ([Companies_Id])
    REFERENCES [dbo].[CompanySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CompaniesEmployees'
CREATE INDEX [IX_FK_CompaniesEmployees]
ON [dbo].[EmployeeSet]
    ([Companies_Id]);
GO

-- Creating foreign key on [Departments_Id] in table 'EmployeeSet'
ALTER TABLE [dbo].[EmployeeSet]
ADD CONSTRAINT [FK_DepartmentsEmployees]
    FOREIGN KEY ([Departments_Id])
    REFERENCES [dbo].[DepartmentSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DepartmentsEmployees'
CREATE INDEX [IX_FK_DepartmentsEmployees]
ON [dbo].[EmployeeSet]
    ([Departments_Id]);
GO

-- Creating foreign key on [Employee_Id] in table 'ContactInformationSet'
ALTER TABLE [dbo].[ContactInformationSet]
ADD CONSTRAINT [FK_EmployeeContactInformation]
    FOREIGN KEY ([Employee_Id])
    REFERENCES [dbo].[EmployeeSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmployeeContactInformation'
CREATE INDEX [IX_FK_EmployeeContactInformation]
ON [dbo].[ContactInformationSet]
    ([Employee_Id]);
GO

-- Creating foreign key on [Positions_Id] in table 'EmployeeSet'
ALTER TABLE [dbo].[EmployeeSet]
ADD CONSTRAINT [FK_EmployeePosition]
    FOREIGN KEY ([Positions_Id])
    REFERENCES [dbo].[Positions]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmployeePosition'
CREATE INDEX [IX_FK_EmployeePosition]
ON [dbo].[EmployeeSet]
    ([Positions_Id]);
GO

-- Creating foreign key on [Task_Id] in table 'EventSet'
ALTER TABLE [dbo].[EventSet]
ADD CONSTRAINT [FK_TaskEvent]
    FOREIGN KEY ([Task_Id])
    REFERENCES [dbo].[TaskSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TaskEvent'
CREATE INDEX [IX_FK_TaskEvent]
ON [dbo].[EventSet]
    ([Task_Id]);
GO

-- Creating foreign key on [Destination_Id] in table 'TaskSet'
ALTER TABLE [dbo].[TaskSet]
ADD CONSTRAINT [FK_InformationSystemTask]
    FOREIGN KEY ([Destination_Id])
    REFERENCES [dbo].[InformationSystemSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_InformationSystemTask'
CREATE INDEX [IX_FK_InformationSystemTask]
ON [dbo].[TaskSet]
    ([Destination_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------