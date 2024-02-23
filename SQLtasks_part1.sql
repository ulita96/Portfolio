
1. Pokaż wszystkie filmy

SELECT *
FROM Filmy

--2. Pokaż wszystkich aktorów

SELECT ImieNazwisko
FROM Aktorzy

--3. Pokaż imiona i nazwiska uczestników wydarzeń 

SELECT Imię, Nazwisko
FROM Osoby

--4. Pokaż tytuły filmów trających co najmniej dwie godziny

SELECT Tytul
FROM Filmy
WHERE CzasTrwania_min >= 120

--5. Ilu jest aktorów urodzonych w kwietniu?

SELECT COUNT(*) AS Ilosc
FROM Aktorzy
WHERE MONTH(DataUrodzenia) = 04

--6. Pokaż tytuły 3 najnowszych filmów 

SELECT TOP 3 Tytul
FROM Filmy
ORDER BY RokProdukcji DESC

--7. Pokaż filmy, których tytuły zaczynają się na literę 'S'

SELECT Tytul
FROM Filmy
WHERE Tytul like 's%'

--8. Pokaż filmy wyprodukowane po roku 2000 trwające mniej niż 2 godziny'

SELECT Tytul
FROM Filmy
WHERE RokProdukcji > 2000 AND CzasTrwania_min < 120

--9. W jakich filmach grał Tom Hanks?

SELECT f.Tytul
FROM Filmy f
INNER JOIN Film_Aktor fa ON f.IdFilmy = fa.IdFilmu
INNER JOIN Aktorzy a ON a.IdAktorzy = fa.IdAktora
WHERE a.ImieNazwisko = 'Tom Hanks'

--10.Którzy aktorzy grali w przynajmniej dwóch filmach?

SELECT a.ImieNazwisko, COUNT(*) AS Liczba_filmow
FROM Aktorzy a
INNER JOIN Film_Aktor fa ON fa.IdAktora = a.IdAktorzy
INNER JOIN Filmy f ON f.IdFilmy = a.IdAktorzy
GROUP BY a.ImieNazwisko
HAVING COUNT(*) >=2

-- 11. W filmach z jakiego gatunku grał Morgan Freeman?

SELECT DISTINCT g.Nazwa
FROM Gatunek g
INNER JOIN Film_Gatunek fg ON fg.IdGatunku = g.IdGatunek
INNER JOIN Film_Aktor fa ON fa.IdFilmu = fg.IdFilmu
INNER JOIN Aktorzy a ON a.IdAktorzy = fa.IdAktora
WHERE a.ImieNazwisko = 'Morgan Freeman'

--12. Kto jest najmłodszym aktorem grającym w Fajerwerkach próżności?

SELECT TOP 1 a.ImieNazwisko, a.DataUrodzenia
FROM Aktorzy a
INNER JOIN Film_Aktor fa ON fa.IdAktora = a.IdAktorzy
INNER JOIN Filmy f ON f.IdFilmy = fa.IdFilmu
WHERE f.Tytul = 'Fajerwerki próżności' 
ORDER BY a.DataUrodzenia DESC 

--13. Znajdź aktorów, którzy zagrali w więcej niż jednym filmie

SELECT a.ImieNazwisko
FROM Aktorzy a
INNER JOIN Film_Aktor fa ON fa.IdAktora = a.IdAktorzy
GROUP BY a.ImieNazwisko 
HAVING COUNT(*) > 1

-- 14. Ile trwał najkrótszy a ile najdłuższy film

SELECT MAX(CzasTrwania_min) AS najdluzszy_film, Min(CzasTrwania_min) AS najkrotszy_film
FROM Filmy

-- 15. Ile filmów było wyprodukowanych w każdym roku

SELECT RokProdukcji, COUNT(*) as liczba_filmow
FROM Filmy
GROUP BY RokProdukcji
