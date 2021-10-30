ALTER FUNCTION dbo.IncomeFromFee(@Date AS DATE)
RETURNS MONEY AS
BEGIN
	DECLARE @GrandTotal AS MONEY

	SELECT @GrandTotal = SUM(ALL en.Fee)
	FROM Student AS stud
		JOIN Enrollment AS en ON en.StudentNumber = stud.StudentNumber
	WHERE @Date = FORMAT(en.TransactionDate,'dd MMM yyy','id-ID') 

	RETURN @GrandTotal
END
