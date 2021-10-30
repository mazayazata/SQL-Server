SELECT DISTINCT(CONCAT(stud.FirstName,' ',stud.MiddleName,' ',stud.LastName)) AS [Nama],
	stud.[Address]
FROM Student AS stud
JOIN Enrollment AS en ON en.StudentNumber = stud.StudentNumber
WHERE (stud.RegisterDate IS NOT NULL) AND (en.[Status] = 'PEN' OR en.[Status] = 'CAN')