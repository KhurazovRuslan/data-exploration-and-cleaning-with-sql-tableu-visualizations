<h1>Data exploration and cleaning with SQL and visualizations with Tableau.</h1>

This project is created to show knowledge of data manipulation using SQL and visualizations with Tableau. The project consists of three separate parts: COVID data exploration with SQL, Tableau visualizations of COVID data and Nashville housing data cleaning wih SQL.
<div class="row">
  <div class="column">
    <a href='https://public.tableau.com/app/profile/ruslan.khurazov/viz/COVID_data_numbers/Dashboard1'><img src="https://github.com/KhurazovRuslan/data-exploration-and-cleaning-with-sql-tableu-visualizations/blob/main/data/Dashboard%201.png" alt="COVID numbers" style="width:90%"></a>
  </div>
  <div class="column">
    <a href='https://public.tableau.com/app/profile/ruslan.khurazov/viz/COVID_data_maps/Dashboard2'><img src="https://github.com/KhurazovRuslan/data-exploration-and-cleaning-with-sql-tableu-visualizations/blob/main/data/Dashboard%202.png" alt="COVID maps" style="width:90%"></a>
  </div>
</div>

<h2>Software used in the project:</h2>
<li>Microsoft SQL Server Management Studio v.18.11.1</li>
<li>Tableau Public 2022.1</li>

<h2>Data:</h2>
<li><a href='https://github.com/KhurazovRuslan/data-exploration-and-cleaning-with-sql-tableu-visualizations/blob/main/data/CovidDeath.xlsx'>CovidDeath.xlsx</a> and <a href='https://github.com/KhurazovRuslan/data-exploration-and-cleaning-with-sql-tableu-visualizations/blob/main/data/CovidVaccinations.xlsx'>CovidVaccinations.xlsx</a> - both files were created out of data downloaded from <a href='https://ourworldindata.org/covid-deaths'>Our World in Data</a>.<br> 
For <a href='https://github.com/KhurazovRuslan/data-exploration-and-cleaning-with-sql-tableu-visualizations/blob/main/data/CovidDeath.xlsx'>CovidDeath.xlsx</a> file the following columns were kept from the original data: <b><i>'iso_code', 'continent', 'location', 'date','population', 'total_cases', 'new_cases',
       'new_cases_smoothed', 'total_deaths', 'new_deaths',
       'new_deaths_smoothed', 'total_cases_per_million',
       'new_cases_per_million', 'new_cases_smoothed_per_million',
       'total_deaths_per_million', 'new_deaths_per_million',
       'new_deaths_smoothed_per_million', 'reproduction_rate', 'icu_patients',
       'icu_patients_per_million', 'hosp_patients',
       'hosp_patients_per_million', 'weekly_icu_admissions',
       'weekly_icu_admissions_per_million', 'weekly_hosp_admissions',
       'weekly_hosp_admissions_per_million'</i></b>. <br>
For <a href='https://github.com/KhurazovRuslan/data-exploration-and-cleaning-with-sql-tableu-visualizations/blob/main/data/CovidVaccinations.xlsx'>CovidVaccinations.xlsx</a> file the following columns were kept from the original data: <b><i>'iso_code', 'continent', 'location', 'date','total_tests', 'new_tests',
       'total_tests_per_thousand', 'new_tests_per_thousand',
       'new_tests_smoothed', 'new_tests_smoothed_per_thousand',
       'positive_rate', 'tests_per_case', 'tests_units', 'total_vaccinations',
       'people_vaccinated', 'people_fully_vaccinated', 'total_boosters',
       'new_vaccinations', 'new_vaccinations_smoothed',
       'total_vaccinations_per_hundred', 'people_vaccinated_per_hundred',
       'people_fully_vaccinated_per_hundred', 'total_boosters_per_hundred',
       'new_vaccinations_smoothed_per_million',
       'new_people_vaccinated_smoothed',
       'new_people_vaccinated_smoothed_per_hundred', 'stringency_index',
       'population', 'population_density', 'median_age', 'aged_65_older',
       'aged_70_older', 'gdp_per_capita', 'extreme_poverty',
       'cardiovasc_death_rate', 'diabetes_prevalence', 'female_smokers',
       'male_smokers', 'handwashing_facilities', 'hospital_beds_per_thousand',
       'life_expectancy', 'human_development_index',
       'excess_mortality_cumulative_absolute', 'excess_mortality_cumulative',
       'excess_mortality', 'excess_mortality_cumulative_per_million'</i></b>.<br>
<h3>Note: data is updated daily on the <a href='https://ourworldindata.org/covid-deaths'>source site</a>, so numbers used in the project are valid on May 25, 2022.</h3>
</li>
<li><a href='https://github.com/KhurazovRuslan/data-exploration-and-cleaning-with-sql-tableu-visualizations/blob/main/data/NashvilleHousingData.xlsx'>NashvilleHousingData.xlsx</a> downloaded from <a href='https://github.com/AlexTheAnalyst/PortfolioProjects/blob/main/Nashville%20Housing%20Data%20for%20Data%20Cleaning.xlsx'>here</a>.</li>

<h2>Other files:</h2>
<li><a href='https://github.com/KhurazovRuslan/data-exploration-and-cleaning-with-sql-tableu-visualizations/blob/main/COVIDdata_exploration.sql'>COVIDdata_exploration.sql</a> - a file that contains SQL queries for data exploration including <b>join, order by and group by statements, max and sum functions and CTE</b>. The results of some of the queries in .sql file were saved to create two dashboards with Tableau Public<br>
<a href='https://public.tableau.com/app/profile/ruslan.khurazov'>My Tableau Public profile</a> where these interactive dashboards can be found.
</li>
<li><a href='https://github.com/KhurazovRuslan/data-exploration-and-cleaning-with-sql-tableu-visualizations/blob/main/nashvillhousing_datacleaning.sql'>nashvillehousing_datacleaning.sql</a> - a file that contains SQL data cleaning queries including filling in NULL values, changing columns' data types, stardardizing values, creating new columns and removing duplicates using CTE.</li>
<br>

<h3>The project resulted in two .sql files with different types of SQL queries for data manipulation and cleaning as well as two interactive Tableau public dashboards.</h3>
