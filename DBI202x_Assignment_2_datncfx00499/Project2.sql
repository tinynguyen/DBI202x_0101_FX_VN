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
    [Views] INT,
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
    [CommentId] INT NOT NULL IDENTITY(1,1),
    [Content] VARCHAR(MAX),
    [Date_Create] DATETIME,
    [Username] VARCHAR(30) NOT NULL,
    [VideoId] INT NOT NULL,
    CONSTRAINT PK_CommentId PRIMARY KEY (CommentId),
    CONSTRAINT FK_Username_Comment FOREIGN KEY (Username) REFERENCES Account(Username),
    CONSTRAINT FK_VideoId_Comment FOREIGN KEY (VideoId) REFERENCES Video(VideoId)
)
GO
IF NOT EXISTS (
    SELECT [name] FROM sys.tables WHERE [name] = 'Subscribe'
)
CREATE TABLE [Subscribe] (
    [Username] VARCHAR(30) NOT NULL,
    [ChannelId] INT NOT NULL,
    [Subscribed] INT,
    CONSTRAINT FK_Username_Subscribe FOREIGN KEY (Username) REFERENCES Account(Username),
    CONSTRAINT FK_ChannelId_Subscribe FOREIGN KEY (ChannelId) REFERENCES Channel(ChannelId)
)
GO
IF NOT EXISTS (
    SELECT [name] FROM sys.tables WHERE [name] = 'Video_Category'
)
CREATE TABLE [Video_Category] (
    [VideoId] INT NOT NULL,
    [CategoryId] INT NOT NULL,
    CONSTRAINT FK_VideoId_Category FOREIGN KEY (VideoId) REFERENCES Video(VideoId),
    CONSTRAINT FK_CategoryId_Video FOREIGN KEY (CategoryId) REFERENCES Category(CategoryId)
)
GO
INSERT INTO [Account] ([Username], [Email], [Password]) VALUES ('tinynguyen', 'datncfx00499@funix.edu.vn', '123456')
INSERT INTO [Account] ([Username], [Email], [Password]) VALUES ('akichan', 'akichan@gmail.com', '123456')
INSERT INTO [Account] ([Username], [Email], [Password]) VALUES ('teddy', 'teddy@gmail.com', '123456')
INSERT INTO [Account] ([Username], [Email], [Password]) VALUES ('vespa', 'vespa@gmail.com', '123456')
INSERT INTO [Account] ([Username], [Email], [Password]) VALUES ('liberty', 'liberty@gmail.com', '123456')
INSERT INTO [Account] ([Username], [Email], [Password]) VALUES ('mercedes', 'mercedes@gmail.com', '123456')
INSERT INTO [Account] ([Username], [Email], [Password]) VALUES ('taylor-swift', 'taylor-swift@gmail.com', '123456')
GO
INSERT INTO [Channel] ([Name], [Description], [Username]) VALUES ('Sport News', 'Sport News Channel is the best analysis, debates and highlights about football.', 'teddy')
INSERT INTO [Channel] ([Name], [Description], [Username]) VALUES ('Taylor Swift Official', 'The Official Taylor Swift YouTube Channel.', 'teddy')
INSERT INTO [Channel] ([Name], [Description], [Username]) VALUES ('Code Tutorials', 'I make free programming tutorials includes Java for beginner, JavaScript, NodeJS, React...', 'tinynguyen')
INSERT INTO [Channel] ([Name], [Description], [Username]) VALUES ('Akichan.com', 'Learn Japanese with Akichan.com - The Fastest, Easiest and Most Fun Way to Learn Japanese. :)', 'akichan')
INSERT INTO [Channel] ([Name], [Description], [Username]) VALUES ('Piaggio Official', 'PIAGGIO is synonymous with freedom in everyday life.', 'vespa')
INSERT INTO [Channel] ([Name], [Description], [Username]) VALUES ('Mercedes-Benz', 'Welcome to the official Web TV channel of Mercedes-Benz.', 'mercedes')
INSERT INTO [Channel] ([Name], [Description], [Username]) VALUES ('Liberty University', 'This is the official Liberty University YouTube channel featuring speakers from around the world and our beautiful campus located in Lynchburg, Virginia.', 'liberty')
GO