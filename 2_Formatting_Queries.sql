
/*****
Formatting Your Queries
******/

/* Using Upper and Lower Case in SQL */
/* All three are the same */
SELECT account_id
FROM orders;

select account_id
from orders;

/* Bad practice */
SeLeCt AcCoUnt_id
FrOm oRdErS;


/* Use White Space in Queries */
/* White space is ignored */
 SELECT account_id FROM orders;
 
 SELECT account_id
FROM orders;

/* horrible practice */
SELECT              account_id

FROM               orders;
/* Semicolons */
/* Most SQL engines require a semicolon at the end */
/* Best Practice */
SELECT account_id
FROM orders;




