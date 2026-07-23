SELECT p.name, d.designation_name
FROM park p
JOIN park_designation pd ON p.park_id = pd.park_id
JOIN designation d ON pd.designation_id = d.designation_id
WHERE d.designation_name = 'World Heritage Site';