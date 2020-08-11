
 /* Ordering Multiple columns  */
 /** The first column is ordered first and then the second column keeping the order of the first column */
SELECT 	id,
		account_id, 
		total_amt_usd
	FROM orders 
    ORDER BY account_id, total_amt_usd DESC ;
    
    
    
    
SELECT 	id,
		account_id, 
		total_amt_usd
     FROM orders 
     ORDER BY total_amt_usd DESC, account_id ;