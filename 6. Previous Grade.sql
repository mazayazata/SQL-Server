SELECT eh.Institution, AVG(eh.Grade) AS [Nilai Rata-rata bedasarkan Institusi]
FROM Student AS stud
JOIN EducationHistory AS eh ON eh.StudentNumber = stud.StudentNumber
GROUP BY eh.Institution
