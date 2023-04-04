SELECT COUNT(h.hitcount) AS count_hitcount, 
		AVG(h.hitcount) AS average_hitcount, 
		MIN(h.hitcount) AS min_hitcount, 
		MAX(h.hitcount) AS max_hitcount, 
		SUM(h.hitcount) AS sum_hitcount
FROM mhl_hitcount AS h
GROUP BY year, month;