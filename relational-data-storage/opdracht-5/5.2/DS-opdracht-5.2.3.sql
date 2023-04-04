SELECT 
	h.year AS Jaar, 
    SUM(IF(h.month IN ('1', '2', '3'), h.hitcount, 0)) AS 'Eerste kwartaal',
    SUM(IF(h.month IN ('4', '5', '6'), h.hitcount,0)) AS 'Tweede kwartaal',
    SUM(IF(h.month IN ('7', '8', '9'), h.hitcount,0)) AS 'Derde kwartaal',
    SUM(IF(h.month IN ('10', '11', '12'), h.hitcount,0)) AS 'Vierde kwartaal',
    SUM(h.hitcount) AS Totaal
FROM mhl_hitcount AS h
GROUP BY h.year;