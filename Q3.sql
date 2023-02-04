-- Create a CTE to get the total sales quantity by product_id
WITH SumsalesTransaction_CTE(product_id, totalsales)
AS
(SELECT product_id, SUM(quantity) AS totalquantitysales
FROM SalesTransaction
GROUP BY product_id),

SumSalesValue_CTE(product_id, product_name, product_class_id, totalquantitysales, sales_value)
AS
(SELECT sc.product_id,
p.product_name,
p.product_class_id ,
sc.totalquantitysales 
sc.totalquantitysales*p.retail_price AS sales_value
FROM SumsalesTransaction_CTE AS sc
JOIN Product AS p
ON sc.product_id = p.product_id)

SELECT *
FROM (SELECT 
        pc.product_class_name,
        ROW_NUMBER() OVER (PARTITION BY pc.product_class_name ORDER BY sc.totalquantitysales DESC, ssc.product_name) AS rank,
        p.product_name,
        ssc.sales_value
     FROM SumSalesValue_CTE AS ssc
     JOIN Product_Class AS pc 
         ON p.product_class_id = pc.product_class_id
     ORDER BY pc.product_class_name)
WHERE rank < 3;

/*
Use ROW_NUMBER() because the result in Class B has both products equal in sales_value but rank run in normal order
And use ORDER BY in 2 columns totalsales and product_name because the result in Class B run order with the alphabet.

SELECT all columns from sub-query and use where clause to filter only rank less than 2.
*/