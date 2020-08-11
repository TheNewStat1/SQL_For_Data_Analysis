/* Introduction to JOINS */

SELECT orders.*, accounts.*    /* to select all columns from the orders and accounts table*/
	FROM orders 
     JOIN accounts 
     ON orders.account_id = accounts.id ;
	 

	 
SELECT accounts.name, orders.occurred_at  /* Specify table name before "." and column after the "." */
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;  /* Specify table name before "." and column after the "." */


/* This query only pulls columns from the orders table in the from statement */
SELECT *     
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

/* Example pull of all data from orders and accounts joined on account ids */
SELECT accounts.* , orders.* 
	FROM orders 
    INNER JOIN accounts
    	ON orders.account_id = accounts.id ;

/* Example selecting specified columns from the orders and account table */
SELECT orders.standard_qty, orders.gloss_qty, 
       orders.poster_qty,  accounts.website, 
       accounts.primary_poc
FROM orders
JOIN accounts
ON orders.account_id = accounts.id
