SELECT AVG(TotalAge) AS 'Actual AVG',
SUM(TotalAge) / COUNT(Participant_id) AS 'Calc AVG'
FROM (
SELECT Participant_id, SUM(Age) AS TotalAge
FROM participants
GROUP BY Participant_id
 ) AS TotalParticipants