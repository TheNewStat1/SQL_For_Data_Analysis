/* Additional Examples using GROUP BY */


/* For each account, determine the average amount of each type of paper they purchased across their orders */
SELECT a.name, AVG(o.standard_qty) AS avg_stand, 
	AVG(o.gloss_qty) AS avg_gloss, 
		AVG(o.poster_qty) AS avg_post
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name;


/* For each account, determine the average amount spent per order on each paper type.*/
SELECT a.name, AVG(o.standard_amt_usd) AS avg_stand, AVG(o.gloss_amt_usd) AS avg_gloss, AVG(o.poster_amt_usd) AS avg_post
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name;


/*  Determine the number of times a particular channel was used in the web_events table for each sales rep.*/
SELECT s.name, w.channel, COUNT(*) AS num_events
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.name, w.channel
ORDER BY num_events DESC;

/* Determine the number of times a particular channel was used in the web_events table for each region */
SELECT r.name, w.channel, COUNT(*) num_events
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
JOIN sales_reps s
ON s.id = a.sales_rep_id
JOIN region r
ON r.id = s.region_id
GROUP BY r.name, w.channel
ORDER BY num_events DESC;

