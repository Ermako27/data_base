SELECT Participant_id, PersonName, Sex, (SELECT AVG(Age) FROM participants WHERE Sex = 'F' ) AS AvgAge, 
(SELECT MAX(WeightP) FROM participants WHERE  Sex = 'F') AS MaxWeight 
FROM participants WHERE Team LIKE '%Norway%' AND Sex = 'F'