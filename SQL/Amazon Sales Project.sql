select * from raw_amazon_table limit 5;

select * from raw_amazon_table where "Region" = 'Europe';

select * from raw_amazon_table_test1;

----------------------------------------------------
-- Report 1
SELECT 
    "Region", 
    "Country",
    SUM(CAST("TotalProfit" AS numeric)) AS total_profit
FROM 
    public.raw_amazon_table
GROUP BY 
    "Region", 
    "Country"
ORDER BY 
    total_profit DESC
LIMIT 5;

--------------------------------------------------
-- Report 2
SELECT 
    "Region", 
    "Country",
    "OrderPriority",
    "OrderDate",
    "ShipDate",
	TO_DATE("ShipDate", 'MM/DD/YYYY') - TO_DATE("OrderDate", 'MM/DD/YYYY') AS TotalDays
FROM 
    public.raw_amazon_table
WHERE 
    "OrderPriority" = 'H';

---------------------------------------------------------
