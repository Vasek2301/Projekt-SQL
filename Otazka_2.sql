SELECT MIN(year) AS first_year, MAX(year) AS last_year
FROM t_vaclav_cieslar_project_sql_primary_final;

SELECT year, ROUND(AVG(average_wage), 0) AS avg_wage
FROM t_vaclav_cieslar_project_sql_primary_final
WHERE year IN (2006, 2018)
GROUP BY year;

SELECT year, food_category, ROUND(AVG(average_food_price), 0) AS avg_price
FROM t_vaclav_cieslar_project_sql_primary_final
WHERE year IN (2006, 2018) 
  AND food_category IN ('Mléko polotučné pasterované', 'Chléb konzumní kmínový')
GROUP BY year, food_category;

SELECT 
    w.year,
    ROUND(w.avg_wage / m.avg_price, 0) AS milk_quantity,
    ROUND(w.avg_wage / b.avg_price, 0) AS bread_quantity
FROM 
    (SELECT year, ROUND(AVG(average_wage), 0) AS avg_wage
     FROM t_vaclav_cieslar_project_sql_primary_final
     WHERE year IN (2006, 2018)
     GROUP BY year) w
JOIN 
    (SELECT year, ROUND(AVG(average_food_price), 0) AS avg_price
     FROM t_vaclav_cieslar_project_sql_primary_final
     WHERE year IN (2006, 2018) 
       AND food_category = 'Mléko polotučné pasterované'
     GROUP BY year) m 
ON w.year = m.year
JOIN 
    (SELECT year, ROUND(AVG(average_food_price), 0) AS avg_price
     FROM t_vaclav_cieslar_project_sql_primary_final
     WHERE year IN (2006, 2018) 
       AND food_category = 'Chléb konzumní kmínový'
     GROUP BY year) b 
ON w.year = b.year;
