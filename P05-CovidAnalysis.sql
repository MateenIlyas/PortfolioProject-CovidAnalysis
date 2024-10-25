-- Finding Maximum Percentage of Total Cases and Total Population

--Checking the specific columns of COVID DEATHS TABLE
--and Finding the Maximum Total Cases and their Percentage with respect to the Total Population including the continents' data
SELECT location, population
, MAX(total_cases) as TotalCases
, MAX((total_cases / population) * 100) AS MaximumInfectionPercentage
FROM PortfolioProject..[Covid-deaths-working]
GROUP BY location, population
ORDER BY MaximumInfectionPercentage DESC

--Checking the specific columns of COVID DEATHS TABLE
--and Finding the Maximum Total Cases and their Percentage with respect to the Total Population excluding the continents' data
SELECT location, population
, MAX(total_cases) as TotalCases
, MAX((total_cases / population) * 100) AS MaximumInfectionPercentage
FROM PortfolioProject..[Covid-deaths-working]
WHERE continent is not null
GROUP BY location, population
ORDER BY MaximumInfectionPercentage DESC

--Checking the specific columns of COVID DEATHS TABLE
--and Finding the Maximum Total Cases and their Percentage with respect to the Total Population including the continents' data
--and then formatting it USING FORMAT
SELECT location, population
, MAX(total_cases) as TotalCases
, FORMAT(MAX(total_cases / population), 'P') AS MaximumInfectionPercentage
FROM PortfolioProject..[Covid-deaths-working]
GROUP BY location, population
ORDER BY MaximumInfectionPercentage DESC

--Checking the specific columns of COVID DEATHS TABLE
--and Finding the Maximum Total Cases and their Percentage with respect to the Total Population excluding the continents' data
--and then formatting it USING FORMAT
SELECT location, population
, MAX(total_cases) as TotalCases
, FORMAT(MAX(total_cases / population), 'P') AS MaximumInfectionPercentage
FROM PortfolioProject..[Covid-deaths-working]
WHERE continent is not null
GROUP BY location, population
ORDER BY MaximumInfectionPercentage DESC

--Checking the specific columns of COVID DEATHS TABLE
--and Finding the Maximum Total Cases and their Percentage with respect to the Total Population including the continents' data
--, cast it as DECIMAL, and finally CONCAT the percent sign with it
SELECT location, population
, MAX(total_cases) AS TotalCases
, CONCAT(CAST(MAX(CAST(total_cases AS DECIMAL(18, 4))) / CAST(population AS DECIMAL(18, 4)) * 100 AS DECIMAL(18, 4)), '%') AS MaximumInfectionPercentage
FROM PortfolioProject..[Covid-deaths-working]
GROUP BY location, population 
ORDER BY CAST(REPLACE(FORMAT(MAX(CAST(total_cases AS DECIMAL(18, 4))) / CAST(population AS DECIMAL(18, 4)), 'P'), '%', '') AS FLOAT) DESC

--Checking the specific columns of COVID DEATHS TABLE
--and Finding the Maximum Total Cases and their Percentage with respect to the Total Population excluding the continents' data
--, cast it as DECIMAL, and finally CONCAT the percent sign with it
SELECT location, population
, MAX(total_cases) AS TotalCases
, CONCAT(CAST(MAX(CAST(total_cases AS DECIMAL(18, 4))) / CAST(population AS DECIMAL(18, 4)) * 100 AS DECIMAL(18, 4)), '%') AS MaximumInfectionPercentage
FROM PortfolioProject..[Covid-deaths-working]
WHERE continent is not null
GROUP BY location, population 
ORDER BY CAST(REPLACE(FORMAT(MAX(CAST(total_cases AS DECIMAL(18, 4))) / CAST(population AS DECIMAL(18, 4)), 'P'), '%', '') AS FLOAT) DESC

--Checking the specific columns of COVID DEATHS TABLE
--and Finding the Maximum Total Cases and their Percentage with respect to the Total Population including the continents' data
--, then format it USING FORMAT, remove the percent sign using REPLACE
--Lastly, CAST the number as FLOAT to correctly order the data
SELECT location, population
, MAX(total_cases) as TotalCases
, FORMAT(MAX(total_cases / population), 'P') AS MaximumInfectionPercentage
FROM PortfolioProject..[Covid-deaths-working]
GROUP BY location, population
ORDER BY CAST(REPLACE(FORMAT(MAX(total_cases / population), 'P'), '%', '') AS float) DESC

--Checking the specific columns of COVID DEATHS TABLE
--and Finding the Maximum Total Cases and their Percentage with respect to the Total Population excluding the continents' data
--, then format it USING FORMAT, remove the percent sign using REPLACE
--Lastly, CAST the number as FLOAT to correctly order the data
SELECT location, population
, MAX(total_cases) as TotalCases
, FORMAT(MAX(total_cases / population), 'P') AS MaximumInfectionPercentage
FROM PortfolioProject..[Covid-deaths-working]
WHERE continent is not null
GROUP BY location, population
ORDER BY CAST(REPLACE(FORMAT(MAX(total_cases / population), 'P'), '%', '') AS float) DESC
