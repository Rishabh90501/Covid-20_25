SELECT * FROM covid_deaths
WHERE continent is not NULL
order by 3,4;

-- Starting from the Covid Deaths Data 

SELECT Location, Date_, total_cases, new_cases, total_deaths, population
FROM covid_deaths
WHERE continent is not NULL
ORDER by 1,2;

-- Looking at Total Cases vs Total Deaths
-- Shows likelihood of dying if you contract covid in India

SELECT Location, Date_, total_cases, total_deaths, (total_deaths/total_cases)*100 as Death_Percentage
FROM covid_deaths
WHERE Location like '%India%'
AND continent is not NULL
ORDER by 1,2;

-- Looking at te Total Cases vs Population

SELECT Location, Date_, total_cases, population, (total_cases/population)*100 as Population_Percentage
FROM covid_deaths
WHERE Location like '%India%'
AND continent is not NULL
ORDER by 1,2;

-- Looking at Countries with Highest Infection Rate compared to Population

SELECT Location, population, MAX(total_cases) as Highest_Infection_Count, MAX((total_cases/population))*100 as Infected_Population_Percentage
FROM covid_deaths
-- WHERE Location like '%India%'
WHERE continent is not NULL
GROUP BY Location, population
ORDER by Infected_Population_Percentage desc;

-- Showing Countries with highest death Count per population

SELECT Location, MAX(total_deaths) as Total_Death_Count
FROM covid_deaths
-- WHERE Location like '%India%'
WHERE Continent is not NULL
GROUP BY Location
ORDER by Total_Death_Count desc;

-- LETS'S BREAK THIS DOWN BY CONTINENT

SELECT Continent, MAX(total_deaths) as Total_Death_Count
FROM covid_deaths
-- WHERE Location like '%India%'
WHERE Continent is not NULL
GROUP BY Continent
ORDER by Total_Death_Count desc;

-- SHOWING CONTINENT WITH THE HIGHEST DEATH COUNT PER POPULATION

SELECT Continent, MAX(total_deaths) as Total_Death_Count
FROM covid_deaths
-- WHERE Location like '%India%'
WHERE Continent is not NULL
GROUP BY Continent
ORDER by Total_Death_Count desc;

-- GLOBAL NUMBERS

SELECT SUM(new_cases) as total_cases, SUM(new_deaths) as total_deaths, SUM(new_deaths)/SUM(new_cases)*100 as DeathPercentage -- , total_deaths, (total_deaths/total_cases)*100 as Death_Percentage
FROM covid_deaths
-- WHERE Location like '%India%'
WHERE continent is not NULL
-- GROUP by Date_
ORDER by 1,2;

SELECT * FROM covid_vacination;

-- LOOKING AT TOTAL POPULATION VS VACCINATIONS

SELECT dea.Continent, dea.Location, dea.Date_, dea.population, vac.new_vaccinations
, SUM(vac.new_vaccinations) OVER (PARTITION by dea.Location ORDER by dea.Location) as Rolling_people_vaccination
, (SUM(vac.new_vaccinations) OVER (PARTITION by dea.Location ORDER by dea.Location))/population*100 as Perc_RPV 
FROM covid_deaths as dea
JOIN covid_vacination as vac
	ON dea.Location = vac.Location
    AND dea.Date_ = vac.Date_
ORDER by 2,3;

-- USE CTE
WITH PopvsVac (Continent, Location, Date_, Population, New_Vaccinations, Rolling_people_vaccination)
as 
(
SELECT dea.Continent, dea.Location, dea.Date_, dea.population, vac.new_vaccinations
, SUM(vac.new_vaccinations) OVER (PARTITION by dea.Location ORDER by dea.Location) as Rolling_people_vaccination
-- , (SUM(vac.new_vaccinations) OVER (PARTITION by dea.Location ORDER by dea.Location))/population*100 as Perc_RPV 
FROM covid_deaths as dea
JOIN covid_vacination as vac
	ON dea.Location = vac.Location
    AND dea.Date_ = vac.Date_
ORDER by 2,3
)
SELECT *, (Rolling_people_vaccination/population)*100 as Perc_RPV
FROM PopvsVac;


-- TEMPT TABLE
CREATE TABLE Percent_Population_Vacination
(
Continent varchar(255),
Location varchar(255),
Date_ datetime,
Population numeric,
New_vaccinations numeric,
Rolling_people_vaccination numeric,
Perc_RPV numeric
);

INSERT INTO Percent_Population_Vacination
SELECT dea.Continent, dea.Location, dea.Date_, dea.population, vac.new_vaccinations
, SUM(vac.new_vaccinations) OVER (PARTITION by dea.Location ORDER by dea.Location)
-- , (SUM(vac.new_vaccinations) OVER (PARTITION by dea.Location ORDER by dea.Location) / dea.population)*100 
FROM covid_deaths as dea
JOIN covid_vacination as vac
	ON dea.Location = vac.Location
    AND dea.Date_ = vac.Date_
ORDER by 2,3;

SELECT * FROM Percent_Population_Vacination;

SELECT *,(Rolling_people_vaccination/Population)*100 as Perc_RPV
FROM Percent_Population_Vacination;

ALTER TABLE Percent_Population_Vacination
DROP COLUMN Perc_RPV;

INSERT INTO Percent_Population_Vacination
(Perc_RPV)
VALUES ((Rolling_people_vaccination/population)*100);
SELECT * FROM Percent_Population_Vacination;

-- Creating View to store data for later visualization

CREATE VIEW Percentage_Population_Vacination as
SELECT *,(Rolling_people_vaccination/Population)*100 as Perc_RPV
FROM Percent_Population_Vacination;
