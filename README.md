# Hotel Pricing Patterns Analysis
This project aims to analyze factors influencing hotel pricing in an effort to uncover patterns that travelers (or hotels) can use to make better decisions.

---

This project analyzes hotel data from various cities in Europe to uncover trends and anomalies in pricing. Findings will help consumers find better deals based on factors like city location, timeframe, and online ratings.

**Tools Used:** MySQL Workbench, Microsoft Excel (for data merging/cleaning), Tableau

### Data
- **Source:** [Hotels-Europe Dataset](https://gabors-data-analysis.com/datasets/hotels-europe/)
- **Size:** ~148k rows, 25 columns  

---

## Research Questions
Q1: How does distance from the city center affect hotel prices in different European cities?

Q2: Do higher-rated hotels (stars/user ratings) always command higher prices, or do outliers exist?

Q3: How do weekends and holidays affect hotel prices compared to weekdays?

Q4: Which European cities have the highest vs. lowest average hotel prices?

Q5: Which cities or hotels provide the best value when controlling for star rating, distance, and user score?

---

## Hypotheses
-Hotels closer to city center will be more expensive than those farther away

-Star ratings are a better indicator of expensiveness than user ratings

-Weekends and holidays see room rates increase compared to weekdays; similarly, room rates increase during the Summer

-Cities with the highest prices are likely located in Northern/Western Europe, while low rates are found in Eastern/Southern Europe

-The best value hotels will primarily be those outside the city center/capital city

---

## Methodology
-Wrote advanced SQL queries using a combination of CTEs, window functions, and aggregation to generate insights and find relevant data

-Cleaned and merged two separate datasets in Microsoft Excel

-Built dashboards for visualization in Tableau

---

## Key Insights
-Distance from the city center does affect hotel prices significantly; the data shows that the closest hotels have an average price difference of up to $60 compared to those that are farther away
-Outliers do exist for each star rating, they are not tied to any specific price. However, unfortunately there appear to be more "overpriced" hotels than those that could be considered good value, by our metrics.
-As expexted, weekend prices tend to jump significantly compared to weekday prices in virtually all cities, however holidays were quite often less than we expected, likely due to discounts offered.
-Regions with the highest average prices do indeed appear to be from Western Europe, with Amsterdam, London, and Dublin rounding out the top 3; contrastingly, hotels in Eastern Europe appear to be among the cheapest, with Samara, St. Petersburg, and Sofia holding the cheapest averages.
-Hotels outside the city center are cheaper than those that are closer, however it would be a stretch to say they are definitively the better value. Hotels closer to the center have a higher aveage star rating, which explains the price increase. Therefore, we would say this isn't the best metric to use when measuring value.

---

## Visualizations
This project is divided into two dashboards for clarity.

1. **Dashboard 1 – Pricing Overview**
  - Average price per city
  - Average price per proximity from city center
  - Cheapest hotel price per city

2. **Dashboard 2 – Revenue Impact**
  - Best value per price + star rating
  - City average price per weekend vs weekday
  - City average price per holiday vs non-holiday

📂 Tableau Packaged Workbook: (hotel_cancellation_analysis.twbx)  
Preview:  
![Dashboard 1](dashboard1.png)  
![Dashboard 2](dashboard2.png)

## Conclusions & Recommendations
- Prioritize bookings around a holiday period for discounted room rates
- Staying outside of the city center can bring significant savings (also drawbacks, such as being further from attractions)
- Target mid-tier hotels (3-4 stars) to secure the best value; this range has consistently shown a higher amount of "good value" hotels
- Our data shows that Western Europe has the highest prices relatively; budget-concious travelers should prioritize "good value" hotels and avoid during peak Summer season, when prices are highest.
