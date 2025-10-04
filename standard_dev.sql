/*
Project: Hotel Pricing Patterns
Query: Good deals that fall at least $20 below the city average, detect price outliers using standard deviation
Author: Frank Sacco
Date: September 2025

Description: Query 1 calculates the average hotel price per city, then compares each hotel’s price to that benchmark. 
It filters for hotels that are at least $20 cheaper than their city’s average while still maintaining a rating of 3 stars or higher.
Query 2 measures how hotel prices deviate from the city-and-star-rating average by calculating both the mean and the standard deviation of prices. 
It then flags each hotel as “Overpriced,” “Good Value,” or “Normal Range.”
Business Goal: Highlighting hotels that provide the best value per city, and detect pricing outliers to better understand the market.
*/

-- 1
WITH avg_price AS (
SELECT AVG(p.price) AS city_avg_price, f.city
FROM features f JOIN prices p ON f.hotel_id = p.hotel_id
GROUP BY f.city
)

SELECT f.hotel_id, f.city, f.rating, p.price, a.city_avg_price
FROM features f
JOIN prices p ON f.hotel_id = p.hotel_id
JOIN avg_price a ON f.city = a.city
WHERE (a.city_avg_price - p.price) >= 20
AND f.rating >= 3
ORDER BY a.city_avg_price DESC;

-- 2
WITH stats AS (
    SELECT 
        f.city,
        f.rating,
		ROUND(AVG(p.price), 2) AS avg_price,
        ROUND(STDDEV_SAMP(p.price), 2) AS std_price
    FROM features f
    JOIN prices p ON f.hotel_id = p.hotel_id
    GROUP BY f.city, f.rating
)
SELECT 
    f.hotel_id,
    f.city,
    f.rating,
    p.price,
    s.avg_price,
    s.strd_price,
    CASE 
        WHEN p.price > s.avg_price + s.strd_price THEN 'Overpriced'
        WHEN p.price < s.avg_price - s.strd_price THEN 'Good Value'
        ELSE 'Normal Range'
    END AS price_flag
FROM features f
JOIN prices p ON f.hotel_id = p.hotel_id
JOIN stats s ON f.city = s.city AND f.rating = s.rating;