--Checking the COVID DEATHS TABLE CONTENT
SELECT *
FROM DSPortfolioProject..[Covid-deaths-working]
ORDER BY 3, 4

--Checking the COVID DEATHS TABLE CONTENT in 'PAKISTAN'
SELECT *
FROM DSPortfolioProject..[Covid-deaths-working]
WHERE location = 'PAKISTAN'
ORDER BY 3, 4 DESC

--Checking the COVID VACCINATIONS TABLE CONTENT
SELECT *
FROM DSPortfolioProject..[Covid-vaccinations-working]
ORDER BY 3, 4

--Checking the COVID VACCINATIONS TABLE CONTENT in 'PAKISTAN'
SELECT *
FROM DSPortfolioProject..[Covid-vaccinations-working]
WHERE location = 'PAKISTAN'
ORDER BY 3, 4

--Checking the particular columns of COVID DEATHS TABLE CONTENT
SELECT location, date, total_cases, new_cases, total_deaths, new_deaths, population
FROM DSPortfolioProject..[Covid-deaths-working]
ORDER BY 1, 2

--Checking the particular columns of COVID DEATHS TABLE CONTENT in 'PAKISTAN'
SELECT location, date, total_cases, new_cases, total_deaths, new_deaths, population
FROM DSPortfolioProject..[Covid-deaths-working]
WHERE location = 'PAKISTAN'
ORDER BY 1, 2

--Checking the particular columns of COVID DEATHS TABLE CONTENT
--and Finding the Percentage of Total Deaths with respect to the Total Cases
SELECT location, date, total_cases, total_deaths
, ((CAST (total_deaths AS float)) / (CAST (total_cases AS float))) * 100 AS DeathPercentage
FROM DSPortfolioProject..[Covid-deaths-working]
ORDER BY 1, 2

--Checking the particular columns of COVID DEATHS TABLE CONTENT in 'PAKISTAN'
--and Finding the Percentage of Total Deaths with respect to the Total Cases
SELECT location, date, total_cases, total_deaths
, ((CAST (total_deaths AS float)) / (CAST (total_cases AS float))) * 100 AS DeathPercentage
FROM DSPortfolioProject..[Covid-deaths-working]
WHERE location = 'PAKISTAN'
ORDER BY 1, 2

--Checking the particular columns of COVID DEATHS TABLE CONTENT
--and Finding the Percentage of Total Deaths with respect to the Total Cases
--and then formatting it USING FORMAT
SELECT location, date, total_cases, total_deaths
, FORMAT(((CAST (total_deaths AS float)) / (CAST (total_cases AS float))), 'P') AS DeathPercentage
FROM DSPortfolioProject..[Covid-deaths-working]
ORDER BY 1, 2

--Checking the particular columns of COVID DEATHS TABLE CONTENT in 'PAKISTAN'
--and Finding the Percentage of Total Deaths with respect to the Total Cases
--and then formatting it USING FORMAT
SELECT location, date, total_cases, total_deaths
, FORMAT(((CAST (total_deaths AS float)) / (CAST (total_cases AS float))), 'P') AS DeathPercentage
FROM DSPortfolioProject..[Covid-deaths-working]
WHERE location = 'PAKISTAN'
ORDER BY 1, 2

--Checking the particular columns of COVID DEATHS TABLE CONTENT
--and Finding the Percentage of Total Cases with respect to the Total Population
SELECT location, date, population, total_cases
, ((CAST (total_cases AS float)) / (CAST (population AS float))) * 100 AS CasesPercentage
FROM DSPortfolioProject..[Covid-deaths-working]
ORDER BY 1, 2

--Checking the particular columns of COVID DEATHS TABLE CONTENT in 'PAKISTAN'
--and Finding the Percentage of Total Cases with respect to the Total Population
SELECT location, date, population, total_cases
, ((CAST (total_cases AS float)) / (CAST (population AS float))) * 100 AS CasesPercentage
FROM DSPortfolioProject..[Covid-deaths-working]
WHERE location = 'PAKISTAN'
ORDER BY 1, 2

--Checking the particular columns of COVID DEATHS TABLE CONTENT
--and Finding the Percentage of Total Cases with respect to the Total Population
--and then formatting it USING FORMAT
SELECT location, date, population, total_cases
, FORMAT(((CAST (total_cases AS float)) / (CAST (population AS float))), 'P') AS CasesPercentage
FROM DSPortfolioProject..[Covid-deaths-working]
ORDER BY 1, 2

--Checking the particular columns of COVID DEATHS TABLE CONTENT in 'PAKISTAN'
--and Finding the Percentage of Total Cases with respect to the Total Population
--and then formatting it USING FORMAT
SELECT location, date, population, total_cases
, FORMAT(((CAST (total_cases AS float)) / (CAST (population AS float))), 'P') AS CasesPercentage
FROM DSPortfolioProject..[Covid-deaths-working]
WHERE location = 'PAKISTAN'
ORDER BY 1, 2

--Checking the particular columns of COVID DEATHS TABLE CONTENT
--and Finding the Maximum Total Cases and their Percentage with respect to the Total Population
--and then formatting it USING FORMAT
SELECT location, population
, MAX((CAST (total_cases AS float))) as MaximumCases
, MAX(((CAST (total_cases AS float)) / (CAST (population AS float))) * 100) AS MaximumInfectionPercentage
FROM DSPortfolioProject..[Covid-deaths-working]
GROUP BY location, population
ORDER BY MaximumInfectionPercentage DESC

SELECT location, population
, MAX(CAST(total_cases AS FLOAT)) AS MaximumCases
, CONCAT(CAST(MAX(CAST(total_cases AS DECIMAL(18, 2))) / CAST(population AS DECIMAL(18, 2)) * 100 AS DECIMAL(18, 2)), '%') AS MaximumInfectionPercentage
FROM DSPortfolioProject..[Covid-deaths-working] 
GROUP BY location, population 
ORDER BY CAST(REPLACE(FORMAT(MAX(CAST(total_cases AS DECIMAL(18, 2))) / CAST(population AS DECIMAL(18, 2)), 'P'), '%', '') AS FLOAT) DESC

--Checking the particular columns of COVID DEATHS TABLE CONTENT
--and Finding the Maximum Total Cases and their Percentage with respect to the Total Population
--and then formatting it USING FORMAT
SELECT location, population
, MAX((CAST (total_cases AS float))) as MaximumCases
, FORMAT(MAX((CAST (total_cases AS float))) / (CAST (population AS float)), 'P') AS MaximumInfectionPercentage
FROM DSPortfolioProject..[Covid-deaths-working]
GROUP BY location, population
ORDER BY MaximumInfectionPercentage DESC

SELECT location, population
, MAX((CAST (total_cases AS float))) as MaximumCases
, FORMAT(MAX((CAST (total_cases AS float))) / (CAST (population AS float)), 'P') AS MaximumInfectionPercentage
FROM DSPortfolioProject..[Covid-deaths-working]
GROUP BY location, population
ORDER BY CAST(REPLACE(FORMAT(MAX(CAST(total_cases AS float)) / CAST(population AS float), 'P'), '%', '') AS float) DESC

--Checking the particular columns of COVID DEATHS TABLE CONTENT
--and Finding the Maximum Total Deaths and their Percentage with respect to the Total Population
--and then formatting it USING FORMAT
SELECT location, population
, MAX((CAST (total_deaths AS bigint))) as MaximumDeaths
, MAX((total_deaths / population) * 100) AS MaximumDeathPercentage
FROM DSPortfolioProject..[Covid-deaths-working]
WHERE location is not null
GROUP BY location, population
ORDER BY MaximumDeathPercentage DESC

SELECT location, population
, MAX(CAST(total_deaths AS float)) AS MaximumDeaths
, CONCAT(MAX((total_deaths / population) * 100), '%') AS MaximumDeathPercentage 
FROM DSPortfolioProject..[Covid-deaths-working] 
WHERE location is not null
GROUP BY location, population 
ORDER BY CAST(REPLACE(CONCAT(MAX((total_deaths / population) * 100), '%'), '%', '') AS float) DESC

--Checking the particular columns of COVID DEATHS TABLE CONTENT
--and Finding the Maximum Total Deaths and their Percentage with respect to the Total Population
--and then formatting it USING FORMAT
SELECT location, population
, MAX((CAST (total_deaths AS float))) as MaximumDeaths
, FORMAT(MAX((CAST (total_deaths AS float))) / (CAST (population AS float)), 'P') AS MaximumDeathPercentage
FROM DSPortfolioProject..[Covid-deaths-working]
WHERE location is not null
GROUP BY location, population
ORDER BY MaximumDeaths DESC

SELECT location, population
, MAX((CAST (total_deaths AS float))) as MaximumDeaths
, FORMAT(MAX((CAST (total_deaths AS float))) / (CAST (population AS float)), 'P') AS MaximumDeathPercentage
FROM DSPortfolioProject..[Covid-deaths-working]
WHERE location is not null
GROUP BY location, population
ORDER BY CAST(REPLACE(FORMAT(MAX(CAST(total_deaths AS float)) / CAST(population AS float), 'P'), '%', '') AS float) DESC

--Checking the particular columns of COVID DEATHS TABLE CONTENT
--and Finding the Total Deaths of EACH country
--and SORTING it on the basis of Total Deaths
SELECT location
, MAX((CAST (total_deaths AS bigint))) as TotalDeaths
FROM DSPortfolioProject..[Covid-deaths-working]
WHERE continent is not null
GROUP BY location
ORDER BY TotalDeaths DESC

--Checking the particular columns of COVID DEATHS TABLE CONTENT
--and Finding the Total Deaths of EACH continent
--and SORTING it on the basis of Total Deaths
SELECT location
, MAX((CAST (total_deaths AS bigint))) as TotalDeaths
FROM DSPortfolioProject..[Covid-deaths-working]
WHERE continent is null AND location != 'High income' AND location != 'Upper middle income' AND location != 'Lower middle income' AND location != 'Low income'
GROUP BY location
ORDER BY TotalDeaths DESC

SELECT continent
, MAX(CAST (total_deaths AS bigint)) as TotalDeaths
FROM DSPortfolioProject..[Covid-deaths-working]
WHERE continent is not null
GROUP BY continent
ORDER BY TotalDeaths DESC

--Checking the particular columns of COVID DEATHS TABLE CONTENT
--and Finding the New Global Cases and New Global Deaths on EACH Day
--and SORTING it on the basis of Date
SELECT date, SUM(new_cases) AS NewGlobalCases
, SUM(CAST(new_deaths AS INT)) AS NewGlobalDeaths
, CONCAT(CAST((SUM(CAST(new_deaths AS INT)) / NULLIF(SUM(new_cases), 0)) * 100 AS DECIMAL(18, 2)), '%') AS NewGlobalDeathsPercentage
FROM DSPortfolioProject..[Covid-deaths-working]
WHERE continent is not null AND location != 'High income' AND location != 'Upper middle income' AND location != 'Lower middle income' AND location != 'Low income'
GROUP BY date
ORDER BY 1

--Checking the particular columns of COVID DEATHS TABLE CONTENT
--and Finding the Total Global Cases and Total Global Deaths
--and SORTING it on the basis of Date
SELECT SUM(new_cases) AS TotalGlobalCases
, SUM(CAST(new_deaths AS INT)) AS TotalGlobalDeaths
, CONCAT(CAST((SUM(CAST(new_deaths AS INT)) / NULLIF(SUM(new_cases), 0)) * 100 AS DECIMAL(18, 2)), '%') AS TotalGlobalDeathsPercentage
FROM DSPortfolioProject..[Covid-deaths-working]
WHERE continent is not null AND location != 'High income' AND location != 'Upper middle income' AND location != 'Lower middle income' AND location != 'Low income'
ORDER BY 1
