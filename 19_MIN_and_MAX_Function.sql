/* Examples using the MIN and MAX function */

/* Using aggregate to find earliest record */
SELECT MIN(occurred_at) 
FROM orders;

/* Alternative way of finding earliest record */
SELECT occurred_at 
FROM orders 
ORDER BY occurred_at
LIMIT 1;

/* finding the latest web event */
SELECT MAX(occurred_at)
FROM web_events;

/* alternative to aggregate above */
SELECT occurred_at
FROM web_events
ORDER BY occurred_at DESC
LIMIT 1;

