ALTER FUNCTION dbo.CheckPrerequisite(@studNumber AS VARCHAR(20), @subCode AS VARCHAR(10))
RETURNS INT AS
BEGIN
	DECLARE @jumlahPre AS INT, @Keputusan AS INT

	SELECT @jumlahPre = pre.PrerequisiteID
	FROM Subject AS sub
		JOIN Prerequisite AS pre ON sub.ID = pre.SubjectID
		JOIN Major AS maj ON maj.ID = sub.MajorID
		JOIN StudentMajor AS sm ON sm.MajorID = maj.ID
		JOIN Student AS stud ON stud.StudentNumber = sm.StudentNumber
	WHERE @studNumber = stud.StudentNumber AND @subCode = sub.Code

	IF @jumlahPre IS NOT NULL
	BEGIN
		SET @Keputusan = 1
	END
	BEGIN
		SET @Keputusan = 0
	END

	RETURN @Keputusan
END
	