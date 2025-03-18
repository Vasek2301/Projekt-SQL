SELECT 
    w.year,
    ROUND(((w.avg_wage - w.prev_year_wage) / w.prev_year_wage) * 100, 2) AS wage_growth_percent,
    ROUND(((f.avg_price - f.prev_year_price) / f.prev_year_price) * 100, 2) AS food_price_growth_percent,
    ROUND(((f.avg_price - f.prev_year_price) / f.prev_year_price) * 100 - 
          ((w.avg_wage - w.prev_year_wage) / w.prev_year_wage) * 100, 2) AS difference
FROM 
    (SELECT 
        year,
        AVG(average_wage) AS avg_wage,
        LAG(AVG(average_wage)) OVER (ORDER BY year) AS prev_year_wage
    FROM t_vaclav_cieslar_project_sql_primary_final
    GROUP BY year) w
JOIN 
    (SELECT 
        year,
        AVG(average_food_price) AS avg_price,
        LAG(AVG(average_food_price)) OVER (ORDER BY year) AS prev_year_price
    FROM t_vaclav_cieslar_project_sql_primary_final
    GROUP BY year) f
ON w.year = f.year
WHERE ((f.avg_price - f.prev_year_price) / f.prev_year_price) * 100 
      > ((w.avg_wage - w.prev_year_wage) / w.prev_year_wage) * 100 + 10;