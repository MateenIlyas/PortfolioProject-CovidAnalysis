-- Finding Percentage of New Deaths and New Cases

--Checking the specific columns of COVID DEATHS TABLE
--and Finding the New Global Cases and New Global Deaths on EACH Day
--and SORTING it on the basis of Date
SELECT date, SUM(new_cases) AS NewGlobalCases
, SUM(new_deaths) AS NewGlobalDeaths
, CONCAT(CAST((SUM(new_deaths) / NULLIF(SUM(new_cases), 0)) * 100 AS DECIMAL(18, 4)), '%') AS NewGlobalDeathsPercentage
FROM PortfolioProject..[Covid-deaths-working]
WHERE continent is not null
GROUP BY date
ORDER BY 1

--Checking the specific columns of COVID DEATHS TABLE
--and Finding the New Global Cases and New Global Deaths on EACH Day, then formatting it USING FORMAT
--and SORTING it on the basis of Date
SELECT date, SUM(new_cases) AS NewGlobalCases
, SUM(new_deaths) AS NewGlobalDeaths
, FORMAT((SUM(new_deaths) / NULLIF(SUM(new_cases), 0)), 'P') AS NewGlobalDeathsPercentage
FROM PortfolioProject..[Covid-deaths-working]
WHERE continent is not null
GROUP BY date
ORDER BY 1

--Checking the specific columns of COVID DEATHS TABLE
--and Finding the Total Global Cases and Total Global Deaths
--and SORTING it on the basis of Date, cast it as DECIMAL, and finally CONCAT the percent sign with it
SELECT SUM(new_cases) AS TotalGlobalCases
, SUM(CAST(new_deaths AS INT)) AS TotalGlobalDeaths
, CONCAT(CAST((SUM(CAST(new_deaths AS INT)) / NULLIF(SUM(new_cases), 0)) * 100 AS DECIMAL(18, 4)), '%') AS TotalGlobalDeathsPercentage
FROM PortfolioProject..[Covid-deaths-working]
WHERE continent is not null AND location != 'High income' AND location != 'Upper middle income' AND location != 'Lower middle income' AND location != 'Low income'
ORDER BY 1

--Checking the specific columns of COVID DEATHS TABLE
--and Finding the Total Global Cases and Total Global Deaths
--and SORTING it on the basis of Date and then formatting it USING FORMAT
SELECT SUM(new_cases) AS TotalGlobalCases
, SUM(new_deaths) AS TotalGlobalDeaths
, FORMAT(SUM(new_deaths) / NULLIF(SUM(new_cases), 0), 'P') AS TotalGlobalDeathsPercentage
FROM PortfolioProject..[Covid-deaths-working]
WHERE continent is not null
ORDER BY 1
