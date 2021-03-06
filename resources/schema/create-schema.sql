CREATE TABLE subscribed_server (
   name VARCHAR(300),
   PRIMARY KEY (name)
);

CREATE TABLE subscribed_node (
   name VARCHAR(300),
   server VARCHAR(300),
   metadata_updated TIMESTAMP,
   subscribers_updated TIMESTAMP,
   items_crawled TIMESTAMP,
   PRIMARY KEY (name, server)
);

CREATE SEQUENCE user_id_seq;
CREATE TABLE t_user (
   id BIGINT PRIMARY KEY DEFAULT nextval('user_id_seq'),
   jid VARCHAR(300)
);
CREATE INDEX user_jid_index ON t_user(jid);
 
CREATE SEQUENCE item_id_seq;
CREATE TABLE item (
   id BIGINT PRIMARY KEY DEFAULT nextval('item_id_seq'),
   jid VARCHAR(300),
   title VARCHAR(300),
   description VARCHAR(500)
);
CREATE INDEX item_jid_index ON item(jid);
 
CREATE TABLE taste_preferences (
   user_id BIGINT NOT NULL,
   item_id BIGINT NOT NULL,
   PRIMARY KEY (user_id, item_id)
);

CREATE INDEX taste_preferences_user_id_index ON taste_preferences (user_id);
CREATE INDEX taste_preferences_item_id_index ON taste_preferences (item_id);

CREATE TABLE taste_item_similarity (
	item_id_a BIGINT NOT NULL,
	item_id_b BIGINT NOT NULL,
	similarity FLOAT NOT NULL,
	PRIMARY KEY (item_id_a, item_id_b)
);

CREATE TABLE channel_activity (
    channel_jid VARCHAR(300),
    detailed_activity VARCHAR(2048),
    summarized_activity BIGINT,
    updated TIMESTAMP,
    earliest TIMESTAMP,
    PRIMARY KEY (channel_jid)
);

CREATE INDEX channel_activity_summary_index ON channel_activity (summarized_activity DESC);
CREATE INDEX channel_activity_updated_index ON channel_activity (updated DESC);