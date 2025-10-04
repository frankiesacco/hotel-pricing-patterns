/*
Project: Hotel Pricing Patterns
Query: Average price by holiday vs normal day, average price on weekend vs weekday
Author: Frank Sacco
Date: September 2025

Description: Query 1 returns the average price for each city on holidays compared to normal days,
while Query 2 aims to analyze the average price for each city on weekends vs weekdays.
Business Goal: Measuring the effects of holidays on hotel prices across different cities, as well as analyzing weeekend vs weekday
pricing patterns to understand demand cycles.
*/

-- 1
SELECT AVG(p.price), p.holiday, f.city
FROM features f
JOIN prices p
ON f.hotel_id = p.hotel_id
GROUP BY f.city, p.holiday;

-- 2
SELECT AVG(p.price), p.weekend, f.city
FROM features f
JOIN prices p
ON f.hotel_id = p.hotel_id
GROUP BY f.city, p.weekend;