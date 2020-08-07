
/* Using the ORDER BY Statement */
SELECT id, occurred_at, total_amt_usd
	FROM orders
    ORDER BY occurred_at
    LIMIT 10;
    
SELECT id, total_amt_usd, account_id 
	FROM orders 
    ORDER BY total_amt_usd DESC   /* Can specify descending to get the order from largest to smallest */
    LIMIT 5;
    
SELECT id, total_amt_usd, account_id 
	FROM orders 
    ORDER BY total_amt_usd
    LIMIT 20;    