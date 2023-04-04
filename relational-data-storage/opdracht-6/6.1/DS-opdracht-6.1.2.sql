SELECT 
	c.name AS gemeente,
    s.name AS leverancier,
    SUM(h.hitcount) AS total_hitcount,
    AVG(h.hitcount) AS average_hitcount
FROM mhl_suppliers AS s
INNER JOIN mhl_hitcount AS h ON s.id = h.supplier_ID
INNER JOIN mhl_communes AS c ON c.id = s.id;
    