--Poka� wszystkie filmy--
Select *
From Filmy

--Poka� wszystkich aktor�w--
Select ImieNazwisko
from Aktorzy

--Poka� nazwy kraj�w--
Select Kraj
from Kraje

--Ile zorganizowano wydarze�?--
Select COUNT(*) AS Ilosc_Wydarzen
From Wydarzenie

--Poka� �redni� ocen--
Select AVG(Ocena) AS Srednia_Ocen
From Recenzje

--Poka� tytu�y film�w traj�cych co najmniej dwie godziny--
Select Tytul
From Filmy
where CzasTrwania_min >= 120

--Poka� aktor�w urodzonych po 1960 roku--
Select ImieNazwisko
From Aktorzy
where YEAR(DataUrodzenia) > 1960 

--Ilu jest aktor�w urodzonych w kwietniu?--
Select COUNT(*) AS Ilosc
From Aktorzy
Where MONTH(DataUrodzenia) = 04

--Ile film�w zosta�o wyprodukowanych w 2002 roku?--

Select COUNT(*) AS Ilosc
From Filmy 
Where RokProdukcji = 2002

--Ilu aktor�w urodzi�o si� w latach 70-tych?--
Select COUNT(*) AS Ilosc
From Aktorzy
Where YEAR(DataUrodzenia) between 1970 and 1979

--Poka� tytu�y 3 najnowszych film�w --

Select top 3 Tytul
From Filmy
order by RokProdukcji desc

--Poka� dw�ch najm�odszych aktor�w --

Select top 2 ImieNazwisko
From Aktorzy
Order by DataUrodzenia desc

--Poka� filmy, kt�rych tytu�y zaczynaj� si� na liter� S--
select Tytul
from Filmy
where Tytul like 's%'

SELECT * FROM Filmy WHERE LEFT(Tytul, 1) = 'S'

--Poka� filmy wyprodukowane po roku 2000 trwaj�ce mniej ni� 2 godziny'

Select Tytul
From Filmy
Where RokProdukcji > 2000 and CzasTrwania_min < 120

--Ile film�w by�o wyprodukowanych w ka�dym roku?
 
select RokProdukcji, COUNT(*) as ilosc
from Filmy
group by RokProdukcji



