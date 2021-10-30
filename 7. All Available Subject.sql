ALTER PROCEDURE AllAvailableSubject
@Date AS DATE
AS 
BEGIN
	SELECT DISTINCT(FORMAT(per.StartDate,'dd MMM yyy','id-ID')) AS [Start Date],FORMAT(per.EndDate,'dd MMM yyy','id-ID') AS [End Date], sub.[Name] AS [Subject Name], sub.[Description], FORMAT(sub.Cost,'C2','en-US')
	FROM Subject AS sub
		JOIN Competency AS comp ON comp.SubjectID = sub.ID
		JOIN [Period] AS per ON per.CompetencyID = comp.ID
	WHERE @Date = FORMAT(per.StartDate,'dd MMM yyy','id-ID')
END

EXEC dbo.AllAvailableSubject
@Date = '01 Jan 2014'