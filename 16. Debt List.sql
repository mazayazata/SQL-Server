SELECT 
	CONCAT(stud.FirstName,' ',stud.MiddleName,' ',stud.LastName) as [Nama],
	SUM(sub.Cost) AS [Total Dept]
FROM Student AS stud
	JOIN Enrollment AS en ON en.StudentNumber = stud.StudentNumber
	JOIN StudentMajor AS sm ON sm.StudentNumber = stud.StudentNumber
	JOIN Major AS maj ON maj.ID = sm.MajorID
	JOIN Subject AS sub ON sub.MajorID = maj.ID
	JOIN Competency AS comp ON comp.SubjectID = sub.ID
	JOIN Period AS per ON per.CompetencyID = comp.ID
WHERE en.Status = 'PEN'
GROUP BY CONCAT(stud.FirstName,' ',stud.MiddleName,' ',stud.LastName)
