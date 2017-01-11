-- 
-- RESET
--
DROP TABLE IF EXISTS review;
DROP TABLE IF EXISTS audiobook;
DROP TABLE IF EXISTS author;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS chatentry;
DROP TABLE IF EXISTS friends;
DROP TABLE IF EXISTS person;
DROP TABLE IF EXISTS lang;
DROP TABLE IF EXISTS speaker;
DROP TABLE IF EXISTS publisher;


--
-- Table structures
--
CREATE TABLE author (
  id int(11) unsigned NOT NULL AUTO_INCREMENT,
  firstname varchar(45) NOT NULL,
  lastname varchar(45) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
COMMIT;


CREATE TABLE category (
  id int(11) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(45) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
COMMIT;


CREATE TABLE lang (
  id int(11) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(45) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
COMMIT;


CREATE TABLE person (
  id int(11) unsigned NOT NULL AUTO_INCREMENT,
  username varchar(45) NOT NULL,
  email varchar(80) NOT NULL,
  password varchar(64) NOT NULL,
  picture varchar(80) DEFAULT NULL,
  active enum('T','F') NOT NULL DEFAULT 'T',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
COMMIT;


CREATE TABLE chatentry (
  id int(11) unsigned NOT NULL AUTO_INCREMENT,
  ts datetime NOT NULL,
  sender_id int(11) unsigned NOT NULL,
  recipient_id int(11) unsigned NOT NULL,
  message varchar(2000) NOT NULL,
  sender_ip varchar(15) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_recipient_id FOREIGN KEY (recipient_id) REFERENCES person (id),
  CONSTRAINT fk_sender_id FOREIGN KEY (sender_id) REFERENCES person (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
COMMIT;


CREATE TABLE friends (
  person_id int(11) unsigned NOT NULL,
  friend_id int(11) unsigned NOT NULL,
  CONSTRAINT fk_friends_friend_id FOREIGN KEY (friend_id) REFERENCES person (id) ,
  CONSTRAINT fk_friends_person_id FOREIGN KEY (person_id) REFERENCES person (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
COMMIT;


CREATE TABLE speaker (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  firstname varchar(45) NOT NULL,
  lastname varchar(45) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
COMMIT;


CREATE TABLE publisher (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  company varchar(45) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
COMMIT;


CREATE TABLE audiobook (
  id int(11) unsigned NOT NULL AUTO_INCREMENT,
  person_id int(11) unsigned DEFAULT NULL,
  author varchar(45) NOT NULL,
  title varchar(45) NOT NULL,
  speaker_id int(11) unsigned NOT NULL,
  publisher_id int(11) unsigned DEFAULT NULL,
  published date DEFAULT NULL,
  description varchar(400) DEFAULT NULL,
  category_id int(11) unsigned NOT NULL,
  duration float DEFAULT NULL,
  lang_id int(11) unsigned NOT NULL,
  rating int(11) DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_category_id FOREIGN KEY (category_id) REFERENCES category (id),
  CONSTRAINT fk_lang_id FOREIGN KEY (lang_id) REFERENCES lang (id),
  CONSTRAINT fk_person_id FOREIGN KEY (person_id) REFERENCES person (id),
  CONSTRAINT fk_publisher_id FOREIGN KEY (publisher_id) REFERENCES publisher (id),
  CONSTRAINT fk_speaker_id FOREIGN KEY (speaker_id) REFERENCES speaker (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
COMMIT;


CREATE TABLE review (
  id int(11) unsigned NOT NULL,
  person_id int(11) unsigned NOT NULL,
  audiobook_id int(11) unsigned NOT NULL,
  description varchar(2000) NOT NULL,
  rating int(11) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_review_audiobook_id FOREIGN KEY (audiobook_id) REFERENCES audiobook (id),
  CONSTRAINT fk_review_person_id FOREIGN KEY (person_id) REFERENCES person (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
COMMIT;
