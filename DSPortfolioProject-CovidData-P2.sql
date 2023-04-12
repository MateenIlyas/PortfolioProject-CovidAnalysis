--CHECKING THE TABLE CONTENTS OF COVID-VACCINATIONS
SELECT *
FROM DSPortfolioProject..[Covid-vaccinations-working]

--JOINING THE TWO TABLES COVID-DEATHS AND COVID-VACCINATIONS
--BASED ON THEIR LOCATION AND THE DATE
SELECT *
FROM DSPortfolioProject..[Covid-deaths-working] CDea
JOIN DSPortfolioProject..[Covid-vaccinations-working] CVac
	ON CDea.location = CVac.location
	AND CDea.date = CVac.date

--JOINING THE TWO TABLES COVID-DEATHS AND COVID-VACCINATIONS BASED ON THEIR LOCATION AND THE DATE
--AND LOOKING AT THE TOTAL POPULATIONS AND THE VACCINATED PEOPLE
SELECT CDea.continent, CDea.location, CDea.date, CDea.population, CVac.new_vaccinations
FROM DSPortfolioProject..[Covid-deaths-working] CDea
JOIN DSPortfolioProject..[Covid-vaccinations-working] CVac
	ON CDea.location = CVac.location
	AND CDea.date = CVac.date
WHERE CDea.continent IS NOT NULL
ORDER BY 2,3

--JOINING THE TWO TABLES COVID-DEATHS AND COVID-VACCINATIONS BASED ON THEIR LOCATION AND THE DATE (USING CAST)
--AND LOOKING AT THE TOTAL POPULATIONS AND THE VACCINATED PEOPLE
SELECT CDea.continent, CDea.location, CDea.date, CDea.population, CVac.new_vaccinations
, SUM(CAST(CVac.new_vaccinations AS INT))
	OVER (
		PARTITION BY CDea.location
		ORDER BY CDea.location, CDea.date
	) AS RollingPeopleVaccinated
FROM DSPortfolioProject..[Covid-deaths-working] CDea
JOIN DSPortfolioProject..[Covid-vaccinations-working] CVac
	ON CDea.location = CVac.location
	AND CDea.date = CVac.date
WHERE CDea.continent IS NOT NULL AND CDea.location = 'CANADA'
ORDER BY 2,3

--JOINING THE TWO TABLES COVID-DEATHS AND COVID-VACCINATIONS BASED ON THEIR LOCATION AND THE DATE (USING CONVERT)
--AND LOOKING AT THE TOTAL POPULATIONS AND THE VACCINATED PEOPLE
SELECT CDea.continent, CDea.location, CDea.date, CDea.population, CVac.new_vaccinations
, SUM(CONVERT(INT, CVac.new_vaccinations))
	OVER (
		PARTITION BY CDea.location
		ORDER BY CDea.location, CDea.date
	) AS RollingPeopleVaccinated
FROM DSPortfolioProject..[Covid-deaths-working] CDea
JOIN DSPortfolioProject..[Covid-vaccinations-working] CVac
	ON CDea.location = CVac.location
	AND CDea.date = CVac.date
WHERE CDea.continent IS NOT NULL AND CDea.location = 'CANADA'
ORDER BY 2,3

--JOINING THE TWO TABLES COVID-DEATHS AND COVID-VACCINATIONS BASED ON THEIR LOCATION AND THE DATE
--AND LOOKING AT THE PERCENTAGE OF THE VACCINATED PEOPLE WITH RESPECT TO THE TOTAL POPULATIONS (USING CTE)
WITH POPvsVAC (Continent, Location, Date, Population, NewVaccinations, RollingVaccinations)
AS
(
	SELECT CDea.continent, CDea.location, CDea.date, CDea.population, CVac.new_vaccinations
	, SUM(CAST(CVac.new_vaccinations AS INT))
		OVER (
			PARTITION BY CDea.location
			ORDER BY CDea.location, CDea.date
		) AS RollingVaccinations
	FROM DSPortfolioProject..[Covid-deaths-working] CDea
	JOIN DSPortfolioProject..[Covid-vaccinations-working] CVac
		ON CDea.location = CVac.location
		AND CDea.date = CVac.date
	WHERE CDea.continent IS NOT NULL AND CDea.location = 'CANADA'
)
SELECT *, (RollingVaccinations / Population) * 100 as PercentageOfVaccinations
FROM POPvsVAC

--JOINING THE TWO TABLES COVID-DEATHS AND COVID-VACCINATIONS BASED ON THEIR LOCATION AND THE DATE
--AND LOOKING AT THE PERCENTAGE OF THE VACCINATED PEOPLE WITH RESPECT TO THE TOTAL POPULATIONS (USING TEMP TABLES)
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
	FROM DSPortfolioProject..[Covid-deaths-working] CDea
	JOIN DSPortfolioProject..[Covid-vaccinations-working] CVac
		ON CDea.location = CVac.location
		AND CDea.date = CVac.date
	WHERE CDea.continent IS NOT NULL AND CDea.location = 'CANADA'
SELECT *, (RollingVaccinations / Population) * 100 as PercentageOfVaccinations
FROM #PercentPeopleVaccinated

--CREATING A VIEW "PercentPeopleVaccinated" TO STORE THE DATA FOR THE DATA VISUALIZATIONS
CREATE VIEW PercentPeopleVaccinated AS
SELECT CDea.continent, CDea.location, CDea.date, CDea.population, CVac.new_vaccinations
	, SUM(CAST(CVac.new_vaccinations AS INT))
		OVER (
			PARTITION BY CDea.location
			ORDER BY CDea.location, CDea.date
		) AS RollingVaccinations
	FROM DSPortfolioProject..[Covid-deaths-working] CDea
	JOIN DSPortfolioProject..[Covid-vaccinations-working] CVac
		ON CDea.location = CVac.location
		AND CDea.date = CVac.date
	WHERE CDea.continent IS NOT NULL

