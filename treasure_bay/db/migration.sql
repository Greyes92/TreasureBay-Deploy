DROP DATABASE IF EXISTS treasure_bay;

CREATE DATABASE treasure_bay;
\c treasure_bay

DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS messages CASCADE;


CREATE TABLE users(
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(150) NOT NULL,
    city TEXT NOT NULL,
    state VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    password VARCHAR(16) NOT NULL
);

CREATE TABLE products(
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(256),
    price MONEY NOT NULL,
    description TEXT NOT NULL,
    details TEXT,
    picture TEXT,
    user_id INT REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE messages(
    message_id SERIAL PRIMARY KEY,
    conversation_id INT,
    message text,
    time TIMESTAMP DEFAULT current_timestamp,
    sender_id INT REFERENCES users(user_id) ON DELETE CASCADE,
    receiver_id INT REFERENCES users(user_id) ON DELETE CASCADE
);

\i seed.sql