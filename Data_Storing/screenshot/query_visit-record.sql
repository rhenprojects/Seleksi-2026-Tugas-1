SELECT p.name, v.visit_year, v.visitor_count
FROM visit_record v
JOIN park p ON v.park_id = p.park_id
WHERE v.visitor_count > 3000000;