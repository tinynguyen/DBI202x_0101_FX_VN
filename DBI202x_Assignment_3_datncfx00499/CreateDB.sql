-- Create database
create database Project3_DBI202x
go

-- Use this database
use Project3_DBI202x
go

-- create Account table
if not exists(
        select [name]
        from sys.tables
        where [name] = 'Account'
    )
create table [Account]
(
    [Username] varchar(30) not null,
    [Email]    varchar(50) not null,
    [Password] varchar(32) not null,
    constraint Acc_Username primary key (Username)
)
go

-- create Channel table
if not exists(
        select [name]
        from sys.tables
        where [name] = 'Channel'
    )
create table [Channel]
(
    [ChannelId]   int         not null identity (1,1),
    [Name]        varchar(30) not null,
    [Description] varchar(255),
    [Username]    varchar(30) not null,
    constraint Unique_Name_Video unique (Name),
    constraint PK_ChannelId primary key (ChannelId),
    constraint FK_Username foreign key (Username) references Account (Username)
)
go

-- create Video table
if not exists(
        select [name]
        from sys.tables
        where [name] = 'Video'
    )
create table [Video]
(
    [VideoId]     int          not null identity (1,1),
    [Title]       varchar(255) not null,
    [Description] varchar(255),
    [Views]       bigint,
    [Date_Upload] datetime,
    [ChannelId]   int          not null,
    constraint PK_VideoId primary key (VideoId),
    constraint FK_ChannelId foreign key (ChannelId) references Channel (ChannelId)
)
go

-- create Category table
if not exists(
        select [name]
        from sys.tables
        where [name] = 'Category'
    )
create table [Category]
(
    [CategoryId]  int         not null identity (1,1),
    [Name]        varchar(30) not null,
    [Description] varchar(255),
    constraint Unique_Name_Category unique (Name),
    constraint PK_CategoryId primary key (CategoryId)
)
go

-- create Comment table
if not exists(
        select [name]
        from sys.tables
        where [name] = 'Comment'
    )
create table [Comment]
(
    [CommentId]   int         not null identity (1,1),
    [Content]     varchar(MAX),
    [Date_create] datetime,
    [Username]    varchar(30) not null,
    [VideoId]     int         not null,
    constraint PK_CommentId primary key (CommentId),
    constraint FK_Username_Comment foreign key (Username) references Account (Username),
    constraint FK_VideoId_Comment foreign key (VideoId) references Video (VideoId)
)
go

-- create Subscribe table
if not exists(
        select [name]
        from sys.tables
        where [name] = 'Subscribe'
    )
create table [Subscribe]
(
    [Username]   varchar(30) not null,
    [ChannelId]  int         not null,
    [Subscribed] int,
    constraint FK_Username_Subscribe foreign key (Username) references Account (Username),
    constraint FK_ChannelId_Subscribe foreign key (ChannelId) references Channel (ChannelId)
)
go

-- create Video_Category table
if not exists(
        select [name]
        from sys.tables
        where [name] = 'Video_Category'
    )
create table [Video_Category]
(
    [VideoId]    int not null,
    [CategoryId] int not null,
    constraint FK_VideoId_Category foreign key (VideoId) references Video (VideoId),
    constraint FK_CategoryId_Video foreign key (CategoryId) references Category (CategoryId)
)
go
