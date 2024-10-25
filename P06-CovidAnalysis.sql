-- Finding Maximum Total Deaths of all locations

--Checking the specific columns of COVID DEATHS TABLE
--and Finding the Maximum Total Deaths of all locations including the continents' data
SELECT location, MAX(total_deaths) as TotalDeaths
FROM PortfolioProject..[Covid-deaths-working]
GROUP BY location
ORDER BY TotalDeaths DESC

--Checking the specific columns of COVID DEATHS TABLE
--and Finding the Maximum Total Deaths of all locations excluding the continents' data
SELECT location, MAX(total_deaths) as TotalDeaths
FROM PortfolioProject..[Covid-deaths-working]
WHERE continent is not null
GROUP BY location
ORDER BY TotalDeaths DESC

--Checking the specific columns of COVID DEATHS TABLE
--and Finding the Maximum Total Deaths of continents only
SELECT continent, MAX(total_deaths) as TotalDeaths
FROM PortfolioProject..[Covid-deaths-working]
WHERE continent is not null
GROUP BY continent
ORDER BY TotalDeaths DESC

--Checking the specific columns of COVID DEATHS TABLE
--and Finding the Maximum Total Deaths of continents only by using location
SELECT location, MAX(total_deaths) as TotalDeaths
FROM PortfolioProject..[Covid-deaths-working]
WHERE continent is null
GROUP BY location
ORDER BY TotalDeaths DESC
