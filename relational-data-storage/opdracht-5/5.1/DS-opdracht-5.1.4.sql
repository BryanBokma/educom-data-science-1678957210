SELECT s.name, SUM(h.hitcount) AS numhits, COUNT(h.month) AS nummonths, ROUND(SUM(h.hitcount)/COUNT(month),0) AS avgpermonth
FROM mhl_hitcount AS h
LEFT JOIN mhl_suppliers AS s ON h.supplier_ID = s.id
GROUP BY s.name
ORDER BY SUM(h.hitcount) DESC;