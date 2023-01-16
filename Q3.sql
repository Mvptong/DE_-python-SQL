-- Create a CTE to get the total sales quantity by product_id
WITH SumsalesTransaction(product_id, totalsales)
AS
(SELECT product_id, SUM(quantity) AS totalsales
FROM SalesTransaction
GROUP BY product_id)

SELECT *
FROM (SELECT 
        pc.product_class_name,
        ROW_NUMBER() OVER (PARTITION BY pc.product_class_name ORDER BY st.totalsales DESC, p.product_name) AS rank,
        p.product_name,
        st.totalsales AS sales_value
     FROM Product AS p
     JOIN Product_Class AS pc 
         ON p.product_class_id = pc.product_class_id
     JOIN SumsalesTransaction AS st 
         ON p.product_id = st.product_id
     ORDER BY pc.product_class_name)
WHERE rank < 3;

/*
Use ROW_NUMBER() because the result in Class B has both products equal in sales_value but rank run in normal order
And use ORDER BY in 2 columns totalsales and product_name because the result in Class B run order with the alphabet.

SELECT all columns from sub-query and use where clause to filter only rank less than 2.
*/