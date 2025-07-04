-- View to display all member details with their attendance count
CREATE VIEW member_attendance_summary AS
SELECT 
    m.member_id,
    m.name,
    m.membership_plan,
    COUNT(a.attendance_id) AS total_attendance
FROM 
    members m
LEFT JOIN 
    attendance a ON m.member_id = a.member_id
GROUP BY 
    m.member_id, m.name, m.membership_plan;

-- View to show trainers and their specialization
CREATE VIEW trainer_info AS
SELECT 
    trainer_id,
    name AS trainer_name,
    specialization
FROM 
    trainers;

-- Report: List of active members who attended gym in the last 7 days
SELECT 
    m.member_id,
    m.name,
    a.date AS last_attended
FROM 
    members m
JOIN 
    attendance a ON m.member_id = a.member_id
WHERE 
    a.date >= CURDATE() - INTERVAL 7 DAY
ORDER BY 
    a.date DESC;

-- Report: Membership plan-wise member count
SELECT 
    membership_plan,
    COUNT(*) AS total_members
FROM 
    members
GROUP BY 
    membership_plan;

-- Report: Top 5 most active members by attendance
SELECT 
    m.member_id,
    m.name,
    COUNT(a.attendance_id) AS attendance_count
FROM 
    members m
JOIN 
    attendance a ON m.member_id = a.member_id
GROUP BY 
    m.member_id, m.name
ORDER BY 
    attendance_count DESC
LIMIT 5;
