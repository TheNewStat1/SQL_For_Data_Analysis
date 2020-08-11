/* Using the LIKE Operator */

SELECT * 
	FROM accounts 
    WHERE name LIKE 'C%' ; /* Starts with a "C" */
	
SELECT name
FROM accounts
WHERE name LIKE '%one%'; /* has the text "one" in it */


SELECT name
FROM accounts
WHERE name LIKE '%s'; /* word ending with an "s" */