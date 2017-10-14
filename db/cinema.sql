DROP TABLE screenings;
DROP TABLE tickets;
DROP TABLE films;
DROP TABLE customers;

CREATE TABLE customers(
id SERIAL4 PRIMARY KEY,
name VARCHAR(255),
funds INT4
);

CREATE TABLE films(
id SERIAL4 PRIMARY KEY,
title VARCHAR(255) UNIQUE,
price INT4,
start_time VARCHAR UNIQUE
);

CREATE TABLE tickets(
id SERIAL4 PRIMARY KEY,
customer_id INT4 REFERENCES customers(id) ON DELETE CASCADE,
film_id INT4 REFERENCES films(id) ON DELETE CASCADE
);

CREATE TABLE screenings(
id SERIAL4 PRIMARY KEY,
title VARCHAR(255) REFERENCES films(title) ON DELETE CASCADE,
start_time VARCHAR(255) REFERENCES films(start_time) ON DELETE CASCADE,
available_tickets INT4 --CHECK (available_tickets < 5)
);
