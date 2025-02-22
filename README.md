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


# Otázka č. 1: Rostou mzdy ve všech odvětvích, nebo v některých klesají?
Podle dat mzdy ve všech odvětvích rostly, žádné nešlo dolů. Největší růst byl v IT a komunikacích (+20 733 Kč), naopak nejpomaleji rostly mzdy v nemovitostech (+9 187 Kč).
Mzdy tedy rostly všude, ale některá odvětví rychleji než jiná. IT šlo nahoru nejvíc, zatímco třeba reality nebo doprava rostly pomaleji.

# Otázka č. 2: Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
V roce 2006 bylo možné si za průměrnou mzdu koupit 1 482 litrů mléka a 1 297 kg chleba, zatímco v roce 2018 to bylo 1 627 litrů mléka a 1 356 kg chleba. To znamená, že dostupnost těchto potravin se za sledované období mírně zlepšila.

# Otázka č. 3: Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
Mezi potraviny s nejpomalejším růstem cen (tedy s nejnižší kladnou procentuální změnou) patří například banány s 7% nárůstem. Naopak některé potraviny, jako cukr krystalový a rajská jablka červená kulatá, v průběhu let dokonce zlevnily.
