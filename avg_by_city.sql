/*
Project: Hotel Pricing Patterns
Query: Ranking each city in the dataset by highest-to-lowest average hotel price, separating average price by proximity to the city center.
Author: Frank Sacco
Date: September 2025

Description: Query 1 calculates the average hotel price per city and ranks cities from most expensive to least expensive.
Query 2 buckets hotels into proximity groups (Close, Nearby, Far) based on their distance from the city center, then calculates the average price for each group.
Business Goal: Identifying which cities are the costliest travel destinations, and examining how location can impact pricing.
Are central hotels always more expensive? Can guests save more by staying farther away?
*/

-- 1 
WITH price_avg AS (
SELECT AVG(p.price) AS avg_price, f.city
FROM features f
JOIN prices p ON f.hotel_id = p.hotel_id
GROUP BY f.city
)

SELECT *,
RANK() OVER (ORDER BY avg_price DESC)
FROM price_avg;

-- 2
SELECT AVG(p.price) AS avg_price,
CASE
WHEN f.distance <2 THEN 'Close'
WHEN f.distance >2 AND f.distance <4 THEN 'Nearby'
WHEN f.distance >4 THEN 'Far'
END AS proximity
FROM features f
JOIN prices p ON f.hotel_id = p.hotel_id
GROUP BY proximity
ORDER BY avg_price;
