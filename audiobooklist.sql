/*
-- 
-- RESET
--

-- DROP FOREIGN KEY CONSTRAINTS
ALTER TABLE audiobook DROP FOREIGN KEY fk_person_id;
ALTER TABLE audiobook DROP FOREIGN KEY fk_category_id;
ALTER TABLE audiobook DROP FOREIGN KEY fk_lang_id;
ALTER TABLE audiobook DROP FOREIGN KEY fk_speaker_id;
ALTER TABLE audiobook DROP FOREIGN KEY fk_publisher_id;
ALTER TABLE audiolist DROP FOREIGN KEY fk_list_person_id;
ALTER TABLE audiolist DROP FOREIGN KEY fk_list_audiobook_id;
ALTER TABLE review DROP FOREIGN KEY fk_review_person_id;
ALTER TABLE review DROP FOREIGN KEY fk_review_audiobook_id;

-- DROP TABLES
DROP TABLE IF EXISTS review;
DROP TABLE IF EXISTS audiobook;
DROP TABLE IF EXISTS author;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS person;
DROP TABLE IF EXISTS lang;
DROP TABLE IF EXISTS speaker;
DROP TABLE IF EXISTS publisher;
DROP TABLE IF EXISTS audiolist;
*/


--
-- Table structures
--
CREATE SCHEMA audiobooklist;

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
  rolename varchar(20) NOT NULL DEFAULT 'basicuser',
  PRIMARY KEY (id)
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
  author_id int(11) unsigned NOT NULL,
  title varchar(45) NOT NULL,
  speaker_id int(11) unsigned NOT NULL,
  publisher_id int(11) unsigned DEFAULT NULL,
  published date DEFAULT NULL,
  description varchar(400) DEFAULT NULL,
  category_id int(11) unsigned NOT NULL,
  duration float DEFAULT NULL,
  lang_id int(11) unsigned NOT NULL,
  rating int(11) DEFAULT NULL,
  votes int(11) DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_author_id FOREIGN KEY (author_id) REFERENCES author (id),
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

CREATE TABLE audiolist (
  id int(11) unsigned NOT NULL,
  person_id int(11) unsigned NOT NULL,
  audiobook_id int(11) unsigned NOT NULL,
  rating int(11) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_list_audiobook_id FOREIGN KEY (audiobook_id) REFERENCES audiobook (id),
  CONSTRAINT fk_list_person_id FOREIGN KEY (person_id) REFERENCES person (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
COMMIT;



--
-- INSERT Statements
--
INSERT INTO category (id, name) values (null, "Comedy");
INSERT INTO category (id, name) values (null, "Mysteries & Thrillers");
INSERT INTO category (id, name) values (null, "Romance");
INSERT INTO category (id, name) values (null, "Sci-Fi & Fantasy");
INSERT INTO category (id, name) values (null, "Fiction");
INSERT INTO category (id, name) values (null, "History");
INSERT INTO category (id, name) values (null, "Teens");
INSERT INTO category (id, name) values (null, "Science & Technology");
INSERT INTO category (id, name) values (null, "Kids");
INSERT INTO category (id, name) values (null, "Classics");
INSERT INTO category (id, name) values (null, "Nonfiction");
INSERT INTO category (id, name) values (null, "Bios & Memoirs");
INSERT INTO category (id, name) values (null, "Business");
INSERT INTO category (id, name) values (null, "Foreign Language");
INSERT INTO category (id, name) values (null, "Self Development");
COMMIT;

INSERT INTO lang (id, name) values (null, "english");
INSERT INTO lang (id, name) values (null, "german");
COMMIT;

INSERT INTO author (id, firstname, lastname) values (null, "John", "Grisham");
INSERT INTO author (id, firstname, lastname) values (null, "Nicholas", "Sparks");
INSERT INTO author (id, firstname, lastname) values (null, "Jodi", "Picoult");
INSERT INTO author (id, firstname, lastname) values (null, "Stephenie", "Meyer");
INSERT INTO author (id, firstname, lastname) values (null, "James", "Luceno");
INSERT INTO author (id, firstname, lastname) values (null, "Amor", "Towles");
COMMIT;

INSERT INTO speaker (id, firstname, lastname) values (null, "Cassandra", "Campbell");
INSERT INTO speaker (id, firstname, lastname) values (null, "Nicholas", "Sparks");
INSERT INTO speaker (id, firstname, lastname) values (null, "Ari", "Fliakos");
INSERT INTO speaker (id, firstname, lastname) values (null, "Audra", "McDonald");
INSERT INTO speaker (id, firstname, lastname) values (null, "Ellen", "Archer");
INSERT INTO speaker (id, firstname, lastname) values (null, "Jonathan", "Davis");
INSERT INTO speaker (id, firstname, lastname) values (null, "Nicholas", "Guy Smith");
COMMIT;

INSERT INTO publisher (id, company) values (null, "Penguin Audio");
INSERT INTO publisher (id, company) values (null, "Random House Audio");
INSERT INTO publisher (id, company) values (null, "Little, Brown & Company");
INSERT INTO publisher (id, company) values (null, "Hachette Book Group USA");
COMMIT;

INSERT INTO audiobook (id, person_id, author_id, title, speaker_id, publisher_id, published, category_id, duration, lang_id, rating, votes, description) 
VALUES (null, null, 1, "The Whistler", 1, 2,'2016-10-25', 2, 790, 1, 500, 100, "We expect our judges to be honest and wise. Their integrity and impartiality are the bedrock of the entire judicial system. We trust them to ensure fair trials, to protect the rights of all litigants, to punish those who do wrong, and to oversee the orderly and efficient flow of justice. But what happens when a judge bends the law or takes a bribe?");