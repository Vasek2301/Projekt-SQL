SELECT 
    p.industry_name,
    MIN(p.year) AS first_year,
    MAX(p.year) AS last_year,
    (SELECT average_wage 
     FROM t_vaclav_cieslar_project_sql_primary_final 
     WHERE year = (SELECT MIN(year) FROM t_vaclav_cieslar_project_sql_primary_final)
     AND industry_name = p.industry_name
     LIMIT 1) AS first_wage,
    (SELECT average_wage 
     FROM t_vaclav_cieslar_project_sql_primary_final 
     WHERE year = (SELECT MAX(year) FROM t_vaclav_cieslar_project_sql_primary_final)
     AND industry_name = p.industry_name
     LIMIT 1) AS last_wage,
    ((SELECT average_wage 
      FROM t_vaclav_cieslar_project_sql_primary_final 
      WHERE year = (SELECT MAX(year) FROM t_vaclav_cieslar_project_sql_primary_final)
      AND industry_name = p.industry_name
      LIMIT 1) -
     (SELECT average_wage 
      FROM t_vaclav_cieslar_project_sql_primary_final 
      WHERE year = (SELECT MIN(year) FROM t_vaclav_cieslar_project_sql_primary_final)
      AND industry_name = p.industry_name
      LIMIT 1)) AS wage_change
FROM t_vaclav_cieslar_project_sql_primary_final p
GROUP BY p.industry_name
ORDER BY wage_change DESC;
