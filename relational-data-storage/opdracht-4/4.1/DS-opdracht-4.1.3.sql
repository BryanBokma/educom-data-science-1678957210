SELECT s.name, s.straat, s.huisnr, s.postcode
FROM mhl_suppliers AS s
INNER JOIN mhl_cities AS c ON s.city_ID = c.id
INNER JOIN mhl_suppliers_mhl_rubriek_view AS srv ON s.id = srv.mhl_suppliers_ID
INNER JOIN mhl_rubrieken AS r ON srv.mhl_rubriek_view_ID = r.id
LEFT JOIN  mhl_rubrieken AS pr ON r.parent = pr.id
WHERE c.name='Amsterdam' AND (r.name='drank' OR pr.name='drank')
ORDER BY c.name, s.name;