/* Using the order by Window Function (Running total) */

/* Use Over and and Order by to compute a running total */
SELECT standard_amt_usd,
       SUM(standard_amt_usd) OVER (ORDER BY occurred_at) AS running_total
FROM orders