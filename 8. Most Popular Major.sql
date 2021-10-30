CREATE PROCEDURE MostPopularMajor
@tahun AS INT
AS
BEGIN

	SELECT maj.Name, COUNT(maj.Name) AS [Jumlah Diambil]
	FROM Student AS stud
		JOIN StudentMajor AS sm ON sm.StudentNumber = stud.StudentNumber
		JOIN Major AS maj ON maj.ID = sm.MajorID
	WHERE @tahun = YEAR(sm.SetDate)
	GROUP BY maj.Name
		
END

EXEC dbo.MostPopularMajor
@tahun = 2013
