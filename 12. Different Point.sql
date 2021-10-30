SELECT Maj.Name AS [Major Name], maj.TotalCreditPoint,(maj.TotalCreditPoint-TableCreditSubject.[Cek Total CreditPoint]) AS [Different with subject]
FROM(
	SELECT sub.MajorID, SUM(sub.CreditPoint) AS [Cek Total CreditPoint]
	FROM Subject AS sub
	GROUP BY sub.MajorID
) AS TableCreditSubject
	JOIN Major AS maj ON maj.ID = TableCreditSubject.MajorID