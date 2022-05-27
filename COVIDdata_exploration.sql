-- have a look at covid deaths tables
select *
from CovidData..covid_death
where continent is not null
order by 4

-- have a look at covid vaccinations table
select *
from CovidData..covid_vaccinations
where continent is not null
order by 4

-- view location, date, total cases, new cases total deaths and population
select location, date, total_cases, new_cases, total_deaths, population
from CovidData..covid_death
where continent is not null
order by 1,2

-- looking at total_cases vs total_deaths by day
-- and death rate amoung infected
-- I chose the country I'm from
-- can be any country
select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as death_rate
from CovidData..covid_death
where location='Uzbekistan' -- change this to your country
order by 2

-- total_cases vs population in UZB by day
select location, date, total_cases, population, (total_cases/population)*100 as infection_rate
from CovidData..covid_death
where location='Uzbekistan'
order by 2


-- query for tableu dashboard
-- Countries with the highest infection rate total
select  location, population, MAX(total_cases) as num_infected, MAX((total_cases/population))*100 as infection_rate
from CovidData..covid_death 
where continent is not null
group by location, population
order by 4 desc

-- query for tableu dashboard
-- infection rate in countries by day
select  location, population, date, MAX(total_cases) as num_infected, MAX((total_cases/population))*100 as infection_rate
from CovidData..covid_death 
where continent is not null
group by location, population, date
order by infection_rate desc  -- not neccessary

-- Countries with the highest death count
select  location, MAX(cast(total_deaths as int)) as num_deaths
from CovidData..covid_death 
where continent is not null
group by location
order by num_deaths desc

-- Countries with highest death rate amoung infected
select  location, population, MAX(total_cases) as total_cases, MAX(cast(total_deaths as int)) as total_deaths, 
        MAX(total_deaths)/MAX(total_cases)*100 as death_rate
from CovidData..covid_death 
where continent is not null
group by location, population
order by death_rate desc
-- Norht Korea has 6200% death rate with 1 reported sick and 62 reported deaths from COVID

-- query for tableu dashboard
-- world total cases, deaths and death rate amoung the infected
select SUM(new_cases) as world_total_cases, SUM(cast(new_deaths as int)) as world_total_deaths,
       SUM(cast(new_deaths as int))/SUM(new_cases)*100 as death_rate   
from CovidData..covid_death
where continent is not null


-- query for tableu dashboard
--  death count by continents
select  location, MAX(cast(total_deaths as int)) as num_deaths
from CovidData..covid_death 
where (continent is null) and 
      (location not in ('World','High income','Upper middle income','Lower middle income','European Union','Low income','International'))
group by location
order by num_deaths desc

-- cases, deaths, infection rate in the world and death rate amoung infected in the world by date
select date, SUM(total_cases) as world_total_cases, SUM(cast(total_deaths as int)) as world_total_deaths,
       SUM(total_cases)/SUM(population)*100 as world_infection_rate, SUM(cast(total_deaths as int))/SUM(total_cases)*100 as death_rate   
from CovidData..covid_death
where continent is not null
group by date
order by date

-- new cases, new deaths and death rate amoung infected per day in the world
select date, SUM(new_cases) as world_new_cases, SUM(cast(new_deaths as int)) as world_new_deaths,
       SUM(cast(new_deaths as int))/SUM(new_cases)*100 as death_rate_per_day   
from CovidData..covid_death
where continent is not null
group by date
order by date


-- country population vs new vaccinations per day
select d.location, d.date, d.population, v.new_vaccinations
from CovidData..covid_death as d
join CovidData..covid_vaccinations as v 
on d.location=v.location and d.date=v.date
where d.continent is not null
order by 1,2



-- country population, new vaccinations per day and rolling sum of vaccinations
select d.location, d.date, d.population, v.new_vaccinations,
SUM(convert(bigint, v.new_vaccinations)) over (partition by d.location order by d.date) as total_vaccinations
from CovidData..covid_death as d
join CovidData..covid_vaccinations as v on d.location=v.location and d.date=v.date
where d.continent is not null
order by 1,2


-- percentage of vaccinated people in countries with CTE
with pop_vac(location,date,population,new_vaccinations,total_vaccinations)
as (
select d.location, d.date, d.population, v.new_vaccinations,
SUM(convert(bigint, v.new_vaccinations)) over (partition by d.location order by d.date) as total_vaccinations
from CovidData..covid_death as d
join CovidData..covid_vaccinations as v on d.location=v.location and d.date=v.date
where d.continent is not null
)
select *, total_vaccinations/population*100 as vaccination_rate
from pop_vac
order by 1,2

-- query for tableu dashboard
-- total vaccination rate in different counties
select  d.location, d.population, MAX(v.total_vaccinations) as num_vaccinated, MAX((v.total_vaccinations/d.population))*100 as vaccination_rate
from CovidData..covid_death as d
join CovidData..covid_vaccinations as v on d.location=v.location
where d.continent is not null
group by d.location, d.population
order by 4 desc

-- create view to store some data 
create view populationvaccinated as
select death.location, death.date, death.population, vaccination.new_vaccinations,
       SUM(convert(numeric, vaccination.new_vaccinations)) over (partition by death.location order by death.date) as total_vaccinations
from covid_death as death
join covid_vaccinations as vaccination on death.location=vaccination.location and death.date=vaccination.date
where death.continent is not null