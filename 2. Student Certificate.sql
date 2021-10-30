SELECT
	CONCAT(stud.Title,' ',stud.FirstName,' ',stud.LastName) as [Nama], 
	CONCAT(cit.[Name],' ', FORMAT(stud.BirthDate, 'dd MMMM yyy', 'id-ID')) AS [Kelahiran],
	CASE 
		WHEN [cert].Grade = 'PAS' THEN 'Pass'
		WHEN [cert].Grade = 'CRE' THEN 'Credit'
		WHEN [cert].Grade = 'DIS' THEN 'Distinction'
		ELSE 'High Distinction'
	END AS [Grade],
	CASE 
		WHEN [cert].[Level] = 'B' THEN 'Bachelor'
		WHEN [cert].[Level] = 'P' THEN 'Phd'
		ELSE 'Master'
	END AS [Level], 
	[cert].AcademicTitle,
	FORMAT([cert].GraduateDate, 'dd MMMM yyy', 'id-ID') AS [Graduate Date]
FROM Student AS stud
JOIN [Certificate] AS [cert] ON [cert].StudentNumber = stud.StudentNumber
JOIN City AS cit ON cit.ID = stud.BirthCityID
