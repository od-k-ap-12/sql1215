USE IceCream

SELECT *
FROM (
   SELECT Name, Price*StockQuantity as Total
   FROM IceCream
) AS SourceTable
PIVOT (
	SUM(Total) FOR Name IN ([������],[�������],[��������])
) AS PivotTable;
