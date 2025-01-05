CREATE TABLE t_vaclav_cieslar_project_sql_primary_final (
    year INT,
    industry_name VARCHAR(255),
    average_wage DECIMAL(10, 2),
    food_category VARCHAR(255),
    average_food_price DECIMAL(10, 2)
);

SELECT 
    czechia_payroll.payroll_year AS year,
    czechia_payroll_industry_branch.name AS industry_name,
    AVG(czechia_payroll.value) AS average_wage
FROM czechia_payroll
JOIN czechia_payroll_industry_branch
    ON czechia_payroll.industry_branch_code = czechia_payroll_industry_branch.code
WHERE czechia_payroll.value_type_code = 5958
GROUP BY czechia_payroll.payroll_year, czechia_payroll_industry_branch.name;

SELECT 
    EXTRACT(YEAR FROM czechia_price.date_from) AS year,
    czechia_price_category.name AS food_category,
    AVG(czechia_price.value) AS average_food_price
FROM czechia_price
JOIN czechia_price_category
    ON czechia_price.category_code = czechia_price_category.code
GROUP BY EXTRACT(YEAR FROM czechia_price.date_from), czechia_price_category.name;

SELECT 
    payroll_data.year,
    payroll_data.industry_name,
    payroll_data.average_wage,
    food_data.food_category,
    food_data.average_food_price
FROM (
    SELECT 
        czechia_payroll.payroll_year AS year,
        czechia_payroll_industry_branch.name AS industry_name,
        AVG(czechia_payroll.value) AS average_wage
    FROM czechia_payroll
    JOIN czechia_payroll_industry_branch
        ON czechia_payroll.industry_branch_code = czechia_payroll_industry_branch.code
    WHERE czechia_payroll.value_type_code = 5958
    GROUP BY czechia_payroll.payroll_year, czechia_payroll_industry_branch.name
) payroll_data
JOIN (
    SELECT 
        EXTRACT(YEAR FROM czechia_price.date_from) AS year,
        czechia_price_category.name AS food_category,
        AVG(czechia_price.value) AS average_food_price
    FROM czechia_price
    JOIN czechia_price_category
        ON czechia_price.category_code = czechia_price_category.code
    GROUP BY EXTRACT(YEAR FROM czechia_price.date_from), czechia_price_category.name
) food_data
ON payroll_data.year = food_data.year;

INSERT INTO t_vaclav_cieslar_project_sql_primary_final (year, industry_name, average_wage, food_category, average_food_price)
SELECT 
    payroll_data.year,
    payroll_data.industry_name,
    payroll_data.average_wage,
    food_data.food_category,
    food_data.average_food_price
FROM (
    SELECT 
        czechia_payroll.payroll_year AS year,
        czechia_payroll_industry_branch.name AS industry_name,
        AVG(czechia_payroll.value) AS average_wage
    FROM czechia_payroll
    JOIN czechia_payroll_industry_branch
        ON czechia_payroll.industry_branch_code = czechia_payroll_industry_branch.code
    WHERE czechia_payroll.value_type_code = 5958
    GROUP BY czechia_payroll.payroll_year, czechia_payroll_industry_branch.name
) payroll_data
JOIN (
    SELECT 
        EXTRACT(YEAR FROM czechia_price.date_from) AS year,
        czechia_price_category.name AS food_category,
        AVG(czechia_price.value) AS average_food_price
    FROM czechia_price
    JOIN czechia_price_category
        ON czechia_price.category_code = czechia_price_category.code
    GROUP BY EXTRACT(YEAR FROM czechia_price.date_from), czechia_price_category.name
) food_data
ON payroll_data.year = food_data.year;

SELECT * FROM t_vaclav_cieslar_project_sql_primary_final;