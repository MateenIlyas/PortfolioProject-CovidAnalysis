-- Observing the data in both tables COVID DEATHS and COVID VACCINATIONS

--Checking the COVID DEATHS TABLE
SELECT *
FROM PortfolioProject..[Covid-deaths-working]
ORDER BY 3, 4

--Checking the COVID DEATHS TABLE for the location 'PAKISTAN'
SELECT *
FROM PortfolioProject..[Covid-deaths-working]
WHERE location = 'PAKISTAN'
ORDER BY 3, 4 DESC

--Checking the COVID VACCINATIONS TABLE
SELECT *
FROM PortfolioProject..[Covid-vaccinations-working]
ORDER BY 3, 4

--Checking the COVID VACCINATIONS TABLE for the location 'PAKISTAN'
SELECT *
FROM PortfolioProject..[Covid-vaccinations-working]
WHERE location = 'PAKISTAN'
ORDER BY 3, 4

--Checking the specific columns of COVID DEATHS TABLE
SELECT location, date, total_cases, new_cases, total_deaths, new_deaths, population
FROM PortfolioProject..[Covid-deaths-working]
ORDER BY 1, 2

--Checking the specific columns of COVID DEATHS TABLE for the location 'PAKISTAN'
SELECT location, date, total_cases, new_cases, total_deaths, new_deaths, population
FROM PortfolioProject..[Covid-deaths-working]
WHERE location = 'PAKISTAN'
ORDER BY 1, 2
