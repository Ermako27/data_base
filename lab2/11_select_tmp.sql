
SELECT PersonName, AVG(Age) AS SP INTO #AvgAge FROM participants WHERE Age > 20 GROUP BY PersonName
SELECT * FROM #AvgAge