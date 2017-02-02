
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 02/02/2017 19:03:30
-- Generated from EDMX file: c:\users\admin\documents\visual studio 2015\Projects\CartagenaGame\CartagenaGame\CartagenaGameModel.edmx
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


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'GameSet'
CREATE TABLE [dbo].[GameSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Type] nvarchar(max)  NOT NULL,
    [StartDateTime] datetime  NOT NULL
);
GO

-- Creating table 'GameResultSet'
CREATE TABLE [dbo].[GameResultSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [WinnerPlayerId] int  NOT NULL,
    [FinishedDateTime] datetime  NOT NULL,
    [Game_Id] int  NOT NULL
);
GO

-- Creating table 'PlayerSet'
CREATE TABLE [dbo].[PlayerSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [PlayerName] nvarchar(max)  NOT NULL,
    [OffenseCount] int  NOT NULL,
    [Ip] nvarchar(max)  NOT NULL,
    [PlayCount] int  NOT NULL,
    [WinCount] int  NOT NULL,
    [BannedUntil] datetime  NOT NULL
);
GO

-- Creating table 'MoveSet'
CREATE TABLE [dbo].[MoveSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CardType] int  NOT NULL,
    [ActionType] nvarchar(max)  NOT NULL,
    [MovedPawn] int  NOT NULL,
    [PawnLocation] int  NOT NULL,
    [Player_Id] int  NOT NULL,
    [Game_Id] int  NOT NULL
);
GO

-- Creating table 'AchievementSet'
CREATE TABLE [dbo].[AchievementSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Requirements] int  NOT NULL,
    [Type] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'AchievedSet'
CREATE TABLE [dbo].[AchievedSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Achievement_Id] int  NOT NULL,
    [Player_Id] int  NOT NULL
);
GO

-- Creating table 'PlayerGame'
CREATE TABLE [dbo].[PlayerGame] (
    [Player_Id] int  NOT NULL,
    [Game_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'GameSet'
ALTER TABLE [dbo].[GameSet]
ADD CONSTRAINT [PK_GameSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'GameResultSet'
ALTER TABLE [dbo].[GameResultSet]
ADD CONSTRAINT [PK_GameResultSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PlayerSet'
ALTER TABLE [dbo].[PlayerSet]
ADD CONSTRAINT [PK_PlayerSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'MoveSet'
ALTER TABLE [dbo].[MoveSet]
ADD CONSTRAINT [PK_MoveSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AchievementSet'
ALTER TABLE [dbo].[AchievementSet]
ADD CONSTRAINT [PK_AchievementSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AchievedSet'
ALTER TABLE [dbo].[AchievedSet]
ADD CONSTRAINT [PK_AchievedSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Player_Id], [Game_Id] in table 'PlayerGame'
ALTER TABLE [dbo].[PlayerGame]
ADD CONSTRAINT [PK_PlayerGame]
    PRIMARY KEY CLUSTERED ([Player_Id], [Game_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Game_Id] in table 'GameResultSet'
ALTER TABLE [dbo].[GameResultSet]
ADD CONSTRAINT [FK_GameGameResult]
    FOREIGN KEY ([Game_Id])
    REFERENCES [dbo].[GameSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_GameGameResult'
CREATE INDEX [IX_FK_GameGameResult]
ON [dbo].[GameResultSet]
    ([Game_Id]);
GO

-- Creating foreign key on [Achievement_Id] in table 'AchievedSet'
ALTER TABLE [dbo].[AchievedSet]
ADD CONSTRAINT [FK_AchievementAchieved]
    FOREIGN KEY ([Achievement_Id])
    REFERENCES [dbo].[AchievementSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AchievementAchieved'
CREATE INDEX [IX_FK_AchievementAchieved]
ON [dbo].[AchievedSet]
    ([Achievement_Id]);
GO

-- Creating foreign key on [Player_Id] in table 'AchievedSet'
ALTER TABLE [dbo].[AchievedSet]
ADD CONSTRAINT [FK_AchievedPlayer]
    FOREIGN KEY ([Player_Id])
    REFERENCES [dbo].[PlayerSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AchievedPlayer'
CREATE INDEX [IX_FK_AchievedPlayer]
ON [dbo].[AchievedSet]
    ([Player_Id]);
GO

-- Creating foreign key on [Player_Id] in table 'MoveSet'
ALTER TABLE [dbo].[MoveSet]
ADD CONSTRAINT [FK_MovePlayer]
    FOREIGN KEY ([Player_Id])
    REFERENCES [dbo].[PlayerSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MovePlayer'
CREATE INDEX [IX_FK_MovePlayer]
ON [dbo].[MoveSet]
    ([Player_Id]);
GO

-- Creating foreign key on [Player_Id] in table 'PlayerGame'
ALTER TABLE [dbo].[PlayerGame]
ADD CONSTRAINT [FK_PlayerGame_Player]
    FOREIGN KEY ([Player_Id])
    REFERENCES [dbo].[PlayerSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Game_Id] in table 'PlayerGame'
ALTER TABLE [dbo].[PlayerGame]
ADD CONSTRAINT [FK_PlayerGame_Game]
    FOREIGN KEY ([Game_Id])
    REFERENCES [dbo].[GameSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PlayerGame_Game'
CREATE INDEX [IX_FK_PlayerGame_Game]
ON [dbo].[PlayerGame]
    ([Game_Id]);
GO

-- Creating foreign key on [Game_Id] in table 'MoveSet'
ALTER TABLE [dbo].[MoveSet]
ADD CONSTRAINT [FK_MoveGame]
    FOREIGN KEY ([Game_Id])
    REFERENCES [dbo].[GameSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MoveGame'
CREATE INDEX [IX_FK_MoveGame]
ON [dbo].[MoveSet]
    ([Game_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------