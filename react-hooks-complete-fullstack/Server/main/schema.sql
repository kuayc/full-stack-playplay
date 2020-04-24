CREATE TABLE users
(
  uid SERIAL PRIMARY KEY,
  username VARCHAR(100),
  email VARCHAR(100),
  email_verified BOOLEAN,
  date_created DATE,
  last_login DATE
);

CREATE TABLE posts
(
  pid SERIAL PRIMARY KEY,
  title VARCHAR(100),
  body VARCHAR(1000),
  -- search_vector TSVECTOR,
  user_id INT REFERENCES users(uid),
  author VARCHAR REFERENCES users(username),
  date_created TIMESTAMP,
  like_user_id INT
  [] DEFAULT ARRAY[]::INT[],
  likes INT DEFAULT 0
);

  CREATE TABLE comments
  (
    cid SERIAL PRIMARY KEY,
    comment VARCHAR(250),
    author VARCHAR REFERENCES users(username),
    user_id INT REFERENCES users(uid),
    post_id INT REFERENCES posts(pid),
    date_created TIMESTAMP
  );

  CREATE TABLE messages
  (
    mid SERIAL PRIMARY KEY,
    message_sender VARCHAR(255) REFERENCES users(username),
    message_to VARCHAR(255) REFERENCES users(username),
    message_title VARCHAR(100),
    message_body VARCHAR,
    date_created TIMESTAMP
  );
