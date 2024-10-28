# PortfolioProject-CovidAnalysis
## SQL Project

---

1. First up, download the source CSV file from "https://ourworldindata.org/covid-deaths"
2. Next, create two separate files, "Covid-Deaths" and "Covid-Vaccinations"
3. Import both CSV files onto the SSMS and create two separate tables

---

> Observe the data within the two tables by using the SQL statements such as SELECT, ORDER BY, and filtering the data using the WHERE condition.<br />
> Similarly, select only the required columns to be worked on.

<br />

> Grouping the data (using GROUP BY command) based on the continent and location shows all continents and their countries.<br />
> All continents and their respective countries can be listed or a specific continent can be chosen too.

<br />

> Calculate the percentage of total deaths to the total cases, but ensure that the denominator is not equal to 0.<br />
> This can be done by using the NULLIF function on the denominator to compare its value with 0.<br />
> Similarly, the ISNULL function can be used to return 0 instead of throwing an error of dividing by 0.<br />
> CAST both values as FLOAT (or at least one of them) before calculating the percentage.<br />
> This is important. Otherwise, the result will be equal to 0, as SQL will not correctly display the value of each percentage.<br />
> Or the FORMAT function can be used to convert the result to percent.<br />
> A similar process can be used to find the percentage of total cases to the total population.

<br />

> Next, find the maximum cases and the maximum percentage of total cases to the total population for each country.<br />
> This can be done using the MAX function and the GROUP BY statement on continent and location.<br />
> To correctly order based on the percentage descendingly, first, the percent sign needs to be taken away using the REPLACE function.<br />
> Next, the value needs to be converted to float by using the CAST function.<br />
> Similarly, the max of total deaths and percentage of total deaths to the total population for each country can be found.

<br />

> Next, the sum of new cases and new deaths can be found using the SUM function.<br />
> It can be grouped on the date column to determine the sum of new cases and new deaths for all countries on each date.<br />
> It should be ordered on the date column so that the data shows up in an ascending manner from earliest to the latest.

<br />

> Join the two tables on the basis of date and location columns so that the vaccination records can be observed for each country.<br />
> First, select all columns of both tables to choose the desired columns for the next query.<br />
> Next, select the continent, location, date, and population from the COVID Deaths table and the new vaccinations column from the COVID Vaccinations table.<br />
> Make sure to filter the data using the continent is NOT NULL condition so that only the countries' data will be selected, excluding the continents' data.<br /> 
> The rolling sum of vaccinations for each country can be calculated by using the SUM function alongside PARTITION BY and the ORDER BY clause inside it.

<br />

> The percentage of new vaccinations to the total population can be calculated by encapsulating the previous query in a CTE.<br />
> Next, we can use the FORMAT function to display the values and the percent sign correctly.

<br />

> A similar task can be achieved via the temp table.<br />
> A temp table can be created by using CREATE TABLE statement and then the temp table should start with # sign.<br />
> In the temp table, the column names and their data types need to be provided.<br />
> Then, the INSERT INTO statement will be used to insert all data into the temp table.<br />
> The temp table can be called using the SELECT statement, and it will display all columns of the temp table.<br />
> The percentage of new vaccinations to the total population can be calculated, and the FORMAT function can be used to convert the value in percentages properly.

<br />

> A VIEW can be created to easily access the records for subsequent usage such as analysis or visualizations, etc.<br />
> For this purpose, we will use the CREATE VIEW [view_name] AS statement, followed by the query.
