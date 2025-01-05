# Projekt SQL – Primární tabulka

Autor: Václav Cieslar  
Název SQL skriptu: Script-1.sql

## Popis projektu
V rámci tohoto projektu jsem vytvořil tabulku t_vaclav_cieslar_project_sql_primary_final, která obsahuje data o:
- Průměrné mzdě v jednotlivých odvětvích v České republice,
- Cenách potravin podle kategorií ve stejném období.

## Obsah tabulky

| Sloupec             | Popis                   |
|---------------------|-------------------------|
| year              | Rok                       |
| industry_name     | Název odvětví.            |
| average_wage      | Průměrná mzda v odvětví.  |
| food_category     | Kategorie potravin.       |
| average_food_price| Průměrná cena potravin.   |

## Kroky v SQL skriptu

1. Vytvoření tabulky:
   - Skript nejdříve vytvoří tabulku se sloupci podle zadání.

2. Naplnění tabulky:
   - Data o mzdách pochází z tabulky czechia_payroll.
   - Data o cenách potravin pochází z tabulky czechia_price.
   - Obě tabulky jsou propojeny podle společného roku (year).

3. Agregace dat:
   - Použil jsem AVG pro výpočet průměrných hodnot a GROUP BY pro seskupení dat.

