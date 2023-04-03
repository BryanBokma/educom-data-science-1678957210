SELECT s.name, s.straat, s.huisnr, s.postcode, c.name
FROM mhl_suppliers AS s, mhl_cities AS c
WHERE c.name='Amsterdam';