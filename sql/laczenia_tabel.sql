# minimalna praca podstawowa
SELECT p.IMIE, p.NAZWISKO
FROM pracownicy p
WHERE p.PLACA_PODSTAWOWA = (
	SELECT min(p.PLACA_PODSTAWOWA)
	FROM pracownicy p 
)

# pracownicy zastrudnieni najwczesniej
SELECT p.IMIE, p.NAZWISKO, p.DATA_ZATRUDNIENIA
FROM pracownicy p
WHERE p.DATA_ZATRUDNIENIA = (
	SELECT min(p.DATA_ZATRUDNIENIA)
	FROM pracownicy p 
)

# pracownicy zarabiajacy powyzej sredniej w wydziale
SELECT p.IMIE, p.NAZWISKO, p.KOD_WYDZIALU
FROM pracownicy p
WHERE p.PLACA_PODSTAWOWA > (
	SELECT avg(PLACA_PODSTAWOWA)
	FROM pracownicy
    WHERE KOD_WYDZIALU = p.KOD_WYDZIALU
)

# praownicy na tym samym stanowisku co Sobczak Robert
SELECT p.IMIE, p.NAZWISKO, p.KOD_stanowiska
FROM pracownicy p
WHERE p.KOD_stanowiska = (
	SELECT kod_stanowiska
	FROM pracownicy pp
    WHERE pp.IMIE = "Robert" AND pp.NAZWISKO = "Sobczak"
)

#  nazwy wydzialow bez pracownikow
SELECT w.KOD_WYDZIALU, w.NAZWA as ilosc
FROM wydzialy w
WHERE w.KOD_WYDZIALU NOT IN (
	SELECT kod_wydzialu
	FROM pracownicy pp
    
)

#  imiona, nazwiska, kody wydziałów, płacę podstawową tych pracowników, którzy otrzymują najwyższe płace podstawowe w swoich wydziałach,
SELECT p.IMIE, p.NAZWISKO, p.KOD_WYDZIALU, p.PLACA_PODSTAWOWA
FROM pracownicy p
WHERE (p.PLACA_PODSTAWOWA, p.KOD_WYDZIALU) 
IN (
	SELECT max(PLACA_PODSTAWOWA), KOD_WYDZIALU
    FROM pracownicy
    GROUP BY KOD_WYDZIALU
)

#  imiona, nazwiska, kody wydziałów, płacę podstawową tych pracowników, którzy otrzymują najwyższe płace podstawowe w swoich wydziałach,
SELECT p.IMIE, p.NAZWISKO, p.KOD_WYDZIALU, p.PLACA_PODSTAWOWA, w.NAZWA
FROM pracownicy p, wydzialy w
WHERE (p.PLACA_PODSTAWOWA, p.KOD_WYDZIALU) 
IN (
	SELECT max(PLACA_PODSTAWOWA), KOD_WYDZIALU
    FROM pracownicy
    GROUP BY KOD_WYDZIALU
)
AND p.KOD_WYDZIALU = w.KOD_WYDZIALU

# optymalniej
SELECT p.IMIE, p.NAZWISKO, p.KOD_WYDZIALU, p.PLACA_PODSTAWOWA, w.NAZWA
FROM pracownicy p
	JOIN wydzialy w ON p.KOD_WYDZIALU = w.KOD_WYDZIALU
WHERE (p.PLACA_PODSTAWOWA, p.KOD_WYDZIALU) 
IN (
	SELECT max(PLACA_PODSTAWOWA), KOD_WYDZIALU
    FROM pracownicy
    GROUP BY KOD_WYDZIALU
)

#  maksymalna średnia płac podstawowych z poszczególnych wydziałów
SELECT MAX(srednia), COUNT(*) as z_wydzialow
FROM (
    SELECT AVG(p.PLACA_PODSTAWOWA) srednia
	FROM pracownicy p
	GROUP BY p.KOD_WYDZIALU
) AS srednia_wydzialu


#  maksymalna średnia płac podstawowych z poszczególnych wydziałów
SELECT p.KOD_WYDZIALU, AVG(p.PLACA_PODSTAWOWA) AS srednia_podstawowa
FROM pracownicy p
GROUP by p.KOD_WYDZIALU
HAVING srednia_podstawowa  > 
(
    SELECT AVG(pp.PLACA_PODSTAWOWA)
    FROM pracownicy pp
)
