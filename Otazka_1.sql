SELECT 
    industry_name, 
    MIN(year) AS first_year,
    MAX(year) AS last_year,
    MAX(CASE WHEN year = (SELECT MIN(year) FROM t_vaclav_cieslar_project_sql_primary_final) THEN average_wage END) AS first_wage,
    MAX(CASE WHEN year = (SELECT MAX(year) FROM t_vaclav_cieslar_project_sql_primary_final) THEN average_wage END) AS last_wage,
    (MAX(CASE WHEN year = (SELECT MAX(year) FROM t_vaclav_cieslar_project_sql_primary_final) THEN average_wage END) - 
     MAX(CASE WHEN year = (SELECT MIN(year) FROM t_vaclav_cieslar_project_sql_primary_final) THEN average_wage END)) AS wage_change
FROM t_vaclav_cieslar_project_sql_primary_final
GROUP BY industry_name
ORDER BY wage_change DESC;