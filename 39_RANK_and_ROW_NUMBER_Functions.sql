/* Using the ROW_Number Window Function */

/* Using the Rank Function over a partition */
SELECT id,
       account_id,
       total,
       RANK() OVER (PARTITION BY account_id ORDER BY total DESC) AS total_rank
FROM orders

/* Using the ROW)Number function over a partition */
SELECT id,
       account_id,
       total,
       ROW_NUMBER() OVER (PARTITION BY account_id ORDER BY total DESC) AS total_rank
FROM orders