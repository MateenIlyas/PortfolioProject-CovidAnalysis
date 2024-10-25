-- Finding Total Deaths vs Total Population Percentage

--Checking the specific columns of COVID DEATHS TABLE
--and Finding the Percentage of Total Cases with respect to the Total Population including the continents' data
SELECT location, date, population, total_cases
, ISNULL(total_deaths / NULLIF(total_cases, 0), 0) * 100 AS CasesPercentage
FROM PortfolioProject..[Covid-deaths-working]
ORDER BY 1, 2

--Checking the specific columns of COVID DEATHS TABLE
--and Finding the Percentage of Total Cases with respect to the Total Population excluding the continents' data
SELECT location, date, population, total_cases
, ISNULL(total_deaths / NULLIF(total_cases, 0), 0) * 100 AS CasesPercentage
FROM PortfolioProject..[Covid-deaths-working]
WHERE continent is not null
ORDER BY 1, 2

--Checking the specific columns of COVID DEATHS TABLE for the location 'PAKISTAN'
--and Finding the Percentage of Total Cases with respect to the Total Population
SELECT location, date, population, total_cases
, ISNULL(total_deaths / NULLIF(total_cases, 0), 0) * 100 AS CasesPercentage
FROM PortfolioProject..[Covid-deaths-working]
WHERE location = 'PAKISTAN'
ORDER BY 1, 2

--Checking the specific columns of COVID DEATHS TABLE
--and Finding the Percentage of Total Cases with respect to the Total Population including the continents' data
--and then formatting it USING FORMAT
SELECT location, date, population, total_cases
, FORMAT(((CAST(total_cases AS float)) / (CAST(population AS float))), 'P') AS CasesPercentage
FROM PortfolioProject..[Covid-deaths-working]
ORDER BY 1, 2

--Checking the specific columns of COVID DEATHS TABLE
--and Finding the Percentage of Total Cases with respect to the Total Population excluding the continents' data
--and then formatting it USING FORMAT
SELECT location, date, population, total_cases
, FORMAT(((CAST(total_cases AS float)) / (CAST(population AS float))), 'P') AS CasesPercentage
FROM PortfolioProject..[Covid-deaths-working]
WHERE continent is not null
ORDER BY 1, 2

--Checking the specific columns of COVID DEATHS TABLE for the location 'PAKISTAN'
--and Finding the Percentage of Total Cases with respect to the Total Population
--and then formatting it USING FORMAT
SELECT location, date, population, total_cases
, FORMAT(((CAST(total_cases AS float)) / (CAST(population AS float))), 'P') AS CasesPercentage
FROM PortfolioProject..[Covid-deaths-working]
WHERE location = 'PAKISTAN'
ORDER BY 1, 2
