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

SELECT ID, Driver, Above_Network_Avg_Revenues
FROM (

SELECT d.driver_id AS ID, d.driver_name AS Driver, SUM(t.revenue_amount) as Above_NetWork_Avg_Revenues
FROM drivers d
JOIN trips t
ON 
d.driver_id = t.route_id
GROUP BY d.driver_id
) as temp1
WHERE Above_NetWork_Avg_Revenues > (
	SELECT AVG(total_revenue)
    FROM (
    SELECT SUM(revenue_amount) AS total_revenue
    FROM trips t
    GROUP BY t.driver_id
    ) AS temp
);

#Q38.	Identify trips with revenue greater than route average.

SELECT t.trip_id,
       t.route_id,
       t.revenue_amount
FROM trips t
WHERE t.revenue_amount >
(
    SELECT AVG(t2.revenue_amount)
    FROM trips t2
    WHERE t2.route_id = t.route_id
);

#Q39.	Find passengers feedback scores above city average.

SELECT feedback_id, trip_id, rating AS Scores
FROM passenger_feedback
WHERE rating > 
(
	SELECT AVG(rating)
    FROM passenger_feedback
);

