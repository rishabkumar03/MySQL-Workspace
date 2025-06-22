-- For the given table, find the total payment according to each payment method.

CREATE DATABASE payments;

USE payments;

CREATE TABLE transaction_details (
    customer_id INT PRIMARY KEY,
    customer VARCHAR(30) NOT NULL,
    mode VARCHAR(30) NOT NULL,
    city VARCHAR(30) NOT NULL
);

INSERT INTO transaction_details
(customer_id, customer, mode, city)
VALUES
(101, "Olivia", "Netbanking", "Portland"),
(102, "Naina", "Credit Card", "Ranchi"),
(103, "Maya", "Credit Card", "Miami"),
(104, "Liam", "Netbanking", "Denver"),
(105, "Sophia", "Credit Card", "Gully"),
(106, "Caleb", "Debit Card", "Mexico"),
(107, "Ava", "Debit Card", "Phoenix"),
(108, "Lucas", "Netbanking", "Boston"),
(109, "Isabella", "Netbanking", "Headingley"),
(110, "Jackson", "Credit Card", "Banaras");

SELECT mode, COUNT(customer_id)
FROM transaction_details
GROUP BY mode;