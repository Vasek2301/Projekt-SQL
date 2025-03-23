SELECT 
  this.year,
  ROUND(((this.gdp - prev.gdp) / prev.gdp) * 100, 2) AS gdp_growth_percent,
  ROUND(((this.avg_wage - prev.avg_wage) / prev.avg_wage) * 100, 2) AS wage_growth_percent,
  ROUND(((this.avg_price - prev.avg_price) / prev.avg_price) * 100, 2) AS food_price_growth_percent
FROM (
  SELECT 
    s.year,
    AVG(s.gdp) AS gdp,
    AVG(p.average_wage) AS avg_wage,
    AVG(p.average_food_price) AS avg_price
  FROM t_vaclav_cieslar_project_sql_secondary_final s
  JOIN t_vaclav_cieslar_project_sql_primary_final p ON s.year = p.year
  WHERE s.region = 'Czech Republic'
  GROUP BY s.year
) this
JOIN (
  SELECT 
    s.year,
    AVG(s.gdp) AS gdp,
    AVG(p.average_wage) AS avg_wage,
    AVG(p.average_food_price) AS avg_price
  FROM t_vaclav_cieslar_project_sql_secondary_final s
  JOIN t_vaclav_cieslar_project_sql_primary_final p ON s.year = p.year
  WHERE s.region = 'Czech Republic'
  GROUP BY s.year
) prev ON this.year = prev.year + 1
ORDER BY this.year;
