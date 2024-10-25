-- Joining both tables COVID DEATHS and COVID VACCINATIONS

--JOINING THE TWO TABLES COVID-DEATHS AND COVID-VACCINATIONS
--BASED ON THE LOCATION AND THE DATE
SELECT *
FROM PortfolioProject..[Covid-deaths-working] CDea
JOIN PortfolioProject..[Covid-vaccinations-working] CVac
	ON CDea.location = CVac.location
	AND CDea.date = CVac.date
ORDER BY 3,4

--JOINING THE TWO TABLES COVID-DEATHS AND COVID-VACCINATIONS
--BASED ON THE LOCATION AND THE DATE
--AND LOOKING AT THE TOTAL POPULATIONS AND THE VACCINATED PEOPLE
SELECT CDea.continent, CDea.location, CDea.date, CDea.population, CVac.new_vaccinations
FROM PortfolioProject..[Covid-deaths-working] CDea
JOIN PortfolioProject..[Covid-vaccinations-working] CVac
	ON CDea.location = CVac.location
	AND CDea.date = CVac.date
WHERE CDea.continent IS NOT NULL
ORDER BY 2,3

--JOINING THE TWO TABLES COVID-DEATHS AND COVID-VACCINATIONS for the location 'PAKISTAN'
--BASED ON THE LOCATION AND THE DATE
--AND LOOKING AT THE TOTAL POPULATIONS AND THE VACCINATED PEOPLE
SELECT CDea.continent, CDea.location, CDea.date, CDea.population, CVac.new_vaccinations
FROM PortfolioProject..[Covid-deaths-working] CDea
JOIN PortfolioProject..[Covid-vaccinations-working] CVac
	ON CDea.location = CVac.location
	AND CDea.date = CVac.date
WHERE CDea.continent IS NOT NULL AND CDea.location = 'Pakistan'
ORDER BY 2,3

--JOINING THE TWO TABLES COVID-DEATHS AND COVID-VACCINATIONS
--BASED ON THE LOCATION AND THE DATE
--AND LOOKING AT THE TOTAL POPULATIONS AND THE VACCINATED PEOPLE
SELECT CDea.continent, CDea.location, CDea.date, CDea.population, CVac.new_vaccinations
, SUM(CVac.new_vaccinations)
	OVER (
		PARTITION BY CDea.location
		ORDER BY CDea.location, CDea.date
	) AS RollingPeopleVaccinated
FROM PortfolioProject..[Covid-deaths-working] CDea
JOIN PortfolioProject..[Covid-vaccinations-working] CVac
	ON CDea.location = CVac.location
	AND CDea.date = CVac.date
WHERE CDea.continent IS NOT NULL
ORDER BY 2,3

--JOINING THE TWO TABLES COVID-DEATHS AND COVID-VACCINATIONS for the location 'PAKISTAN'
--BASED ON THE LOCATION AND THE DATE
--AND LOOKING AT THE TOTAL POPULATIONS AND THE VACCINATED PEOPLE
SELECT CDea.continent, CDea.location, CDea.date, CDea.population, CVac.new_vaccinations
, SUM(CVac.new_vaccinations)
	OVER (
		PARTITION BY CDea.location
		ORDER BY CDea.location, CDea.date
	) AS RollingPeopleVaccinated
FROM PortfolioProject..[Covid-deaths-working] CDea
JOIN PortfolioProject..[Covid-vaccinations-working] CVac
	ON CDea.location = CVac.location
	AND CDea.date = CVac.date
WHERE CDea.continent IS NOT NULL AND CDea.location = 'Pakistan'
ORDER BY 2,3
