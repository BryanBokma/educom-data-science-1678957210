SELECT s.name, s.straat, s.huisnr, s.postcode, pll.lat, pll.lng
FROM mhl_suppliers AS s
INNER JOIN pc_lat_long AS pll ON s.postcode = pll.pc6
ORDER BY pll.lat DESC
LIMIT 5;