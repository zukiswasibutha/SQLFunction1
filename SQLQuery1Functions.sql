--MetaData Function
Select DB_Name() Current_Database;
Go

--Choose Function
Select Location,Population, Choose(3,'ImbizHosp','RietHosp','ClisedaleHosp') As ChoseHospi, ISNULL(NewCases,'') As GapColumn
From HospDeathPerc;
Go

--Compareing Data if Same from the two columns then returning a Null
Select NULLIF(NewCases,DeathCases) As SameData
From HospDeathPerc;

--Partitioning
Select Location, Population, HighestVaccinated,
Sum(cast(TotalVaccinated as int)) over(Partition By Location Order By Population Asc) As NewRecord
From VaccinStats;
Go




