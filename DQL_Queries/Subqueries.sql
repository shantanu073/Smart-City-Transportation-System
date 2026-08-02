USE SMART_CITY_DB;

#Q36.	Find routes generating above-average revenue.

SELECT ID, Route, Above_Avg_Revenues
FROM (

SELECT r.route_id AS ID, r.route_name AS Route, SUM(t.revenue_amount) as Above_Avg_Revenues
FROM routes r
JOIN trips t
ON 
r.route_id = t.route_id
GROUP BY r.route_id
) as temp1
WHERE Above_Avg_Revenues > (
	SELECT AVG(total_revenue)
    FROM (
    SELECT SUM(revenue_amount) AS total_revenue
    FROM trips t
    GROUP BY t.route_id
    ) AS temp
);


#Q37.	Find drivers earning revenue above network average.


#Q38.	Identify trips with revenue greater than route average.



#Q39.	Find passengers feedback scores above city average.
