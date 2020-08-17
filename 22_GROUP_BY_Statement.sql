/* Great Examples using GROUP BY with aggregate functions */

/* Finding the earliest date */
SELECT a.name, o.occurred_at
FROM accounts a
JOIN orders o
ON a.id = o.account_id
ORDER BY occurred_at
LIMIT 1;

/* adding the sales of each account */
SELECT a.name, SUM(total_amt_usd) AS total_sales
FROM orders o
JOIN accounts a
ON a.id = o.account_id
GROUP BY a.name;

/* latest channel occured at */
SELECT w.occurred_at, w.channel, a.name
FROM web_events w
JOIN accounts a
ON w.account_id = a.id 
ORDER BY w.occurred_at DESC
LIMIT 1;

/* Finding the total number of times each type of channel from the web_events was used */
SELECT w.channel, COUNT(*)
FROM web_events w
GROUP BY w.channel

/* Who was the primary contact associated with the earliest web_event */
SELECT a.primary_poc
FROM web_events w
JOIN accounts a
ON a.id = w.account_id
ORDER BY w.occurred_at
LIMIT 1;

/* What was the smallest order placed by each account in terms of total usd. */
SELECT a.name, MIN(total_amt_usd) AS smallest_order
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name
ORDER BY smallest_order;

/* Find the number of sales reps in each region. */
SELECT r.name, COUNT(*) num_reps
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
GROUP BY r.name
ORDER BY num_reps;
