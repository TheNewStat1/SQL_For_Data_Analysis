/* Practice for JOINS */
SELECT a.primary_poc, w.occurred_at, w.channel, a.name
	FROM web_events w
    JOIN accounts a
    ON a.id = w.account_id
	 WHERE a.name = 'Walmart';
	
	
	
SELECT r.name as region_name , 
		s.name as sales_rep_name, 
        a.name as account_name
FROM sales_reps s
	JOIN accounts a
	ON a.sales_rep_id = s.id
	JOIN region r
    ON s.region_id = r.id
	ORDER BY a.name;

SELECT r.name as region_name,
		a.name as account_name,
		o.total_amt_ud / (o.total + 0.1) as unit_price,
		FROM accounts a
			JOIN orders o 
			ON a.id = o.account_id
			JOIN sales_reps s 
			ON s.id = a.sales_rep_id
			JOIN region r
			ON r.id = s.region_id;
		