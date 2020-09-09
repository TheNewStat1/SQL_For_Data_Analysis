/* Using Comparison Operators while Joining */

SELECT accounts.name as account_name,
       accounts.primary_poc as poc_name,
       sales_reps.name as sales_rep_name
  FROM accounts
  LEFT JOIN sales_reps
  /* You will usually also include an equality join */
    ON accounts.sales_rep_id = sales_reps.id
  /* Here we are using an inequality to get specific records */
   AND accounts.primary_poc < sales_reps.name;