--Poka¿ wszystkie filmy--
Select *
From Filmy

--Poka¿ wszystkich aktorów--
Select ImieNazwisko
from Aktorzy

--Poka¿ nazwy krajów--
Select Kraj
from Kraje

--Ile zorganizowano wydarzeñ?--
Select COUNT(*) AS Ilosc_Wydarzen
From Wydarzenie

--Poka¿ œredni¹ ocen--
Select AVG(Ocena) AS Srednia_Ocen
From Recenzje

--Poka¿ tytu³y filmów traj¹cych co najmniej dwie godziny--
Select Tytul
From Filmy
where CzasTrwania_min >= 120

--Poka¿ aktorów urodzonych po 1960 roku--
Select ImieNazwisko
From Aktorzy
where YEAR(DataUrodzenia) > 1960 

--Ilu jest aktorów urodzonych w kwietniu?--
Select COUNT(*) AS Ilosc
From Aktorzy
Where MONTH(DataUrodzenia) = 04

--Ile filmów zosta³o wyprodukowanych w 2002 roku?--

Select COUNT(*) AS Ilosc
From Filmy 
Where RokProdukcji = 2002

--Ilu aktorów urodzi³o siê w latach 70-tych?--
Select COUNT(*) AS Ilosc
From Aktorzy
Where YEAR(DataUrodzenia) between 1970 and 1979

--Poka¿ tytu³y 3 najnowszych filmów --

Select top 3 Tytul
From Filmy
order by RokProdukcji desc

--Poka¿ dwóch najm³odszych aktorów --

Select top 2 ImieNazwisko
From Aktorzy
Order by DataUrodzenia desc

--Poka¿ filmy, których tytu³y zaczynaj¹ siê na literê S--
select Tytul
from Filmy
where Tytul like 's%'

SELECT * FROM Filmy WHERE LEFT(Tytul, 1) = 'S'

--Poka¿ filmy wyprodukowane po roku 2000 trwaj¹ce mniej ni¿ 2 godziny'

Select Tytul
From Filmy
Where RokProdukcji > 2000 and CzasTrwania_min < 120

--Ile filmów by³o wyprodukowanych w ka¿dym roku?
 
select RokProdukcji, COUNT(*) as ilosc
from Filmy
group by RokProdukcji



