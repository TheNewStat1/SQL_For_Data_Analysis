/* Using LEFT and RIGHT Function for Strings */

/* Using the RIGHT function to get the domain name */
SELECT RIGHT(website, 3) AS domain, COUNT(*) num_companies
FROM accounts
GROUP BY 1
ORDER BY 2 DESC;

/* Using left to get the first letter of a string */
SELECT LEFT(UPPER(name), 1) AS first_letter, COUNT(*) num_companies
FROM accounts
GROUP BY 1
ORDER BY 2 DESC;


/* Using LEFT and Upper together evaluate inner function first */
SELECT SUM(num) nums, SUM(letter) letters
FROM (SELECT name, 
					CASE WHEN LEFT(UPPER(name), 1) IN ('0','1','2','3','4','5','6','7','8','9') THEN 1 
						ELSE 0 
							END AS num, 
         CASE WHEN LEFT(UPPER(name), 1) IN ('0','1','2','3','4','5','6','7','8','9') 
                       THEN 0 ELSE 1 END AS letter
      FROM accounts) t1;
	  
/* Another Example  */
SELECT SUM(vowels) vowels, SUM(other) other
FROM (SELECT name, 
				CASE WHEN LEFT(UPPER(name), 1) IN ('A','E','I','O','U') 
                        THEN 1 
						ELSE 0 END AS vowels, 
					CASE WHEN LEFT(UPPER(name), 1) IN ('A','E','I','O','U') 
                       THEN 0 
					   ELSE 1 END AS other
         FROM accounts) t1;