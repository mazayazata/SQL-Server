ALTER PROCEDURE AllTutorandStudentInvolved
@date AS VARCHAR(50),
@subID AS BIGINT
AS
BEGIN
	SELECT 
		FORMAT(sm.SetDate,'dd MMMM yyy','id-ID') AS Tanggal, 
		CONCAT(stud.FirstName,' ',stud.MiddleName,',',stud.LastName) AS [Student Name], 
		CONCAT(tut.FirstName,' ',tut.MiddleName,' ',tut.LastName) AS [Tutor Name]
	FROM Student AS stud
		JOIN StudentMajor AS sm ON sm.StudentNumber = stud.StudentNumber
		JOIN Major AS maj ON maj.ID = sm.MajorID
		JOIN Subject AS sub ON sub.MajorID = maj.ID
		JOIN Competency AS comp ON comp.SubjectID = sub.ID
		JOIN Tutor AS tut ON tut.StaffNumber = comp.StaffNumber
	WHERE @date = FORMAT(sm.SetDate,'dd MMMM yyy','id-ID') AND @subID = sub.ID
END

EXEC dbo.AllTutorandStudentInvolved
@date = [07 Februari 2012],
@subId = 2