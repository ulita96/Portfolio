
--1. Poka� wszystkie filmy--

SELECT *
FROM Filmy

--2. Poka� wszystkich aktor�w

SELECT ImieNazwisko
FROM Aktorzy

--3. Poka� imiona i nazwiska uczestnik�w wydarze� 

SELECT Imi�, Nazwisko
FROM Osoby

--4. Poka� tytu�y film�w traj�cych co najmniej dwie godziny

SELECT Tytul
FROM Filmy
WHERE CzasTrwania_min >= 120

--5. Ilu jest aktor�w urodzonych w kwietniu?

SELECT COUNT(*) AS Ilosc
FROM Aktorzy
WHERE MONTH(DataUrodzenia) = 04

--6. Poka� tytu�y 3 najnowszych film�w 

SELECT TOP 3 Tytul
FROM Filmy
ORDER BY RokProdukcji DESC

--7. Poka� filmy, kt�rych tytu�y zaczynaj� si� na liter� 'S'

SELECT Tytul
FROM Filmy
WHERE Tytul like 's%'

--8. Poka� filmy wyprodukowane po roku 2000 trwaj�ce mniej ni� 2 godziny'

SELECT Tytul
FROM Filmy
WHERE RokProdukcji > 2000 AND CzasTrwania_min < 120

--9. W jakich filmach gra� Tom Hanks?

SELECT f.Tytul
FROM Filmy f
INNER JOIN Film_Aktor fa ON f.IdFilmy = fa.IdFilmu
INNER JOIN Aktorzy a ON a.IdAktorzy = fa.IdAktora
WHERE a.ImieNazwisko = 'Tom Hanks'

--10.Kt�rzy aktorzy grali w przynajmniej dw�ch filmach?

SELECT a.ImieNazwisko, COUNT(*) AS Liczba_filmow
FROM Aktorzy a
INNER JOIN Film_Aktor fa ON fa.IdAktora = a.IdAktorzy
INNER JOIN Filmy f ON f.IdFilmy = a.IdAktorzy
GROUP BY a.ImieNazwisko
HAVING COUNT(*) >=2

-- 11. W filmach z jakiego gatunku gra� Morgan Freeman?

SELECT DISTINCT g.Nazwa
FROM Gatunek g
INNER JOIN Film_Gatunek fg ON fg.IdGatunku = g.IdGatunek
INNER JOIN Film_Aktor fa ON fa.IdFilmu = fg.IdFilmu
INNER JOIN Aktorzy a ON a.IdAktorzy = fa.IdAktora
WHERE a.ImieNazwisko = 'Morgan Freeman'

--12. Kto jest najm�odszym aktorem graj�cym w Fajerwerkach pr�no�ci?

SELECT TOP 1 a.ImieNazwisko, a.DataUrodzenia
FROM Aktorzy a
INNER JOIN Film_Aktor fa ON fa.IdAktora = a.IdAktorzy
INNER JOIN Filmy f ON f.IdFilmy = fa.IdFilmu
WHERE f.Tytul = 'Fajerwerki pr�no�ci' 
ORDER BY a.DataUrodzenia DESC 

--13. Znajd� aktor�w, kt�rzy zagrali w wi�cej ni� jednym filmie

SELECT a.ImieNazwisko
FROM Aktorzy a
INNER JOIN Film_Aktor fa ON fa.IdAktora = a.IdAktorzy
GROUP BY a.ImieNazwisko 
HAVING COUNT(*) > 1

-- 14. Ile trwa� najkr�tszy a ile najd�u�szy film

SELECT MAX(CzasTrwania_min) AS najdluzszy_film, Min(CzasTrwania_min) AS najkrotszy_film
FROM Filmy

-- 15. Ile film�w by�o wyprodukowanych w ka�dym roku

SELECT RokProdukcji, COUNT(*) as liczba_filmow
FROM Filmy
GROUP BY RokProdukcji