/* Advanced Problems using sub-queries */

/*1. Provide the name of the sales_rep in each region with the largest amount of total_amt_usd sales. */


/*1.1 step get the inner queury down */
SELECT s.name rep_name, r.name region_name, SUM(o.total_amt_usd) total_amt
	FROM sales_reps s
		JOIN accounts a
			ON a.sales_rep_id = s.id
		JOIN orders o
			ON o.account_id = a.id
		JOIN region r
			ON r.id = s.region_id
	GROUP BY 1,2
	ORDER BY 3 DESC;
	
/* 1.2 get max of sales by each rep  */
SELECT region_name, MAX(total_amt) total_amt
     FROM(SELECT s.name rep_name, r.name region_name, SUM(o.total_amt_usd) total_amt
             FROM sales_reps s
             JOIN accounts a
             ON a.sales_rep_id = s.id
             JOIN orders o
             ON o.account_id = a.id
             JOIN region r
             ON r.id = s.region_id
             GROUP BY 1, 2) t1
     GROUP BY 1;
	 
/* 1.3 Final step */
SELECT t3.rep_name, t3.region_name, t3.total_amt
FROM(SELECT region_name, MAX(total_amt) total_amt
     FROM(SELECT s.name rep_name, r.name region_name, SUM(o.total_amt_usd) total_amt
             FROM sales_reps s
             JOIN accounts a
             ON a.sales_rep_id = s.id
             JOIN orders o
             ON o.account_id = a.id
             JOIN region r
             ON r.id = s.region_id
             GROUP BY 1, 2) t1
     GROUP BY 1) t2
JOIN (SELECT s.name rep_name, r.name region_name, SUM(o.total_amt_usd) total_amt
     FROM sales_reps s
     JOIN accounts a
     ON a.sales_rep_id = s.id
     JOIN orders o
     ON o.account_id = a.id
     JOIN region r
     ON r.id = s.region_id
     GROUP BY 1,2
     ORDER BY 3 DESC) t3
ON t3.region_name = t2.region_name AND t3.total_amt = t2.total_amt;



/*2. For the region with the largest sales total_amt_usd, how many total orders were placed? */
SELECT r.name region_name, SUM(o.total_amt_usd) total_amt
	FROM sales_reps s
		JOIN accounts a
			ON a.sales_rep_id = s.id
		JOIN orders o
			ON o.account_id = a.id
		JOIN region r
			ON r.id = s.region_id
	GROUP BY r.name;

/* 2.1 */
SELECT MAX(total_amt)
FROM (SELECT r.name region_name, SUM(o.total_amt_usd) total_amt
             FROM sales_reps s
				JOIN accounts a
					ON a.sales_rep_id = s.id
				JOIN orders o
					ON o.account_id = a.id
				JOIN region r
					ON r.id = s.region_id
             GROUP BY r.name) sub;

/* 2.2 Final step */
SELECT r.name, COUNT(o.total) total_orders
FROM sales_reps s
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
JOIN region r
ON r.id = s.region_id
GROUP BY r.name
HAVING SUM(o.total_amt_usd) = (
      SELECT MAX(total_amt)
      FROM (SELECT r.name region_name, SUM(o.total_amt_usd) total_amt
              FROM sales_reps s
              JOIN accounts a
              ON a.sales_rep_id = s.id
              JOIN orders o
              ON o.account_id = a.id
              JOIN region r
              ON r.id = s.region_id
              GROUP BY r.name) sub);


/* 3. How many accounts had more total purchases than the account 
name which has bought the most standard_qty paper throughout their lifetime as a customer? */

/* 3.1  */
SELECT a.name account_name, SUM(o.standard_qty) total_std, SUM(o.total) total
	FROM accounts a
		JOIN orders o
		ON o.account_id = a.id
	GROUP BY 1
	ORDER BY 2 DESC
		LIMIT 1;
/* 3.2  */
SELECT a.name
	FROM orders o
		JOIN accounts a
			ON a.id = o.account_id
	GROUP BY 1
		HAVING SUM(o.total) > (SELECT total 
            FROM (SELECT a.name act_name, SUM(o.standard_qty) tot_std, SUM(o.total) total
                FROM accounts a
                    JOIN orders o
                       ON o.account_id = a.id
                GROUP BY 1
                ORDER BY 2 DESC
                    LIMIT 1) sub);
					
/* 3.3 Final step */				
SELECT COUNT(*)
FROM (SELECT a.name
       FROM orders o
       JOIN accounts a
       ON a.id = o.account_id
       GROUP BY 1
       HAVING SUM(o.total) > (SELECT total 
                   FROM (SELECT a.name act_name, SUM(o.standard_qty) tot_std, SUM(o.total) total
                         FROM accounts a
                         JOIN orders o
                         ON o.account_id = a.id
                         GROUP BY 1
                         ORDER BY 2 DESC
                         LIMIT 1) inner_tab)
             ) counter_tab;
			 
			 
