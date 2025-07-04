SELECT COUNT(*) FROM members;

-- Members by plan
SELECT membership_plan, COUNT(*) FROM members GROUP BY membership_plan;

-- Trainer specialization list
SELECT * FROM trainers WHERE specialization LIKE '%Training%';
