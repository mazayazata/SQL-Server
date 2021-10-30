SELECT
	CONCAT(stud.Title,' ',stud.FirstName,' ',stud.LastName) as [Nama], 
	CONCAT(cit.[Name],' ', FORMAT(stud.BirthDate, 'dd MMM yyy', 'id-ID')) AS [Kelahiran],
	m.[Name] AS [Major Name]
FROM Student AS stud
	JOIN City AS cit ON cit.ID = stud.BirthCityID
	JOIN StudentMajor AS sm ON sm.StudentNumber = stud.StudentNumber
	JOIN Major AS m ON m.ID = sm.MajorID
