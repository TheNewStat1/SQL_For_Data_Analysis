/* Using CASE WHEN Statements */

SELECT account_id, CASE WHEN standard_qty = 0 OR standard_qty IS NULL THEN 0
                        ELSE standard_amt_usd/standard_qty 
						END AS unit_price
FROM orders
LIMIT 10;


/* Additional Examples using CASE and aggregates */
SELECT account_id, 
		total_amt_usd,
		CASE WHEN total_amt_usd > 3000 THEN 'Large' ELSE 'Small' 
		END AS order_level
FROM orders;



SELECT CASE 
			WHEN total >= 2000 THEN 'At Least 2000'
			WHEN total >= 1000 AND total < 2000 THEN 'Between 1000 and 2000'
			ELSE 'Less than 1000' 
			END AS order_category,
	COUNT(*) AS order_count
	FROM orders
	GROUP BY 1;
	
/* Using aggregate functions with the case statement */
SELECT a.name, 
	   SUM(total_amt_usd) AS total_spent, 
	   CASE WHEN SUM(total_amt_usd) > 200000 THEN 'top'
		    WHEN  SUM(total_amt_usd) > 100000 THEN 'middle'
            ELSE 'low' END AS customer_level
FROM orders o
	JOIN accounts a
		ON o.account_id = a.id 
	GROUP BY a.name
	ORDER BY 2 DESC;

/* Another example */
SELECT s.name, COUNT(*) num_ords,
     CASE WHEN COUNT(*) > 200 THEN 'top'
     ELSE 'not' END AS sales_rep_level
FROM orders o
JOIN accounts a
ON o.account_id = a.id 
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.name
ORDER BY 2 DESC;