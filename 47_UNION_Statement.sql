/* UNION Statement */

/*
	1. UNION must contain same columns
	2. The expressions must be of the same data type
*/

/* Example 1 */
SELECT *
    FROM accounts

UNION ALL

SELECT *
  FROM accounts
  
  
/* Example 2 */
SELECT *
    FROM accounts
    WHERE name = 'Walmart'

UNION ALL

SELECT *
  FROM accounts
  WHERE name = 'Disney'
  
  
/* Example 3 */
WITH double_accounts AS (
    SELECT *
      FROM accounts

    UNION ALL

    SELECT *
      FROM accounts
)

SELECT name,
       COUNT(*) AS name_count
 FROM double_accounts 
GROUP BY 1
ORDER BY 2 DESC




