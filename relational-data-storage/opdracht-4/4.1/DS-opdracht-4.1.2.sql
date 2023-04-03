SELECT s.name, s.straat, s.huisnr, s.postcode, c.name
FROM mhl_suppliers AS s, mhl_communes AS c
WHERE c.name='Steenwijkerland';