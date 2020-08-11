/* Using the NOT operator */

/* Using NOT with an IN operator */
SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name NOT IN ('Walmart', 'Target', 'Nordstrom'); /* returns everything except what is listed */

SELECT *
FROM web_events
WHERE channel NOT IN ('organic', 'adwords');



/* Using NOT with a LIKE operator */
SELECT name
FROM accounts
WHERE name NOT LIKE 'C%'; /* returns everything unlike the filter */

SELECT name
FROM accounts
WHERE name NOT LIKE '%one%';

SELECT name
FROM accounts
WHERE name NOT LIKE '%s';