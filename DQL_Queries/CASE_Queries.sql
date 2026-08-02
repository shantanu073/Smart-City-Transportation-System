#Q44. Categorize routes into Short, Medium, Long.

SELECT route_name, distance_km,
CASE
	WHEN distance_km < 15
    THEN 'Short'
    WHEN distance_km BETWEEN 15 AND 25
    THEN 'Medium'
	ELSE 'Long'
END AS route_category
FROM routes;

#Q45. Classify driver performance.

SELECT d.driver_id AS ID, d.driver_name AS Driver, d.license_number as License_Number, SUM(t.revenue_amount) as Driver_Wise_Revenue,
CASE
	WHEN SUM(t.revenue_amount) >= 3000
    THEN 'EXCELLENT'
    WHEN SUM(t.revenue_amount) >= 1500
    THEN 'Good'
    ELSE 'Needs Improvement'
END AS Driver_Performance_Report
FROM drivers d
JOIN trips t
ON 
d.driver_id = t.driver_id
GROUP BY d.driver_id, d.driver_name;

#Q46. Assign trip risk levels using traffic incidents.


#Q47. Categorize customer satisfaction scores.

SELECT feedback_id, rating, 
CASE
	WHEN rating = 5 
    THEN 'Excellent'
    WHEN rating = 4
    THEN 'Good'
    WHEN rating = 3
    THEN 'Average'
    ELSE 'Poor'
END AS Customer_Feedback_Report
FROM passenger_feedback;
