ALTER PROCEDURE DetilMajor
@majorName AS VARCHAR(50)
AS 
BEGIN
	SELECT 
		m.[Name], 
		sub.[Name], 
		CASE
			WHEN sub.[Description] IS NULL THEN 'Ask student call center for this subject information'
			ELSE sub.[Description]
		END AS [Description],
		CASE
			WHEN sub.[Level] = 'B' THEN 'Bachelor'
			WHEN sub.[Level] = 'P' THEN 'Phd'
			ELSE 'Master'
		END AS [Level],
		sub.Cost
	FROM Major AS m
	JOIN [Subject] AS sub ON sub.MajorID = m.ID
	WHERE m.[Name] = @majorName
END

EXEC DBO.DetilMajor
@majorName = 'Enterprise Systems Development'

