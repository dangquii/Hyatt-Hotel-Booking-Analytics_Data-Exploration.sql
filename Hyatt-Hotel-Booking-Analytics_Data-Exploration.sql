-- Which countries have the highest number of guests?
SELECT Country, SUM(Guests) AS Total_Guests
FROM Hyatt_Hotel
GROUP BY Country
ORDER BY Total_Guests DESC;

--What is the lead time distribution for all bookings?
SELECT "Lead Time", COUNT(*) AS Booking_Count
FROM Hyatt_Hotel
GROUP BY "Lead Time"
ORDER BY "Lead Time" ASC;

-- What is the total revenue generated by each distribution channel?
SELECT 
    "Distribution Channel", 
    SUM(CAST(REPLACE(COALESCE(Revenue, '0'), '$', '') AS FLOAT)) AS Total_Revenue
FROM Hyatt_Hotel
GROUP BY "Distribution Channel"
ORDER BY Total_Revenue DESC;

-- What is the average revenue per booking and the total number of bookings for each distribution channel and customer type combination?
SELECT 
    "Distribution Channel",
    "Customer Type",
    COUNT(*) AS Total_Bookings,
    ROUND(AVG(CAST(REPLACE(COALESCE(Revenue, '0'), '$', '') AS FLOAT)), 2) AS Avg_Revenue_Per_Booking
FROM Hyatt_Hotel
GROUP BY "Distribution Channel", "Customer Type"
ORDER BY Avg_Revenue_Per_Booking DESC;

-- What is the average lead time and average revenue for each country, sorted by countries with the highest average revenue?
SELECT 
    Country,
    ROUND(AVG("Lead Time"), 2) AS Avg_Lead_Time,
    ROUND(AVG(CAST(REPLACE(COALESCE(Revenue, '0'), '$', '') AS FLOAT)), 2) AS Avg_Revenue
FROM Hyatt_Hotel
GROUP BY Country
HAVING COUNT(*) > 10  -- Ensures only countries with more than 10 bookings are included
ORDER BY Avg_Revenue DESC;

-- Which countries have the highest average revenue loss due to cancellations, and how many bookings were canceled in each country?
SELECT 
    Country,
    COUNT(*) AS Total_Canceled_Bookings,
    ROUND(AVG(CAST(REPLACE(COALESCE("Revenue Loss", '0'), '$', '') AS FLOAT)), 2) AS Avg_Revenue_Loss
FROM Hyatt_Hotel
WHERE "Cancelled (0/1)" = 1  -- Only consider canceled bookings
GROUP BY Country
HAVING Total_Canceled_Bookings > 5  -- Include only countries with more than 5 cancellations
ORDER BY Avg_Revenue_Loss DESC;

--What is the average daily rate (ADR) for each customer type and distribution channel, and which combinations are the most profitable?
SELECT 
    "Customer Type",
    "Distribution Channel",
    ROUND(AVG(CAST(REPLACE(COALESCE("Avg Daily Rate", '0'), '$', '') AS FLOAT)), 2) AS Avg_Daily_Rate,
    COUNT(*) AS Total_Bookings
FROM Hyatt_Hotel
GROUP BY "Customer Type", "Distribution Channel"
HAVING Total_Bookings > 10  -- Focus only on combinations with sufficient data
ORDER BY Avg_Daily_Rate DESC;

--What is the revenue per guest and the average number of guests per booking for Hyatt?
SELECT 
    ROUND(SUM(CAST(REPLACE(COALESCE(Revenue, '0'), '$', '') AS FLOAT)) / NULLIF(SUM(Guests), 0), 2) AS Revenue_Per_Guest,
    ROUND(AVG(Guests), 2) AS Avg_Guests_Per_Booking
FROM Hyatt_Hotel
WHERE Guests > 0;  -- Exclude bookings with zero guests

