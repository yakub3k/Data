# Zadanie 1
SELECT k.miasto, COUNT(*) as liczba
FROM klienci k
GROUP BY k.miasto
HAVING liczba > 3
ORDER BY liczba DESC;

# Zadanie 2
SELECT COUNT(*) AS ilosc, c.rodzaj_czekolady
FROM czekoladki c
GROUP BY c.rodzaj_czekolady
HAVING c.rodzaj_czekolady = 'mleczna'

# Zadanie 3
SELECT z.id_zam, z.data_zam, k.imie, k.nazwisko
FROM zamowienia z, szczegolowe_zam s, klienci k
WHERE z.id_klienta = k.id_klienta
GROUP BY z.id_zam
ORDER BY z.data_zam ASC

# Zadanie 4
SELECT z.id_zam, z.data_zam, k.imie AS imie_klienta, k.nazwisko AS nazwisko_klienta, d.imie AS imie_dostawcy, d.nazwisko AS nazwisko_dostawcy
FROM zamowienia z, szczegolowe_zam s, klienci k, dostawcy d
WHERE z.id_klienta = k.id_klienta AND z.id_dostawcy = d.id_dostawcy
GROUP BY z.id_zam
ORDER BY z.data_zam ASC

# Zadanie 5
SELECT z.data_zam, COUNT(*) AS Liczba
FROM zamowienia z
GROUP BY z.data_zam
ORDER BY Liczba

# Zadanie 6
SELECT p.nazwa AS pudelko, c.nazwa AS czekoladki, o.l_sztuk 
FROM pudelka p, czekoladki c, o_pudelkach o
WHERE p.id_pudelka = o.id_pudelka AND c.id_czek = o.id_czek
ORDER BY p.nazwa AND c.nazwa

# Zadanie 7
SELECT o.id_pudelka, SUM(o.l_sztuk) FROM o_pudelkach o GROUP BY o.id_pudelka 

# Zadanie 8
SELECT s.id_zam, SUM(ile_sztuk) AS zam_pudelek
FROM szczegolowe_zam s
GROUP BY s.id_zam
HAVING zam_pudelek > 5

# Zadanie 9
SELECT COUNT(*), IF(z.forma_zaplaty = 'g', 'Zaplacono gotowka', '-') AS Gotowka
FROM zamowienia z
GROUP BY z.forma_zaplaty
ORDER BY Gotowka DESC
