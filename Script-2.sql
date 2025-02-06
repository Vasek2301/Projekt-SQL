CREATE TABLE t_vaclav_cieslar_project_sql_secondary_final (
    year INT,
    region VARCHAR(255),
    population BIGINT,
    unemployment_rate DECIMAL(5, 2),
    gdp DECIMAL(15, 2)
);

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'demographics';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'economies';

SELECT 
    year, 
    country AS region, 
    population, 
    fertility AS unemployment_rate
FROM demographics
WHERE population IS NOT NULL AND fertility IS NOT NULL;

SELECT 
    year, 
    country, 
    gdp
FROM economies
WHERE gdp IS NOT NULL;

INSERT INTO t_vaclav_cieslar_project_sql_secondary_final (year, region, population, unemployment_rate, gdp)
SELECT 
    CAST(demographics.year AS BIGINT), 
    demographics.country AS region,
    demographics.population,
    demographics.fertility AS unemployment_rate,
    (economies.gdp / 1e9) AS gdp
FROM demographics
JOIN economies
ON CAST(demographics.year AS BIGINT) = economies.year
   AND demographics.country = economies.country
WHERE demographics.population IS NOT NULL 
  AND demographics.fertility IS NOT NULL 
  AND economies.gdp IS NOT NULL;