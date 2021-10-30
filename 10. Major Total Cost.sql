SELECT 
	mj.Name, 
	CASE 
		WHEN mj.Type = 'FM'THEN 'Full Major'
		WHEN mj.Type = 'SM'THEN 'Sub Major'
		ELSE 'Elective'
	END AS [Type],
	TableCost.[Total Cost]
FROM
(
	SELECT sub.MajorID, SUM(sub.Cost) AS [Total Cost]
	FROM Subject AS sub
	GROUP BY sub.MajorID
) AS TableCost
JOIN Major AS mj ON mj.ID = TableCost.MajorID