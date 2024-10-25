-- Joining both tables COVID DEATHS and COVID VACCINATIONS and making a CTE to find Percentage

--JOINING THE TWO TABLES COVID-DEATHS AND COVID-VACCINATIONS (USING CTE)
--BASED ON THE LOCATION AND THE DATE
--AND LOOKING AT THE PERCENTAGE OF THE VACCINATED PEOPLE WITH RESPECT TO THE TOTAL POPULATIONS
WITH POPvsVAC (Continent, Location, Date, Population, NewVaccinations, RollingVaccinations)
AS (
	SELECT CDea.continent, CDea.location, CDea.date, CDea.population, CVac.new_vaccinations
	, SUM(CVac.new_vaccinations)
		OVER (
			PARTITION BY CDea.location
			ORDER BY CDea.location, CDea.date
		) AS RollingVaccinations
	FROM PortfolioProject..[Covid-deaths-working] CDea
	JOIN PortfolioProject..[Covid-vaccinations-working] CVac
		ON CDea.location = CVac.location
		AND CDea.date = CVac.date
	WHERE CDea.continent IS NOT NULL
)
SELECT *, FORMAT(RollingVaccinations / Population, 'P') as PercentageOfVaccinations
FROM POPvsVAC;

--JOINING THE TWO TABLES COVID-DEATHS AND COVID-VACCINATIONS for the location 'PAKISTAN' (USING CTE)
--BASED ON THE LOCATION AND THE DATE
--AND LOOKING AT THE PERCENTAGE OF THE VACCINATED PEOPLE WITH RESPECT TO THE TOTAL POPULATIONS
WITH POPvsVAC (Continent, Location, Date, Population, NewVaccinations, RollingVaccinations)
AS (
	SELECT CDea.continent, CDea.location, CDea.date, CDea.population, CVac.new_vaccinations
	, SUM(CVac.new_vaccinations)
		OVER (
			PARTITION BY CDea.location
			ORDER BY CDea.location, CDea.date
		) AS RollingVaccinations
	FROM PortfolioProject..[Covid-deaths-working] CDea
	JOIN PortfolioProject..[Covid-vaccinations-working] CVac
		ON CDea.location = CVac.location
		AND CDea.date = CVac.date
	WHERE CDea.continent IS NOT NULL AND CDea.location = 'Pakistan'
)
SELECT *, FORMAT(RollingVaccinations / Population, 'P') as PercentageOfVaccinations
FROM POPvsVAC;
