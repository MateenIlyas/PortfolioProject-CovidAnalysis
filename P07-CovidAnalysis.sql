-- Finding Maximum Percentage of Total Deaths and Total Population

--Checking the specific columns of COVID DEATHS TABLE
--and Finding the Maximum Total Deaths and their Percentage with respect to the Total Population including the continents' data
--and then formatting it USING FORMAT
SELECT location, population
, MAX(total_deaths) as MaximumDeaths
, FORMAT(MAX(CAST(total_deaths AS float) / population), 'P') AS MaximumDeathPercentage
FROM PortfolioProject..[Covid-deaths-working]
WHERE location is not null
GROUP BY location, population
ORDER BY MaximumDeathPercentage DESC

--Checking the specific columns of COVID DEATHS TABLE
--and Finding the Maximum Total Deaths and their Percentage with respect to the Total Population excluding the continents' data
--and then formatting it USING FORMAT
SELECT location, population
, MAX(total_deaths) as MaximumDeaths
, FORMAT(MAX(CAST(total_deaths AS float) / population), 'P') AS MaximumDeathPercentage
FROM PortfolioProject..[Covid-deaths-working]
WHERE continent is not null
GROUP BY location, population
ORDER BY MaximumDeathPercentage DESC

--Checking the specific columns of COVID DEATHS TABLE
--and Finding the Maximum Total Deaths and their Percentage with respect to the Total Population including the continents' data
--and then formatting it USING FORMAT
SELECT location, population
, MAX((CAST(total_deaths AS float))) as MaximumDeaths
, FORMAT(MAX((CAST(total_deaths AS float))) / (CAST(population AS float)), 'P') AS MaximumDeathPercentage
FROM PortfolioProject..[Covid-deaths-working]
WHERE location is not null
GROUP BY location, population
ORDER BY MaximumDeaths DESC

--Checking the specific columns of COVID DEATHS TABLE
--and Finding the Maximum Total Deaths and their Percentage with respect to the Total Population excluding the continents' data
--and then formatting it USING FORMAT
SELECT location, population
, MAX((CAST(total_deaths AS float))) as MaximumDeaths
, FORMAT(MAX((CAST(total_deaths AS float))) / (CAST(population AS float)), 'P') AS MaximumDeathPercentage
FROM PortfolioProject..[Covid-deaths-working]
WHERE continent is not null
GROUP BY location, population
ORDER BY MaximumDeaths DESC

--Checking the specific columns of COVID DEATHS TABLE
--and Finding the Maximum Total Deaths and their Percentage with respect to the Total Population including the continents' data
--and then formatting it USING FORMAT
SELECT location, population
, MAX((CAST(total_deaths AS float))) as MaximumDeaths
, FORMAT(MAX((CAST(total_deaths AS float))) / (CAST(population AS float)), 'P') AS MaximumDeathPercentage
FROM PortfolioProject..[Covid-deaths-working]
WHERE location is not null
GROUP BY location, population
ORDER BY CAST(REPLACE(FORMAT(MAX(CAST(total_deaths AS float)) / CAST(population AS float), 'P'), '%', '') AS float) DESC

--Checking the specific columns of COVID DEATHS TABLE
--and Finding the Maximum Total Deaths and their Percentage with respect to the Total Population excluding the continents' data
--and then formatting it USING FORMAT
SELECT location, population
, MAX((CAST(total_deaths AS float))) as MaximumDeaths
, FORMAT(MAX((CAST(total_deaths AS float))) / (CAST(population AS float)), 'P') AS MaximumDeathPercentage
FROM PortfolioProject..[Covid-deaths-working]
WHERE continent is not null
GROUP BY location, population
ORDER BY CAST(REPLACE(FORMAT(MAX(CAST(total_deaths AS float)) / CAST(population AS float), 'P'), '%', '') AS float) DESC
