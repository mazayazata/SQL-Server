SELECT stud.Username, CONCAT(stud.Title,' ',stud.FirstName,' ',stud.LastName) AS [Student Name], coun.[Name]
FROM Student AS stud
JOIN Country AS coun ON coun.ID = stud.CitizenshipID
