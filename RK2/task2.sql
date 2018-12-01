SELECT * 
FROM dbo.drivers AS D
JOIN dbo.cars AS C ON D.id = C.driver_id
WHERE C.creation_date > 2015
ORDER BY C.creation_date

SELECT *, SUM(P.fine) OVER(PARTITION BY D.id) AS summary
FROM dbo.drivers AS D
JOIN dbo.driver_penalty_relation AS DP ON D.id = DP.driver_id
JOIN dbo.penalty AS P ON DP.penalty_id = P.id
ORDER BY D.id

SELECT D.fio 
FROM dbo.drivers AS D
WHERE 'bmw' IN (
    SELECT C.brand
    FROM dbo.cars AS C
    WHERE D.id = C.driver_id
)