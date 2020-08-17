/* working with dates */

/* Using DATE_PART to get the part of the date you desire */
 SELECT DATE_PART('year', occurred_at) AS ord_year,  
	SUM(total_amt_usd) AS total_spent
 FROM orders
 GROUP BY 1
 ORDER BY 2 DESC;
 
 
 /* Using DATE_TRUNC to shorten the time frame of the date */
SELECT DATE_TRUNC('month', o.occurred_at) ord_date, SUM(o.gloss_amt_usd) tot_spent
FROM orders o 
JOIN accounts a
ON a.id = o.account_id
WHERE a.name = 'Walmart'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;