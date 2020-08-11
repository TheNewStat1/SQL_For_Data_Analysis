/* Using the IN operator */

SELECT name, primary_poc, sales_rep_id 
	FROM accounts 
    	WHERE name IN ('Walmart', 'Target', 'Nordstrom') ; /* IN allows filter of multiple values */
		
		
SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords');
		