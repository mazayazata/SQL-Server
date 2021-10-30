SELECT pvt.ID AS [Major Name], [F],[M]
FROM (
	SELECT stud.Gender AS gender, maj.Name AS nama, maj.Name AS ID
	FROM Student AS stud
		JOIN StudentMajor AS sm ON sm.StudentNumber = stud.StudentNumber
		JOIN Major AS maj ON maj.ID = sm.MajorID
) AS st
PIVOT(
	COUNT(st.nama) FOR st.gender IN([F],[M])
) AS pvt