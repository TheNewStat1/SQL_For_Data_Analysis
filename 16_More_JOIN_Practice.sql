/* More practice examples using JOINS and Operators */

SELECT r.name as region_name,
	s.name as sales_rep,
	a.name as account_name
	FROM accounts a
	INNER JOIN sales_reps s
		ON a.sales_rep_id = s.id
	INNER JOIN region r
		ON s.region_id = r.id
	WHERE r.name = 'Midwest'
	ORDER BY a.name ;
	
	
	
SELECT r.name as region_name,
	s.name as sales_rep,
	a.name as account_name
	FROM accounts a
	INNER JOIN sales_reps s
		ON a.sales_rep_id = s.id
	INNER JOIN region r
		ON s.region_id = r.id
	WHERE r.name = 'Midwest' 
		AND s.name LIKE 'S%'
	ORDER BY a.name ;
	
SELECT r.name as region_name,
	s.name as sales_rep,
	a.name as account_name
	FROM accounts a
	INNER JOIN sales_reps s
		ON a.sales_rep_id = s.id
	INNER JOIN region r
		ON s.region_id = r.id
	WHERE r.name = 'Midwest' 
		AND s.name LIKE '% K%'
	ORDER BY a.name ;
	
SELECT r.name as region_name, 
	   a.name as account_name,
	   (o.total_amt_usd/(o.total + 0.01)) as unit_price
	   FROM accounts a 
	   INNER JOIN sales_reps s
			ON a.sales_rep_id = s.id
	   INNER JOIN region r 
			ON r.id = s.region_id
	   INNER JOIN orders o 
			ON a.id = o.account_id
		WHERE o.standard_qty > 100 AND o.poster_qty > 50 
		ORDER BY  unit_price DESC ;
		
		
		
SELECT DISTINCT w.channel , a.name AS account_name
		FROM accounts a 
			INNER JOIN web_events w 
				ON w.account_id = a.id 
					AND a.id = 1001;
		


SELECT o.occurred_at , a.name AS account_name , 
		o.total, o.total_amt_usd 
	FROM orders o 
		INNER JOIN accounts a 
			ON a.id = o.account_id 
	WHERE o.occurred_at BETWEEN '2015-01-01' AND '2015-12-31'
	ORDER BY o.occurred_at DESC ;
		






		
		
		