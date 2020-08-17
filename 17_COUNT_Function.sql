/* Using COUNT() function */

/* returns a count of all rows in the accounts table */
SELECT COUNT(*)
FROM accounts;

/* More specific count of a single column */
SELECT COUNT(accounts.id)
FROM accounts;

