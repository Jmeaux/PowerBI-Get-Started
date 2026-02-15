SELECT 
    YEAR(soh.OrderDate) AS OrderYear,
    MONTH(soh.OrderDate) AS OrderMonth,
    st.Name AS Territory,
    SUM(soh.TotalDue) AS TotalSales,
    COUNT(DISTINCT soh.CustomerID) AS TotalCustomers
FROM Sales.SalesOrderHeader soh
JOIN Sales.SalesTerritory st
    ON soh.TerritoryID = st.TerritoryID
GROUP BY 
    YEAR(soh.OrderDate),
    MONTH(soh.OrderDate),
    st.Name

