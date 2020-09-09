/* Going over the JOIN */

/* This is the Inner Join (Middle of Venn Diagram) */
SELECT column_name(s)
FROM Table_A
INNER JOIN Table_B ON Table_A.column_name = Table_B.column_name;

/* This is the LEFT Join (Left table of the join = Table_A) */
SELECT column_name(s)
FROM Table_A
LEFT JOIN Table_B ON Table_A.column_name = Table_B.column_name;

/* This is the RIGHT Join (right table of the join = Table_B) */
SELECT column_name(s)
FROM Table_A
RIGHT JOIN Table_B ON Table_A.column_name = Table_B.column_name;

/* This is the FULL OUTER Join (Includes all rows in both tables */
SELECT column_name(s)
FROM Table_A
FULL OUTER JOIN Table_B ON Table_A.column_name = Table_B.column_name
	/* This Where clause exlcudes duplicated rows from both tables */
WHERE Table_A.column_name IS NULL OR Table_B.column_name IS NULL;


/* Example of a Full Outer Join */
SELECT *
  FROM accounts
 FULL JOIN sales_reps ON accounts.sales_rep_id = sales_reps.id
 WHERE accounts.sales_rep_id IS NULL OR sales_reps.id IS NULL;







