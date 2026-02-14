USE AdventureWorks2016
GO

WITH ROW_PER_DAY AS(
SELECT
	CAST(orderdate AS DATE) AS newdate,
	customerid,
	COUNT(*) AS ordercount
FROM sales.SalesOrderHeader
GROUP BY
	CAST(orderdate AS DATE),
	customerid
), customer_count AS
(
SELECT *
FROM ROW_PER_DAY
WHERE ordercount = 1
) 
SELECT newdate, COUNT(*) AS customer_total
FROM customer_count
GROUP BY 
	newdate
ORDER BY
	newdate