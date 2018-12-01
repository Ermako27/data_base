-- оконная функция - сумма долга для каждого человека
SELECT *, SUM(B.fine) OVER(PARTITION BY C.id) AS summary
FROM dbo.clients AS C
JOIN dbo.bills AS B ON C.id = B.client_id
ORDER BY C.id

-- скалярный подзапрос - средний возраст людей живущих рядом с банком
SELECT *, 
        (
            SELECT AVG(C.age)
            FROM dbo.clients AS C 
            WHERE C.addressof = B.addressof
        )
FROM dbo.banks AS B

-- агрегатная - средний долг в каждом банке
SELECT *, AVG(B.fine) OVER(PARTITION BY BA.id ORDER BY B.open_date) AS AVG
FROM dbo.banks AS BA
JOIN dbo.bills AS B ON BA.id = B.client_id
ORDER BY BA.id