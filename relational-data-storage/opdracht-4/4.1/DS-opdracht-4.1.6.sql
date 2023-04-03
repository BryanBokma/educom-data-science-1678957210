SELECT h.hitcount, s.name AS leverancier, c.name AS stad, co.name AS gemeente, d.name AS provincie
FROM mhl_suppliers AS s
INNER JOIN mhl_cities AS c ON city_ID = c.id
INNER JOIN mhl_communes AS co ON c.commune_ID = co.id
INNER JOIN mhl_districts AS d ON co.district_ID = d.id
INNER JOIN mhl_hitcount AS h ON s.id = h.supplier_ID AND h.year='2014' AND h.month=1
WHERE d.name='Zeeland' OR d.name='Noord-Brabant' OR d.name='Limburg'
ORDER BY d.name;