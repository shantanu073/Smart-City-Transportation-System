USE SMART_CITY_DB;

#Q31. Rank routes by revenue.
SELECT r.route_id, r.route_name, SUM(t.revenue_amount) AS total_revenue,
	RANK() OVER (
		ORDER BY SUM(t.revenue_amount) DESC
        ) AS revenue_rank
	FROM routes r
    JOIN trips t
	ON r.route_id = t.route_id
    GROUP BY r.route_id, r.route_name;

#Q32. Rank drivers within each route.

#Q33. Calculate running revenue totals.

#Q34. Identify top-performing vehicle per month.

#Q35. Calculate moving average of passenger counts.