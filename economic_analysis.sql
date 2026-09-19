-- Query 1: Top 10 Countries by Average GDP Growth
SELECT "Country Name", 
       ROUND(AVG("GDP_Growth")::numeric, 2) AS avg_gdp_growth
FROM economic_indicators
WHERE "GDP_Growth" IS NOT NULL
GROUP BY "Country Name"
ORDER BY avg_gdp_growth DESC
LIMIT 10;

-- Query 2: Worst Economies by Average GDP Growth
SELECT "Country Name", 
       ROUND(AVG("GDP_Growth")::numeric, 2) AS avg_gdp_growth
FROM economic_indicators
WHERE "GDP_Growth" IS NOT NULL
GROUP BY "Country Name"
ORDER BY avg_gdp_growth ASC
LIMIT 10;

-- Query 3: Countries with Highest Inflation
SELECT "Country Name", 
       ROUND(AVG("Inflation")::numeric, 2) AS avg_inflation
FROM economic_indicators
WHERE "Inflation" IS NOT NULL
GROUP BY "Country Name"
ORDER BY avg_inflation DESC
LIMIT 10;

-- Query 4: Countries with Highest Unemployment
SELECT "Country Name", 
       ROUND(AVG("Unemployment")::numeric, 2) AS avg_unemployment
FROM economic_indicators
WHERE "Unemployment" IS NOT NULL
GROUP BY "Country Name"
ORDER BY avg_unemployment DESC
LIMIT 10;

-- Query 5: Countries Most Affected by COVID in 2020
SELECT "Country Name", 
       ROUND("GDP_Growth"::numeric, 2) AS gdp_2020
FROM economic_indicators
WHERE "Year" = 2020
AND "GDP_Growth" IS NOT NULL
ORDER BY gdp_2020 ASC
LIMIT 10;

-- Query 6: Fastest Recovering Countries After COVID in 2021
SELECT "Country Name", 
       ROUND("GDP_Growth"::numeric, 2) AS gdp_2021
FROM economic_indicators
WHERE "Year" = 2021
AND "GDP_Growth" IS NOT NULL
ORDER BY gdp_2021 DESC
LIMIT 10;

-- Query 7: Relationship Between Inflation and GDP Growth
SELECT "Country Name", 
       ROUND(AVG("GDP_Growth")::numeric, 2) AS avg_gdp_growth,
       ROUND(AVG("Inflation")::numeric, 2) AS avg_inflation
FROM economic_indicators
WHERE "Inflation" IS NOT NULL
AND "GDP_Growth" IS NOT NULL
GROUP BY "Country Name"
ORDER BY avg_inflation DESC
LIMIT 15;

-- Query 8: Year over Year GDP Change
SELECT "Country Name", "Year", "GDP_Growth", LAG("GDP_Growth") OVER(PARTITION BY "Country Name" ORDER BY "Year") AS prev_gdp, "GDP_Growth" - LAG("GDP_Growth") OVER(PARTITION BY "Country Name" ORDER BY "Year") AS gdp_change
FROM economic_indicators
WHERE "GDP_Growth" IS NOT NULL AND "Country Name" IS NOT NULL
ORDER BY "Country Name", "Year"
LIMIT 15;

-- Query 9: 2008 vs 2020 Crisis Comparison
SELECT "Country Name",        
		AVG(CASE WHEN "Year" IN (2008,2009) THEN "GDP_Growth" END) AS crisis_2008,
		AVG(CASE WHEN "Year" IN (2020,2021) THEN "GDP_Growth" END) AS crisis_2020,
		CASE WHEN AVG(CASE WHEN "Year" IN (2008,2009) THEN "GDP_Growth" END) <
				  AVG(CASE WHEN "Year" IN (2020,2021) THEN "GDP_Growth" END)
				  THEN '2008 was worse'
				  ELSE '2020 was worse'
		END AS worse_crisis
FROM economic_indicators
GROUP BY "Country Name" 
HAVING AVG(CASE WHEN "Year" IN (2008,2009) THEN "GDP_Growth" END) IS NOT NULL
AND AVG(CASE WHEN "Year" IN (2020,2021) THEN "GDP_Growth" END) IS NOT NULL
ORDER BY crisis_2020 ASC

--Query 10: Regional Analysis
SELECT "Region", ROUND(AVG("GDP_Growth"):: numeric, 2) AS avg_gdp_growth, ROUND(AVG("Inflation"):: numeric, 2) AS avg_inflation
FROM economic_indicators
WHERE "GDP_Growth" IS NOT NULL AND "Inflation" IS NOT NULL AND "Region" != 'Other'
GROUP BY "Region"
ORDER BY avg_gdp_growth DESC
