/*JOIN multiple tables (More than 2) */

/* Returns all of the columns from the join of the web_events, accounts, and orders tables */
SELECT *
	FROM web_events
	JOIN accounts
		ON web_events.account_id = accounts.id
	JOIN orders
		ON accounts.id = orders.account_id;