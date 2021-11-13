--2
CREATE ROLE accountant;
CREATE ROLE administrator;
CREATE ROLE support;

GRANT SELECT ON transactions TO accountant;
GRANT SELECT, UPDATE (balance) ON accounts TO accountant;
GRANT ALL PRIVILEGES ON SCHEMA lab7 TO administrator;
GRANT SELECT ON accounts,customers,transactions TO support;

CREATE USER Eren;
CREATE USER Armin;
CREATE USER Mikasa;

GRANT accountant TO Armin;
GRANT adminstrator TO Eren;
GRANT support TO Mikasa;

CREATE ROLE role_manager CREATEROLE;
GRANT role_manager to Eren;

REVOKE UPDATE ON accounts FROM accountant;
--3
SELECT * FROM transactions;
ALTER TABLE transactions
-- ALTER COlUMN * SET NOT NULL;
ALTER COLUMN date SET NOT NULL;
ALTER TABLE transactions
ALTER COLUMN src_account SET NOT NULL;
ALTER TABLE transactions
ALTER COLUMN dst_account SET NOT NULL;
ALTER TABLE transactions
ALTER COLUMN amount SET NOT NULL;
ALTER TABLE transactions
ALTER COLUMN status SET NOT NULL;

--4
CREATE TYPE val as (sql CHAR(3));
ALTER TABLE accounts
ALTER COLUMN currency TYPE val USING currency::val;

--5
CREATE UNIQUE INDEX idx_acc ON accounts(customer_id, currency);
CREATE INDEX search_t ON accounts(currency, balance);
