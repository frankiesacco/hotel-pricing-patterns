/*
Project: Hotel Pricing Patterns
Query: Hotel price by city separated in quartiles, hotel prices by city ranked least-to-most expensive
Author: Frank Sacco
Date: September 2025

Description: Query 1 ranks hotel prices within each city into quartiles, dividing the distribution of prices into four equal groups.
Query 1 assigns a unique row number to each hotel in a city, ordered by price from lowest to highest. 
The result can be filtered to highlight the single cheapest hotel in each city.
Business Goal: Identify how hotel prices are distributed across different cities, as well as find the most affordable option in each city.
*/

-- 1
SELECT p.price, f.city, 
NTILE(4) OVER (PARTITION BY f.city ORDER BY p.price DESC) AS quartile 
FROM features f 
JOIN prices p ON f.hotel_id = p.hotel_id;

-- 2
SELECT p.price, f.city, f.hotel_id, 
ROW_NUMBER() OVER (PARTITION BY f.city ORDER BY p.price ASC) AS least_expensive 
FROM features f 
JOIN prices p ON f.hotel_id = p.hotel_id
