-- Finding Total Deaths vs Total Cases Percentage

--Checking the specific columns of COVID DEATHS TABLE
--and Finding the Percentage of Total Deaths with respect to the Total Cases including the continents' data
SELECT location, date, total_cases, total_deaths, ISNULL(total_deaths / NULLIF(total_cases, 0) * 100, 0) AS DeathsPercentage
FROM PortfolioProject..[Covid-deaths-working]
ORDER BY 1, 2

--Checking the specific columns of COVID DEATHS TABLE
--and Finding the Percentage of Total Deaths with respect to the Total Cases excluding the continents' data
SELECT location, date, total_cases, total_deaths, ISNULL(total_deaths / NULLIF(total_cases, 0) * 100, 0) AS DeathsPercentage
FROM PortfolioProject..[Covid-deaths-working]
WHERE continent is not null
ORDER BY 1, 2

--Checking the specific columns of COVID DEATHS TABLE
--and Finding the Percentage of Total Deaths with respect to the Total Cases including the continents' data
--CAST total_deaths and total_cases AS float before division
SELECT location, date, total_cases, total_deaths
, ISNULL((CAST(total_deaths AS float) * 100) / NULLIF((CAST(total_cases AS float)), 0), 0) AS DeathsPercentage
FROM PortfolioProject..[Covid-deaths-working]
ORDER BY 1, 2

--Checking the specific columns of COVID DEATHS TABLE
--and Finding the Percentage of Total Deaths with respect to the Total Cases excluding the continents' data
--CAST total_deaths and total_cases AS float before division
SELECT location, date, total_cases, total_deaths
, ISNULL((CAST(total_deaths AS float) * 100) / NULLIF((CAST(total_cases AS float)), 0), 0) AS DeathsPercentage
FROM PortfolioProject..[Covid-deaths-working]
WHERE continent is not null
ORDER BY 1, 2

--Checking the specific columns of COVID DEATHS TABLE for the location 'PAKISTAN'
--and Finding the Percentage of Total Deaths with respect to the Total Cases
SELECT location, date, total_cases, total_deaths
, ISNULL((CAST(total_deaths AS float) * 100) / NULLIF((CAST(total_cases AS float)), 0), 0) AS DeathsPercentage
FROM PortfolioProject..[Covid-deaths-working]
WHERE location = 'PAKISTAN'
ORDER BY 1, 2

--Checking the specific columns of COVID DEATHS TABLE
--and Finding the Percentage of Total Deaths with respect to the Total Cases including the continents' data
--and then formatting it USING FORMAT
SELECT location, date, total_cases, total_deaths
, FORMAT(ISNULL(total_deaths / NULLIF(total_cases, 0), 0), 'P') AS DeathsPercentage
FROM PortfolioProject..[Covid-deaths-working]
ORDER BY 1, 2

--Checking the specific columns of COVID DEATHS TABLE
--and Finding the Percentage of Total Deaths with respect to the Total Cases excluding the continents' data
--and then formatting it USING FORMAT
SELECT location, date, total_cases, total_deaths
, FORMAT(ISNULL(total_deaths / NULLIF(total_cases, 0), 0), 'P') AS DeathsPercentage
FROM PortfolioProject..[Covid-deaths-working]
WHERE continent is not null
ORDER BY 1, 2

--Checking the specific columns of COVID DEATHS TABLE for the location 'PAKISTAN'
--and Finding the Percentage of Total Deaths with respect to the Total Cases
--and then formatting it USING FORMAT
SELECT location, date, total_cases, total_deaths
, FORMAT(ISNULL(total_deaths / NULLIF(total_cases, 0), 0), 'P') AS DeathsPercentage
FROM PortfolioProject..[Covid-deaths-working]
WHERE location = 'PAKISTAN'
ORDER BY 1, 2
