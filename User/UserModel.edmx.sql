
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 02/02/2017 19:30:16
-- Generated from EDMX file: c:\users\admin\documents\visual studio 2015\Projects\CartagenaGame\User\UserModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [CartagenaDatabase];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_ProfileAccount]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProfileSet] DROP CONSTRAINT [FK_ProfileAccount];
GO
IF OBJECT_ID(N'[dbo].[FK_AccountAccountStatistic]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AccountSet] DROP CONSTRAINT [FK_AccountAccountStatistic];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[AccountSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AccountSet];
GO
IF OBJECT_ID(N'[dbo].[ProfileSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProfileSet];
GO
IF OBJECT_ID(N'[dbo].[AccountStatisticSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AccountStatisticSet];
GO
IF OBJECT_ID(N'[dbo].[NotificationSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[NotificationSet];
GO
IF OBJECT_ID(N'[dbo].[ReportSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ReportSet];
GO
IF OBJECT_ID(N'[dbo].[FriendListSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FriendListSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'AccountSet'
CREATE TABLE [dbo].[AccountSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Username] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [LockedUntil] datetime  NOT NULL,
    [IsPremium] bit  NOT NULL,
    [IsInactive] bit  NOT NULL,
    [NotificationSettings] nvarchar(max)  NOT NULL,
    [AccountStatistic_Id] int  NOT NULL
);
GO

-- Creating table 'ProfileSet'
CREATE TABLE [dbo].[ProfileSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [DisplayName] nvarchar(max)  NOT NULL,
    [RankScore] int  NOT NULL,
    [PlayStyle] nvarchar(max)  NOT NULL,
    [Class] nvarchar(max)  NOT NULL,
    [Account_Id] int  NOT NULL
);
GO

-- Creating table 'AccountStatisticSet'
CREATE TABLE [dbo].[AccountStatisticSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [TimeOnline] int  NOT NULL,
    [GewonnenGames] int  NOT NULL,
    [TimeLoggedIn] datetime  NOT NULL
);
GO

-- Creating table 'NotificationSet'
CREATE TABLE [dbo].[NotificationSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Content] nvarchar(max)  NOT NULL,
    [ShowNotification] bit  NOT NULL
);
GO

-- Creating table 'ReportSet'
CREATE TABLE [dbo].[ReportSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Type] nvarchar(max)  NOT NULL,
    [Reason] nvarchar(max)  NOT NULL,
    [ReportedUserId] nvarchar(max)  NOT NULL,
    [ReportingUserId] nvarchar(max)  NOT NULL,
    [MessageId] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'FriendListSet'
CREATE TABLE [dbo].[FriendListSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [AccountIdOne] smallint  NOT NULL,
    [AccountIdTwo] smallint  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'AccountSet'
ALTER TABLE [dbo].[AccountSet]
ADD CONSTRAINT [PK_AccountSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ProfileSet'
ALTER TABLE [dbo].[ProfileSet]
ADD CONSTRAINT [PK_ProfileSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AccountStatisticSet'
ALTER TABLE [dbo].[AccountStatisticSet]
ADD CONSTRAINT [PK_AccountStatisticSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'NotificationSet'
ALTER TABLE [dbo].[NotificationSet]
ADD CONSTRAINT [PK_NotificationSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ReportSet'
ALTER TABLE [dbo].[ReportSet]
ADD CONSTRAINT [PK_ReportSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'FriendListSet'
ALTER TABLE [dbo].[FriendListSet]
ADD CONSTRAINT [PK_FriendListSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Account_Id] in table 'ProfileSet'
ALTER TABLE [dbo].[ProfileSet]
ADD CONSTRAINT [FK_ProfileAccount]
    FOREIGN KEY ([Account_Id])
    REFERENCES [dbo].[AccountSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProfileAccount'
CREATE INDEX [IX_FK_ProfileAccount]
ON [dbo].[ProfileSet]
    ([Account_Id]);
GO

-- Creating foreign key on [AccountStatistic_Id] in table 'AccountSet'
ALTER TABLE [dbo].[AccountSet]
ADD CONSTRAINT [FK_AccountAccountStatistic]
    FOREIGN KEY ([AccountStatistic_Id])
    REFERENCES [dbo].[AccountStatisticSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AccountAccountStatistic'
CREATE INDEX [IX_FK_AccountAccountStatistic]
ON [dbo].[AccountSet]
    ([AccountStatistic_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------