-- Create database
create database Project2_DBI202x
go

-- Use this database
use Project2_DBI202x
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
    [Views]       int,
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

-- insert new account into Account table
insert into [Account] ([Username], [Email], [Password])
values ('tinynguyen', 'datncfx00499@funix.edu.vn', '123456')
insert into [Account] ([Username], [Email], [Password])
values ('akichan', 'akichan@gmail.com', '123456')
insert into [Account] ([Username], [Email], [Password])
values ('teddy', 'teddy@gmail.com', '123456')
insert into [Account] ([Username], [Email], [Password])
values ('vespa', 'vespa@gmail.com', '123456')
insert into [Account] ([Username], [Email], [Password])
values ('liberty', 'liberty@gmail.com', '123456')
insert into [Account] ([Username], [Email], [Password])
values ('mercedes', 'mercedes@gmail.com', '123456')
insert into [Account] ([Username], [Email], [Password])
values ('taylor-swift', 'taylor-swift@gmail.com', '123456')
go

-- insert new channel into Channel table
insert into [Channel]
    ([Name], [Description], [Username])
values ('Sport News', 'Sport News Channel is the best analysis, debates and highlights about football.', 'teddy')
insert into [Channel] ([Name], [Description], [Username])
values ('Taylor Swift Official', 'The Official Taylor Swift YouTube Channel.', 'teddy')
insert into [Channel] ([Name], [Description], [Username])
values ('Code Tutorials',
        'I make free programming tutorials includes Java for beginner, JavaScript, NodeJS, React...',
        'tinynguyen')
insert into [Channel] ([Name], [Description], [Username])
values ('Akichan.com',
        'Learn Japanese with Akichan.com - The Fastest, Easiest and Most Fun Way to Learn Japanese. :)',
        'akichan')
insert into [Channel] ([Name], [Description], [Username])
values ('Piaggio Official', 'PIAGGIO is synonymous with freedom in everyday life.', 'vespa')
insert into [Channel] ([Name], [Description], [Username])
values ('Mercedes-Benz', 'Welcome to the official Web TV channel of Mercedes-Benz.', 'mercedes')
insert into [Channel] ([Name], [Description], [Username])
values ('Liberty University',
        'This is the official Liberty University YouTube channel featuring speakers from around the world and our beautiful campus located in Lynchburg, Virginia.',
        'liberty')
go

-- insert new videos into Video table
-- insert video into Sport News channel
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('Will Neymar really return to Barcelona?! | Good Morning Transfers',
        'The Good Morning Transfers panel discuss Marko Arnautovic handing in another transfer request, Pablo Fornals'' arrival at West Ham and how likely Neymar is to return to FC Barcelona.',
        100282,
        '2019-07-04 16:30:00', 1)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('Will Bruno Fernandez sign for Man United? | Good Morning Transfers',
        'The Good Morning Transfers panel discuss Bruno Fernandez''s rumoured move to Manchester United and whether the club will hang on to David de Gea',
        61167,
        '2019-07-04 17:30:00', 1)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('Do Liverpool need to strengthen to challenge for the Premier League? | Good Morning Transfers',
        'This morning the panel discuss Frank Lampard use of young players, Eden Hazard transfer to Real Madrid and whether Liverpool need to strengthen their squad to challenge for the Premier League title',
        151649,
        '2019-07-01 16:30:00', 1)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('Pochettino on Champions League Final defeat to Liverpool and his future at Spurs!',
        'Spurs boss Mauricio Pochettino gives his thoughts on his team 2-0 defeat to Liverpool in the Champions League final and responds to speculation about his future as manager of Tottenham.',
        334488,
        '2019-06-02 12:19:00', 1)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('EXCLUSIVE: Christian Pulisic first interview since arriving at Chelsea',
        'Christian Pulisic speaks exclusively to Sky Sports after arriving at Chelsea from his loan at Borussia Dormund.',
        480915,
        '2019-05-22 09:45:00', 1)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('Manchester City lift the Premier League trophy after winning the 2018/19!',
        'Man City lift the Premier League trophy for the 4th time after their victory over Brighton saw them clinch the title!',
        1312568,
        '2019-05-12 10:12:00', 1)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('LIVE! FIFA eNations Cup | Day 2, Knockout Stages & Finals!',
        'Join Spencer FC and Adam Smith for live coverage of the final day of the first ever FIFA eNations Cup in London as gamers representing all 20 countries go head to head to be crowned eNations Cup champions!',
        118552,
        '2019-04-14 23:12:00', 1)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('Lucas Moura reviews Tottenham Champions League win over Man City & hat trick against Huddersfield!🏆',
        'Lucas Moura looks back Tottenham victory over Man City in the Champions League, and on his hat-trick against Huddersfield in Tottenham 4-0 win at their new stadium',
        15971,
        '2019-04-20 18:36:00', 1)

-- insert video into Taylor Swift channel
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('Shake It Off',
        'Music video by Taylor Swift performing Shake It Off. (C) 2014 Big Machine Records, LLC.',
        2794983158,
        '2014-08-19 20:15:00', 2)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('Bad Blood',
        'New single ME! (feat. Brendon Urie of Panic! At The Disco) available now.',
        1297659157,
        '2015-05-17 19:00:00', 2)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('Blank Space',
        'New single ME! (feat. Brendon Urie of Panic! At The Disco) available now.',
        2465233229,
        '2014-11-11 17:30:00', 2)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('Look What You Made Me Do',
        'New single ME! (feat. Brendon Urie of Panic! At The Disco) available now.',
        1064852456,
        '2014-08-27 20:30:00', 2)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('Wildest Dreams',
        'New single ME! (feat. Brendon Urie of Panic! At The Disco) available now.',
        659579963,
        '2014-11-11 16:30:00', 2)

-- insert video into Code Tutorials channel
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('What is React?',
        'What is React? This video explains it in 5 Minutes!',
        63309,
        '2018-06-27 18:36:00', 3)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('React vs Angular vs Vue: What to Choose for Your Next Project',
        'React vs Angular vs Vue:  What is the best JavaScript framework in 2019? This video answers your questions.',
        30637,
        '2018-05-10 09:22:00', 3)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('What is Node.js?',
        'What is Node.js? This short video makes it really simple.',
        144896,
        '2018-01-24 13:56:00', 3)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('Installing Node.js',
        'Install Node.js very simple in 10 Minutes',
        23636,
        '2018-02-02 10:41:00', 3)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('Modules in Node.js',
        'Modules in Node.js',
        18455,
        '2018-02-07 11:00:00', 3)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('JavaScript Tutorial for Beginners',
        'Watch this JavaScript tutorial for beginners to learn JavaScript basics in one hour.',
        944246,
        '2018-04-24 19:00:00', 3)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('JavaScript for React Developers',
        'Master the Essential JavaScript Features for Building React Apps.',
        118040,
        '2018-06-30 20:00:00', 3)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('Learn C# Basics in 1 Hour',
        'This C# tutorial for beginners helps you learn C# programming from scratch. Watch this C# for beginners tutorial and get started!',
        1583060,
        '2018-04-03 14:15:00', 3)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('Debugging C# Code in Visual Studio',
        'Learn to use debugging tools in Visual Studio to effectively debug your C# applications.',
        127546,
        '2018-09-16 16:36:00', 3)

-- insert video into Akichan.com channel
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('Japanese Children''s Song - 童謡 - Shabondama - シャボン玉',
        'Shabondama (シャボン玉, lit. "Soap Bubbles") is a Japanese nursery rhyme written by Ujō Noguchi in 1922. It is widely taught in Japanese nursery schools and kindergartens as a simple melody',
        9252,
        '2018-06-26 15:48:00', 4)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('Learn ALL Hiragana in 2 Minutes (Japanese Alphabet) | Read and Write Japanese',
        'You can learn Hiragana, one of the Japanese alphabet, in 2 minutes!',
        11258,
        '2018-06-21 18:05:00', 4)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('Want to Learn Japanese Anywhere, Anytime on Your Mobile and For FREE?',
        'https://bit.ly/2QelqJB ← Click here to download the App for FREE and learn Japanese anywhere on your mobile device!',
        6589,
        '2018-05-31 09:15:00', 4)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('Japanese Children''s Song - 童謡 - Koinobori - こいのぼり',
        'Koinobori (鯉のぼり), meaning "carp streamer" in Japanese, are carp-shaped windsocks traditionally flown in Japan to celebrate Tango no sekku (端午の節句), a traditional event which is now designated a national holiday; Children''s Day (Kodomo no Hi, 子供の日)',
        29613,
        '2018-05-01 11:35:00', 4)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('100 Adjectives Every Japanese Beginner Must-Know',
        'This is the best video to get started with Japanese language',
        30076,
        '2018-04-09 19:55:00', 4)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('5 Tips to Jump in from Beginner to Intermediate Level',
        'With this video, you''ll learn five tips to jump in from beginner to intermediate level.',
        9815,
        '2018-01-29 15:22:00', 4)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('4 Reasons Why You Should Learn Japanese Everyday',
        'With this video, you''ll learn the 4 reasons why you should learn Japanese everyday. Learning a language on a daily basis makes a whole difference.',
        8960,
        '2018-01-29 15:22:00', 4)

-- insert video into Piaggio Offical channel
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('Piaggio Wi-Bike',
        'Tech, cool, green: you don’t need to choose with Piaggio Wi-Bike!',
        15008,
        '2016-07-19 18:27:00', 5)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('Piaggio: Move Beautifully - Traffic',
        'Sometimes a little bit of traffic is a pleasure... when you''re navigating with your Medley at least. Start the day off carefree.',
        4835,
        '2016-05-29 14:39:00', 5)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('Piaggio Medley', 'Piaggio Medley: bye-bye monotony!',
        11825,
        '2016-05-03 17:00:00', 5)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('Piaggio Beverly - Ordinary Special', 'PIAGGIO BEVERLY. PERFORMANCE FOR YOUR EVERYDAY COMMUTE.',
        1431,
        '2018-10-30 18:15:00', 5)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('Piaggio: Move Beautifully - Fog',
        'Whichever the weather conditions, light the way and drive off comfortably with your Piaggio Liberty.',
        3720,
        '2016-05-26 14:19:00', 5)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('E-Bike Piaggio at @Eicma 2014', 'Electric Bike by Piaggio: connected to the world.',
        48943,
        '2014-11-04 13:25:00', 5)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('Piaggio Multimedia Platform',
        'Track, analyze and share your ride with Piaggio web community! www.multimediaplatform.piaggio.com.',
        57121,
        '2014-05-13 21:56:00', 5)

-- insert video into Mercedes-Benz channel
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('Mercedes-Benz GLB (2020): World Premiere',
        'The all-new Mercedes-Benz GLB (2020) is a versatile SUV. And a spacious family car: on request it is the first Mercedes-Benz in this segment available as a seven-seater.',
        146829,
        '2019-06-11 08:45:00', 6)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('Mercedes-Benz Experimental Safety Vehicle (ESF) 2019',
        'Over 30 Mercedes-Benz Experimental Safety Vehicles have been built for the research of automobile safety systems. The ESF 2019 is a continuation of this series',
        14756,
        '2019-06-06 10:00:00', 6)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('Mercedes-Benz Marco Polo (2019) with Nick Fouquet',
        'Nick Fouquet has run away to find himself. Make your Move. With the new Mercedes-Benz Marco Polo (2019)',
        13050,
        '2019-06-07 11:15:00', 6)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('Mercedes-Benz: A Star With a Thousand Facets',
        'Over 1 million subscribers on YouTube: you’re unbelievable! From A-Class to X-Class, from classics to concept cars: you are always the first to see “the best or nothing”.',
        88779,
        '2019-05-31 07:22:00', 6)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('Mercedes-Benz G-Class (2019): 40 Years G-Class',
        'Over 1 million subscribers on YouTube: you’re unbelievable! From A-Class to X-Class, from classics to concept cars: you are always the first to see “the best or nothing”.',
        41118,
        '2019-05-02 15:33:00', 6)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('Mercedes-Benz Sprinter (2019): Safety Features',
        'Flexible, reliable and above all, safe: The new Mercedes-Benz Sprinter (2019) embodies all these attributes to perfection.',
        20911,
        '2019-06-23 18:55:00', 6)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('Mercedes-Benz EQC (2019): Pure Driving Pleasure',
        '[EQC 400 4MATIC: Stromverbrauch kombiniert: 20,8–19,7 kWh/100 km; CO₂-Emissionen kombiniert: 0 g/km.*]',
        14859,
        '2019-06-24 13:11:00', 6)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('Mercedes-Benz G-Class: The Amber Cube on Tour',
        '[EQC 400 4MATIC: Stromverbrauch kombiniert: 20,8–19,7 kWh/100 km; CO₂-Emissionen kombiniert: 0 g/km.*]',
        9107,
        '2019-06-29 16:42:00', 6)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('Mercedes-AMG CLA 45 S 4MATIC+ Coupé (2020): World Premiere',
        '[Kraftstoffverbrauch kombiniert: 8,3–8,1 l/100 km; CO₂-Emissionen kombiniert: 189–186 g/km.*]  The new Mercedes-AMG CLA 45 S 4MATIC+ Coupé (2020) compact sports car reasserts its leading position in its segment.',
        56598,
        '2019-07-04 09:16:00', 6)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('Mercedes-Benz Service and Genuine Parts: Original Tyres',
        '[S 560 e: Kraftstoffverbrauch kombiniert: 2,6–2,5 l/100 km; CO₂-Emissionen kombiniert: 59–57 g/km; Stromverbrauch im kombinierten Testzyklus: 20,3–20,0 kWh/100 km.*]',
        4305,
        '2019-07-05 20:44:00', 6)

-- insert video into Liberty University channel
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('Travis Greene - Liberty University Convocation',
        'On April 12, 2019, at Convocation, North America’s largest weekly gathering of Christian students, Grammy-nominated artist Travis Greene,  lead worship and encouraged students to praise God in the highs and in the lows',
        2931,
        '2019-04-18 12:23:00', 6)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('Liberty University Commencement 2019 - Vice President Mike Pence',
        'Vice President Mike Pence addressed the graduating class of Liberty University.',
        34766,
        '2019-05-12 15:52:00', 6)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('Benevolent - Spring Coffeehouse 2019', 'Benevolent - Spring Coffeehouse 2019',
        563,
        '2019-05-14 20:19:00', 6)
insert into [Video] ([Title], [Description], [Views], [Date_Upload], [ChannelId])
values ('Baccalaureate 2019 - Dr. Jerry Vines',
        'During Liberty University’s annual Baccalaureate Service, Dr. Jerry Vines, pastor of First Baptist Church of Jacksonville, Fla.',
        771,
        '2019-06-01 15:15:00', 6)
go
