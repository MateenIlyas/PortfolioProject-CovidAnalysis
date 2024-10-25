-- CREATING VIEWS TO EASILY ACCESS THE RECORDS

--CREATING A VIEW "PercentPeopleVaccinated" TO STORE THE DATA FOR THE DATA VISUALIZATIONS
CREATE VIEW PercentPeopleVaccinated AS
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
