DROP TABLE tickets;
DROP TABLE films;
DROP TABLE customers;

CREATE TABLE customers(
id SERIAL4 PRIMARY KEY,
name VARCHAR(255)
);

CREATE TABLE films(
id SERIAL4 PRIMARY KEY,
name VARCHAR(255)
);

CREATE TABLE tickets(
id SERIAL4 PRIMARY KEY,
customer_id INT4 REFERENCES customers(id),
cinema_id INT4 REFERENCES films(id)
);
