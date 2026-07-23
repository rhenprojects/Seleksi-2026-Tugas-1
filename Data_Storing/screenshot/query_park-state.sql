SELECT p.name, s.state_name
FROM park p
JOIN park_state ps ON p.park_id = ps.park_id
JOIN state s ON ps.state_id = s.state_id
WHERE s.state_name = 'California';