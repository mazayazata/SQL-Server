SELECT 
	CASE
		WHEN en.PaymentMethod = 'AC' THEN 'Auto Collection'
		WHEN en.PaymentMethod = 'CC' THEN 'Credit Card'
		WHEN en.PaymentMethod = 'CH' THEN 'Cheque'
		ELSE 'Bank Transfer'
	END AS [Payment Method],
	FORMAT(COUNT(en.PaymentMethod)/57.0,'P') AS [Precentage]
FROM Student AS stud
	JOIN Enrollment AS en ON en.StudentNumber = stud.StudentNumber
GROUP BY en.PaymentMethod
