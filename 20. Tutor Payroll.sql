ALTER FUNCTION dbo.CalculateBonus(@EmpType AS VARCHAR(2))
RETURNS MONEY AS
BEGIN
	DECLARE @total AS MONEY;

	IF @EmpType = 'FC' AND @EmpType = 'FP' 
	BEGIN
		SELECT @total = (tut.BasicSalary)+(tut.BasicSalary*0.01*tut.Allowance)
		FROM Tutor AS tut
		WHERE tut.EmployeeType = @EmpType
	END 
	ELSE  
	BEGIN
		SELECT @total = (tut.BasicSalary*2)
		FROM Tutor AS tut
		WHERE tut.EmployeeType = @EmpType
	END 
	RETURN @total;
END


SELECT tut.StaffNumber, 
	CONCAT(tut.FirstName,' ',tut.MiddleName,' ',tut.LastName) AS [Full Name],
	CASE
		WHEN tut.EmployeeType = 'FC' THEN 'Full Time Contract'
		WHEN tut.EmployeeType = 'CA' THEN 'Casual'
		WHEN tut.EmployeeType = 'FP' THEN 'Fulltime Permanent'
		ELSE 'Part-Time Contract'
	END AS [Employee Type],
	dbo.CalculateBonus(tut.EmployeeType) AS [Take Homepay]
FROM Tutor AS tut