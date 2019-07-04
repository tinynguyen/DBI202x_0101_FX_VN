CREATE DATABASE Project2_DBI202x
GO
USE Project2_DBI202x
GO
IF NOT EXISTS (
    SELECT [name] FROM sys.tables WHERE [name] = 'Account'
)
CREATE TABLE [Account] (
    [Username] VARCHAR(30) NOT NULL,
    [Email] VARCHAR(50) NOT NULL,
    [Password] VARCHAR(32) NOT NULL,
    CONSTRAINT Acc_Username PRIMARY KEY (Username)
)
GO
IF NOT EXISTS (
    SELECT [name] FROM sys.tables WHERE [name] = 'Channel'
)
CREATE TABLE [Channel] (
    [ChannelId] INT NOT NULL IDENTITY(1,1),
    [Name] VARCHAR(30) NOT NULL,
    [Description] VARCHAR(255),
    [Username] VARCHAR(30) NOT NULL,
    CONSTRAINT PK_ChannelId PRIMARY KEY (ChannelId),
    CONSTRAINT FK_Username FOREIGN KEY (Username) REFERENCES Account(Username)
)
GO
IF NOT EXISTS (
    SELECT [name] FROM sys.tables WHERE [name] = 'Video'
)
CREATE TABLE [Video] (
    [VideoId] INT NOT NULL IDENTITY(1,1),
    [Title] VARCHAR(255) NOT NULL,
    [Description] VARCHAR(255),
    [Views] INT
    [Date_Upload] DATETIME,
    [ChannelId] INT NOT NULL,
    CONSTRAINT PK_VideoId PRIMARY KEY (VideoId),
    CONSTRAINT FK_ChannelId FOREIGN KEY (ChannelId) REFERENCES Channel(ChannelId)
)
GO
IF NOT EXISTS (
    SELECT [name] FROM sys.tables WHERE [name] = 'Category'
)
CREATE TABLE [Category] (
    [CategoryId] INT NOT NULL IDENTITY(1,1),
    [Name] VARCHAR(30) NOT NULL,
    [Description] VARCHAR(255),
    CONSTRAINT PK_CategoryId PRIMARY KEY (CategoryId)
)
GO
IF NOT EXISTS (
    SELECT [name] FROM sys.tables WHERE [name] = 'Comment'
)
CREATE TABLE [Comment] (
    CommentId INT NOT NULL IDENTITY(1,1),
    Content VARCHAR(MAX),
    Date_Create DATETIME,
    Username VARCHAR(30) NOT NULL,
    VideoId INT NOT NULL
    CONSTRAINT PK_CommentId PRIMARY KEY (CommentId),
    CONSTRAINT FK_Username FOREIGN KEY (Username) REFERENCES Account(Username),
    CONSTRAINT FK_VideoId FOREIGN KEY (VideoId) REFERENCES Video(VideoId)
)
GO
IF NOT EXISTS (
    SELECT [name] FROM sys.tables WHERE [name] = 'Subcribe'
)
CREATE TABLE [Subcribe] (
    Username VARCHAR(30) NOT NULL,
    ChannelId INT NOT NULL,
    Subcribed INT,
    CONSTRAINT FK_Username FOREIGN KEY (Username) REFERENCES Account(Username),
    CONSTRAINT FK_ChannelId FOREIGN KEY (ChannelId) REFERENCES Channel(ChannelId)
)
GO