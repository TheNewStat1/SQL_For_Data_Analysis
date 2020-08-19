/* Using Sub-Queries  */

/* The Regular query */
SELECT DATE_TRUNC('day',occurred_at) AS day,
   channel, COUNT(*) as events
	FROM web_events
	GROUP BY 1,2
	ORDER BY 3 DESC;
	
/* The Regular query as a subquery */
SELECT *
FROM (SELECT DATE_TRUNC('day',occurred_at) AS day,
           channel, COUNT(*) as events
     FROM web_events 
     GROUP BY 1,2
     ORDER BY 3 DESC) AS sub;
	 
/*  You can apply the same query operations on the returned inner query */	 
SELECT channel, AVG(events) AS average_events
FROM (SELECT DATE_TRUNC('day',occurred_at) AS day,
             channel, COUNT(*) as events
      FROM web_events 
      GROUP BY 1,2) sub
GROUP BY channel
ORDER BY 2 DESC;
	
	
	