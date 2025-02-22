SELECT MIN(year) AS first_year, MAX(year) AS last_year
FROM t_vaclav_cieslar_project_sql_primary_final;

SELECT 
    food_category,
    ROUND(AVG(CASE WHEN year = 2006 THEN average_food_price END), 2) AS first_price,
    ROUND(AVG(CASE WHEN year = 2018 THEN average_food_price END), 2) AS last_price,
    ROUND(((AVG(CASE WHEN year = 2018 THEN average_food_price END) - 
            AVG(CASE WHEN year = 2006 THEN average_food_price END)) /
            AVG(CASE WHEN year = 2006 THEN average_food_price END)) * 100, 0) AS price_change_percent
FROM t_vaclav_cieslar_project_sql_primary_final
GROUP BY food_category
ORDER BY price_change_percent ASC;