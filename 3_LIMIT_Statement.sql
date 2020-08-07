/* Using LIMIT to limit the number of rows returned in a query */
SELECT occurred_at, account_id,channel
   FROM web_events
   LIMIT 15; /*  We are limiting to the first 15 rows  */