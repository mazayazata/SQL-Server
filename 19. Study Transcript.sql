ALTER PROCEDURE StudyTranscript
@studNumber AS VARCHAR(20)
AS 
BEGIN
	SELECT 
		CONCAT(stud.FirstName,' ',stud.MiddleName,' ',stud.LastName) as [Full Name], 
		FORMAT(stud.RegisterDate,'dd MMMM yyy','id-ID') AS [Registered Date],
		maj.TotalCreditPoint
	FROM Student AS stud
		JOIN StudentMajor AS sm ON sm.StudentNumber = stud.StudentNumber
		JOIN Major AS maj ON maj.ID = sm.MajorID
	WHERE @studNumber = stud.StudentNumber
	SELECT 
		sub.Code AS [Subject Code],
		sub.Name AS [Subject Name],
		maj.Name AS [Major Name],
		FORMAT(per.EndDate,'dd MMMM yyy', 'id-ID'),
		(sr.Mark*sr.WeightedMark) AS [Total Mark] 
	FROM Student AS stud
		JOIN StudentMajor AS sm ON sm.StudentNumber = stud.StudentNumber
		JOIN Major AS maj ON maj.ID = sm.MajorID
		JOIN Subject AS sub ON sub.MajorID = maj.ID
		JOIN Competency AS comp ON comp.SubjectID = sub.ID
		JOIN Period AS per ON per.CompetencyID = comp.ID
		JOIN Enrollment AS en ON en.PeriodID = per.ID
		JOIN StudentSubject AS ss ON en.ID = ss.EnrollmentID
		JOIN StudentReportCard AS sr ON sr.StudentSubjectID = SS.ID
	WHERE @studNumber = stud.StudentNumber
END
