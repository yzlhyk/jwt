CREATE DATABASE jwt;

--download uuid extension

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE users(
  user_id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_name VARCHAR(255) NOT NULL,
  user_email VARCHAR(255) NOT NULL,
  user_password VARCHAR(255) NOT NULL
);

--insert fake users
INSERT INTO users (user_name, user_email, user_password) VALUES ('henry', 'henry@gmail.com', 'thk123');

---------------------

CREATE DATABASE authtodo;

--users

CREATE TABLE users(
  user_id UUID DEFAULT uuid_generate_v4(),
  user_name VARCHAR(255) NOT NULL,
  user_email VARCHAR(255) NOT NULL UNIQUE,
  user_password VARCHAR(255) NOT NULL,
  PRIMARY KEY (user_id)
);

--todos

CREATE TABLE todos(
  todo_id SERIAL,
  user_id UUID,
  description VARCHAR(255) NOT NULL,
  PRIMARY KEY (todo_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);


-- FAKE USER DATA 
INSERT INTO users (user_name, user_email, user_password) VALUES ('Jacob', 'jac@gmail.com', 'jac');
INSERT INTO users (user_name, user_email, user_password) VALUES ('Jan', 'jan@gmail.com', 'jan');
INSERT INTO users (user_name, user_email, user_password) VALUES ('ann', 'ann@gmail.com', 'ann');
INSERT INTO users (user_name, user_email, user_password) VALUES ('bob', 'bob@gmail.com', 'bob');

--fake todo data
INSERT INTO todos (user_id, description) VALUES ('29ea55a9-1c74-4f7a-aecf-9544fa9b68dc', 'Clean the cars');
INSERT INTO todos (user_id, description) VALUES ('4f52dd9e-7242-48a3-86e2-8b844e839b2d', 'Jan Clean the cars');

INSERT INTO todos (user_id, description) VALUES ('4f52dd9e-7242-48a3-86e2-8b844e839b2d', 'Ann wahs Clean the cars');
INSERT INTO todos (user_id, description) VALUES ('4f52dd9e-7242-48a3-86e2-8b844e839b2d', 'Ann do the dish');

INSERT INTO todos (user_id, description) VALUES ('94f55637-e5ce-47fb-b1d5-160dfd7bfd53', 'Annaaaa');
INSERT INTO todos (user_id, description) VALUES ('94f55637-e5ce-47fb-b1d5-160dfd7bfd53', 'Annbbbbb');

