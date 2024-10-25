-- Selecting specific columns, Filtering and Ordering Data

--Checking the specific columns of COVID DEATHS TABLE
--and Finding the countries for North America continent only
SELECT location, continent
FROM PortfolioProject..[Covid-deaths-working]
WHERE continent = 'North America'
GROUP BY location, continent
ORDER BY location

--Checking the specific columns of COVID DEATHS TABLE
--and Finding the countries of all continents
SELECT location, continent
FROM PortfolioProject..[Covid-deaths-working]
WHERE continent is not NULL
GROUP BY location, continent
ORDER BY continent, location
