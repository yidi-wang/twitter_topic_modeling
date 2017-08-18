DROP TABLE IF EXISTS `hashtags`;
CREATE TABLE IF NOT EXISTS `hashtags` (
  `tweet_id` bigint(20) unsigned NOT NULL,
  `text` varchar(120) NOT NULL,
  PRIMARY KEY (`tweet_id`,`text`),
  CONSTRAINT `hashtags_ibfk_1` FOREIGN KEY (`tweet_id`) REFERENCES `tweets` (`tweet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


DROP TABLE IF EXISTS `json_cache`;
CREATE TABLE IF NOT EXISTS `json_cache` (
  `tweet_id` bigint(20) unsigned NOT NULL,
  `json_raw` text,
  PRIMARY KEY (`tweet_id`),
  CONSTRAINT `json_cache_ibfk_1` FOREIGN KEY (`tweet_id`) REFERENCES `tweets` (`tweet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


DROP TABLE IF EXISTS `links`;
CREATE TABLE IF NOT EXISTS `links` (
  `tweet_id` bigint(20) unsigned NOT NULL,
  `short_url` varchar(200) NOT NULL,
  `expanded_url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`tweet_id`,`short_url`),
  CONSTRAINT `links_ibfk_1` FOREIGN KEY (`tweet_id`) REFERENCES `tweets` (`tweet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


DROP TABLE IF EXISTS `mentions`;
CREATE TABLE IF NOT EXISTS `mentions` (
  `tweet_id` bigint(20) unsigned NOT NULL,
  `source_user_id` bigint(20) DEFAULT NULL,
  `target_user_id` bigint(20) NOT NULL,
  `screen_name` varchar(25) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`tweet_id`,`target_user_id`),
  CONSTRAINT `mentions_ibfk_1` FOREIGN KEY (`tweet_id`) REFERENCES `tweets` (`tweet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


DROP TABLE IF EXISTS `tweets`;
CREATE TABLE IF NOT EXISTS `tweets` (
  `tweet_id` bigint(20) unsigned NOT NULL,
  `tweet_text` varchar(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `utc_offset` int(11) DEFAULT NULL COMMENT 'difference between local time zone and UTC e.g. -28800 is -8 hours',
  `geo_lat` decimal(10,5) DEFAULT NULL,
  `geo_long` decimal(10,5) DEFAULT NULL,
  `user_id` bigint(10) unsigned DEFAULT NULL,
  `source` varchar(200) DEFAULT NULL,
  `retweet_count` int(10) DEFAULT NULL,
  `favorite_count` int(11) DEFAULT NULL,
  `capture_date` datetime DEFAULT NULL,
  `reply_tweet_id` bigint(20) DEFAULT NULL,
  `reply_user_id` bigint(20) DEFAULT NULL,
  `place_json` text,
  `retweet` tinyint(4) DEFAULT NULL COMMENT 'whether the tweet is retweet',
  PRIMARY KEY (`tweet_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `tweets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `period` date NOT NULL DEFAULT '0000-00-00',
  `screen_name` varchar(25) DEFAULT '',
  `name` varchar(200) DEFAULT '',
  `followers_count` int(10) DEFAULT '0',
  `friends_count` int(10) DEFAULT '0',
  `favourites_count` int(11) DEFAULT NULL,
  `statuses_count` int(11) DEFAULT NULL,
  `description` varchar(350) DEFAULT '',
  `location` varchar(200) DEFAULT '',
  `capture_date` datetime NOT NULL,
  `timezone` varchar(100) DEFAULT NULL,
  `utc_offset` int(11) DEFAULT NULL COMMENT 'difference between local time zone and UTC e.g. -28800 is -8 hours',
  `verified` tinyint(4) DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL COMMENT 'language of the user',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`period`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


DROP TABLE IF EXISTS `user_list`;
CREATE TABLE IF NOT EXISTS `user_list` (
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `list_name` varchar(200) NOT NULL DEFAULT '',
  `list_owner` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`list_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
