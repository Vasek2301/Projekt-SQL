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

# Projekt SQL – Sekundární tabulka
Autor: Václav Cieslar  
Název SQL skriptu: Script-2.sql

## Popis projektu
V rámci tohoto projektu jsem vytvořil tabulku t_vaclav_cieslar_project_sql_secondary_final, která obsahuje dodatečná data o evropských státech. Tato tabulka umožňuje porovnat ekonomické ukazatele jednotlivých zemí, což pomůže odpovědět na otázku, zda má výše HDP vliv na změny ve mzdách a cenách potravin.

## Obsah tabulky
| Sloupec	         |  Popis                                   |
|--------------------|------------------------------------------|
| year	            | Rok                                      |
| region	            | Název země                               |
| population	      | Počet obyvatel                           |
| unemployment_rate	| Míra nezaměstnanosti                     |
| gdp	               | Hrubý domácí produkt (HDP) v miliardách  |

## Kroky v SQL skriptu

1. Vytvoření tabulky
Skript nejprve vytvoří tabulku s výše uvedenými sloupci.

2. Naplnění tabulky
Data pocházejí z tabulek economies a demographics.
Použitý INNER JOIN mezi těmito tabulkami spojuje data podle roku a názvu země.

3. Transformace dat
HDP bylo vyděleno 1 miliardou, aby bylo čitelnější pro analýzu.
Year byl převeden na BIGINT, protože v některých tabulkách byl jako text.

4. Filtrování dat
Vyřazené záznamy s NULL hodnotami v population, unemployment_rate a gdp.

