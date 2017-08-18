DROP TABLE IF EXISTS mentions;
DROP TABLE IF EXISTS hashtags;
DROP TABLE IF EXISTS tweets;
DROP TABLE IF EXISTS users;

CREATE TABLE tweets
(
 [tweet_id] [bigint] NOT NULL,
 [tweet_text] [nvarchar](255) NULL,
 [created_at] [datetime] NULL,
 [geo_lat] [decimal](10,5) NULL,
 [geo_long] [decimal](10,5) NULL,
 [user_id] [bigint] NULL,
 [source] [nvarchar](255) NULL,
 [retweet_count] [int] NULL,
 [favorite_count] [int] NULL,
 [capture_date] [datetime] NULL,
 [reply_tweet_id] [bigint] NULL,
 [reply_user_id] [bigint] NULL,
 [place_json] [text] NULL,
 [retweet] [bit] NULL,
 CONSTRAINT [PK_Tweets] PRIMARY KEY NONCLUSTERED
(
	[tweet_id]
)
) ON [PRIMARY]

Go

CREATE TABLE users
(
 [user_id] [bigint] NOT NULL,
 [period] [date] NOT NULL,
 [screen_name] [nvarchar](255) NULL,
 [name] [nvarchar](255) NULL,
 [followers_count] [int] NULL,
 [friends_count] [int] NULL,
 [favourites_count] [int] NULL,
 [statuses_count] [int] NULL,
 [description] [nvarchar](300) NULL,
 [location] [nvarchar](255) NULL,
 [capture_date] [datetime] NULL,
 [timezone] [nvarchar](255) NULL,
 [utc_offset] [int] NULL,
 [verified] [bit] NULL,
 [language] [nvarchar](255) NULL,
 [created_at] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY NONCLUSTERED
(
	[user_id], [period]
)
) ON [PRIMARY]

GO

CREATE TABLE mentions
(
 [tweet_id] [bigint] NOT NULL,
 [source_user_id] [bigint] NULL,
 [target_user_id] [bigint] NOT NULL,
 [screen_name] [nvarchar](255) NULL,
 [name] [nvarchar](255) NULL,
 CONSTRAINT [PK_Mentions] PRIMARY KEY NONCLUSTERED
(
	[tweet_id], [target_user_id]
)
) ON [PRIMARY]

GO

CREATE TABLE hashtags
(
 [tweet_id] [bigint] NOT NULL,
 [text] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Hashtags] PRIMARY KEY NONCLUSTERED
(
	[tweet_id], [text]
)
) ON [PRIMARY]

GO


ALTER TABLE mentions WITH NOCHECK ADD CONSTRAINT [Tweets-Mentions] FOREIGN KEY([tweet_id])
REFERENCES tweets ([tweet_id])
GO
ALTER TABLE mentions NOCHECK CONSTRAINT [Tweets-Mentions]
GO


ALTER TABLE hashtags WITH NOCHECK ADD CONSTRAINT [Tweets-Hashtags] FOREIGN KEY([tweet_id])
REFERENCES tweets ([tweet_id])
GO
ALTER TABLE hashtags NOCHECK CONSTRAINT [Tweets-Hashtags]
GO
