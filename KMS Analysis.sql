SELECT COUNT (*)
  FROM [Kultra Mega Stores (KMS)].[dbo].[KMS Sql Case Study]

  ---------------------------------QUESTION 1
  SELECT TOP 1 
    Product_Category, 
    SUM(Sales) AS TotalSales
FROM 
    [Kultra Mega Stores (KMS)].[dbo].[KMS Sql Case Study]
GROUP BY 
     Product_Category
ORDER BY 
    TotalSales DESC;
	--------------------------------QUESTION 2
	-- Top 3 Regions

SELECT TOP 3 
    Region, 
    SUM(Sales) AS TotalSales
FROM 
   [Kultra Mega Stores (KMS)].[dbo].[KMS Sql Case Study]
GROUP BY 
    Region
ORDER BY 
    TotalSales DESC


-- Bottom 3 Regions
SELECT TOP 3 
    Region, 
    SUM(Sales) AS TotalSales
FROM 
    [Kultra Mega Stores (KMS)].[dbo].[KMS Sql Case Study]
GROUP BY 
    Region
ORDER BY 
    TotalSales ASC;

	-----------QUESTION 3
SELECT 
    SUM(Sales) AS TotalSales
FROM 
    [Kultra Mega Stores (KMS)].[dbo].[KMS Sql Case Study]
WHERE 
    Product_Sub_Category = 'Appliances'
    AND Region = 'Ontario';
	---------question 4

	SELECT TOP 10 
    Customer_Name, 
    SUM(Sales) AS TotalRevenue
FROM 
    [Kultra Mega Stores (KMS)].[dbo].[KMS Sql Case Study]
GROUP BY 
    Customer_Name
ORDER BY 
    TotalRevenue ASC;
	-- See what these customers buy
SELECT 
    Customer_Name, 
	Product_Category,
    Product_Sub_Category, 
    COUNT(*) AS Orders, 
    SUM(Sales) AS Revenue
FROM 
    [Kultra Mega Stores (KMS)].[dbo].[KMS Sql Case Study]
WHERE 
    Customer_Name IN (
        -- Nested query to get bottom 10
        SELECT TOP 10 Customer_Name
        FROM [Kultra Mega Stores (KMS)].[dbo].[KMS Sql Case Study]
        GROUP BY Customer_Name
        ORDER BY SUM(Sales) ASC
    )
GROUP BY 
    Customer_Name, Product_Category, Product_Sub_Category
ORDER BY 
    Customer_Name;

-----------QUESTION 5
SELECT TOP 1 
    Ship_Mode, 
    SUM([Shipping_Cost]) AS TotalShippingCost
FROM 
    [Kultra Mega Stores (KMS)].[dbo].[KMS Sql Case Study]
GROUP BY 
    Ship_Mode
ORDER BY 
    TotalShippingCost DESC;

	-------QUESTION 6
	SELECT TOP 10 
    Customer_Name, 
    SUM(Sales) AS TotalRevenue
FROM 
    [Kultra Mega Stores (KMS)].[dbo].[KMS Sql Case Study]
GROUP BY 
    Customer_Name
ORDER BY 
    TotalRevenue DESC;

	SELECT 
    Customer_Name, 
    Product_Category, 
	Product_Sub_Category,
    COUNT(*) AS PurchaseCount,
    SUM(Sales) AS Revenue
FROM 
    [Kultra Mega Stores (KMS)].[dbo].[KMS Sql Case Study]
WHERE 
    Customer_Name IN (
        SELECT TOP 10 Customer_Name
        FROM [Kultra Mega Stores (KMS)].[dbo].[KMS Sql Case Study]
        GROUP BY Customer_Name
        ORDER BY SUM(Sales) DESC
    )
GROUP BY 
    Customer_Name, Product_Category, Product_Sub_Category
ORDER BY 
    Customer_Name, Revenue DESC;

	--------QUESTION NO 7
SELECT TOP 1 
    Customer_Name,
    SUM(Sales) AS TotalSales
FROM 
  [Kultra Mega Stores (KMS)].[dbo].[KMS Sql Case Study]
WHERE 
    Customer_Segment = 'Small Business'
GROUP BY 
    Customer_Name
ORDER BY 
    TotalSales DESC;

	-------Question 8
	SELECT TOP 1 
    Customer_Name, 
    COUNT(Order_ID) AS OrderCount
FROM 
    [Kultra Mega Stores (KMS)].[dbo].[KMS Sql Case Study]
WHERE 
    Customer_Segment = 'Corporate'
    AND YEAR(Order_Date) BETWEEN 2009 AND 2012
GROUP BY 
    Customer_Name
ORDER BY 
    OrderCount DESC;

	--------QUESTION 9
	SELECT TOP 1 
    Customer_Name, 
    SUM(Profit) AS TotalProfit
FROM 
    [Kultra Mega Stores (KMS)].[dbo].[KMS Sql Case Study]
WHERE 
    Customer_Segment = 'Consumer'
GROUP BY 
    Customer_Name
ORDER BY 
    TotalProfit DESC;

	-------QUESTION 10
	SELECT DISTINCT 
    S.Customer_Name, 
    S.Customer_Segment
FROM 
    [Kultra Mega Stores (KMS)].[dbo].[KMS Sql Case Study] S
JOIN 
   [Kultra Mega Stores (KMS)].dbo.[Order_Status] O
    ON S.Order_ID = O.Order_ID
WHERE 
    O.[Status] = 'Returned';

	------QUESTION 11
	SELECT 
    Order_Priority, 
    Ship_Mode, 
    COUNT(*) AS NumOrders,
    SUM(Shipping_Cost) AS TotalShippingCost,
    AVG(Shipping_Cost) AS AvgShippingCost
FROM 
    [Kultra Mega Stores (KMS)].[dbo].[KMS Sql Case Study]
GROUP BY 
    Order_Priority, Ship_Mode
ORDER BY 
    Order_Priority, Ship_Mode;

