#Q40. Build a CTE showing monthly revenue.

WITH MonthlyRevenue AS
(
	SELECT YEAR(trip_start) AS Year,
    MONTH(trip_start) AS Month,
    SUM(revenue_amount) AS total_revenue
    FROM trips
    GROUP BY Year, Month
)

SELECT * FROM MonthlyRevenue 
ORDER BY Year, Month;
    

#Q41. Use recursive CTE to simulate route hierarchy.

#Q42. Create a route-performance summary using CTEs.

#Q43. Generate driver leaderboard using CTEs.
