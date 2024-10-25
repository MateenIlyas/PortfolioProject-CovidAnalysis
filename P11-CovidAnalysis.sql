-- Joining both tables COVID DEATHS and COVID VACCINATIONS and making a TempTable to find Percentage

--JOINING THE TWO TABLES COVID-DEATHS AND COVID-VACCINATIONS (USING TEMP TABLES)
--BASED ON THE LOCATION AND THE DATE
--AND LOOKING AT THE PERCENTAGE OF THE VACCINATED PEOPLE WITH RESPECT TO THE TOTAL POPULATIONS
DROP TABLE IF EXISTS #PercentPeopleVaccinated
CREATE TABLE #PercentPeopleVaccinated
(
	Continent nvarchar(255),
	Location nvarchar(255),
	Date datetime,
	Population numeric,
	NewVaccinations numeric,
	RollingVaccinations numeric
)
INSERT INTO #PercentPeopleVaccinated
SELECT CDea.continent, CDea.location, CDea.date, CDea.population, CVac.new_vaccinations
	, SUM(CAST(CVac.new_vaccinations AS INT))
		OVER (
			PARTITION BY CDea.location
			ORDER BY CDea.location, CDea.date
		) AS RollingVaccinations
	FROM PortfolioProject..[Covid-deaths-working] CDea
	JOIN PortfolioProject..[Covid-vaccinations-working] CVac
		ON CDea.location = CVac.location
		AND CDea.date = CVac.date
	WHERE CDea.continent IS NOT NULL
SELECT *, FORMAT(RollingVaccinations / Population, 'P') as PercentageOfVaccinations
FROM #PercentPeopleVaccinated

--JOINING THE TWO TABLES COVID-DEATHS AND COVID-VACCINATIONS for the location 'PAKISTAN' (USING TEMP TABLES)
--BASED ON THE LOCATION AND THE DATE
--AND LOOKING AT THE PERCENTAGE OF THE VACCINATED PEOPLE WITH RESPECT TO THE TOTAL POPULATIONS
DROP TABLE IF EXISTS #PercentPeopleVaccinated
CREATE TABLE #PercentPeopleVaccinated
(
	Continent nvarchar(255),
	Location nvarchar(255),
	Date datetime,
	Population numeric,
	NewVaccinations numeric,
	RollingVaccinations numeric
)
INSERT INTO #PercentPeopleVaccinated
SELECT CDea.continent, CDea.location, CDea.date, CDea.population, CVac.new_vaccinations
	, SUM(CAST(CVac.new_vaccinations AS INT))
		OVER (
			PARTITION BY CDea.location
			ORDER BY CDea.location, CDea.date
		) AS RollingVaccinations
	FROM PortfolioProject..[Covid-deaths-working] CDea
	JOIN PortfolioProject..[Covid-vaccinations-working] CVac
		ON CDea.location = CVac.location
		AND CDea.date = CVac.date
	WHERE CDea.continent IS NOT NULL AND CDea.location = 'Pakistan'
SELECT *, FORMAT(RollingVaccinations / Population, 'P') as PercentageOfVaccinations
FROM #PercentPeopleVaccinated
