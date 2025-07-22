use SQL_Challenge_50_Days;

-- Create table bank_transactions
CREATE TABLE bank_transactions (
    transaction_id int identity (1,1) PRIMARY KEY,
    bank_id INT,
    customer_id INT,
    transaction_amount DECIMAL(10, 2),
    transaction_type VARCHAR(10),
    transaction_date DATE
);

-- Insert sample records into bank_transactions
INSERT INTO bank_transactions (bank_id, customer_id, transaction_amount, transaction_type, transaction_date) VALUES
(1, 101, 500.00, 'credit', '2024-01-01'),
(1, 101, 200.00, 'debit', '2024-01-02'),
(1, 101, 300.00, 'credit', '2024-01-05'),
(1, 101, 150.00, 'debit', '2024-01-08'),
(1, 102, 1000.00, 'credit', '2024-01-01'),
(1, 102, 400.00, 'debit', '2024-01-03'),
(1, 102, 600.00, 'credit', '2024-01-05'),
(1, 102, 200.00, 'debit', '2024-01-09');

-- first trans details 
-- last trans details 
-- than join these 2 trans

/*
You are given a bank transaction data 
with columns bank_id, customer_id, 
amount_type(credit debit), 
transaction_amount and transaction_date



-- Write a query to find starting and ending 
trans amount for each customer

Return cx_id, their first_transaction_amt, 
last_transaction and these transaction_date

*/
-- 


SELECT * FROM bank_transactions;

WITH cte1 AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY transaction_date) AS rn_asc,
           ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY transaction_date DESC) AS rn_desc
    FROM bank_transactions
),
cte2 AS (
    SELECT 
        customer_id,
        transaction_amount,
        transaction_date
    FROM cte1
    WHERE rn_asc = 1
),
cte3 AS (
    SELECT 
        customer_id,
        transaction_amount,
        transaction_date
    FROM cte1
    WHERE rn_desc= 1
)

SELECT 
    cte2.customer_id,
    cte2.transaction_amount AS first_transaction,
    cte2.transaction_date AS first_transaction_date,
    cte3.transaction_amount AS last_transaction,
    cte3.transaction_date AS last_transaction_date
FROM cte2
INNER JOIN cte3 ON cte2.customer_id = cte3.customer_id;


-- Your task 
-- Write a query to return each cx_id and their bank balance
-- Note bank balance = Total Credit - Total_debit


SELECT 
    customer_id,
    SUM(CASE WHEN transaction_type = 'credit' THEN transaction_amount ELSE 0 END) AS total_credit,
    SUM(CASE WHEN transaction_type = 'debit' THEN transaction_amount ELSE 0 END) AS total_debit,
    SUM(CASE 
            WHEN transaction_type = 'credit' THEN transaction_amount 
            WHEN transaction_type = 'debit' THEN -transaction_amount 
            ELSE 0 
        END) AS bank_balance
FROM bank_transactions
GROUP BY customer_id;
