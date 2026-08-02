USE SMART_CITY_DB;

#Q25.	Find total revenue by route.
SELECT r.route_id AS ID, r.route_name AS Route, SUM(t.revenue_amount) as Route_Wise_Revenue
FROM routes r
JOIN trips t
ON 
r.route_id = t.route_id
GROUP BY r.route_id, r.route_name;

#Q26.	Calculate monthly revenue trend.
SELECT YEAR(trip_start) AS Year,
MONTH(trip_start) AS Month,
SUM(revenue_amount) AS Monthly_Revenue
FROM trips
GROUP BY YEAR(trip_start), MONTH(trip_start)
ORDER BY Year, Month;

#Q27.	Calculate average passengers per route.
SELECT r.route_id AS ID, r.route_name AS Route, AVG(t.passengers_count) as Average_Passengers_Count
FROM routes r
JOIN trips t
ON 
r.route_id = t.route_id
GROUP BY r.route_id, r.route_name;

#Q28.	Find top 5 drivers by revenue generated.
SELECT d.driver_id AS ID, d.driver_name AS Driver, d.license_number as License_Number, SUM(t.revenue_amount) as Driver_Wise_Revenue
FROM drivers d
JOIN trips t
ON 
d.driver_id = t.driver_id
GROUP BY d.driver_id, d.driver_name
ORDER BY Driver_Wise_Revenue DESC
LIMIT 5;


#Q29.	Determine highest utilized vehicle.
SELECT v.vehicle_id as ID, v.registration_number as Registration_Number, v.vehicle_type as Type_of_Vehicle, COUNT(t.trip_id) AS Total_Trips
FROM vehicles v
JOIN trips t
ON v.vehicle_id = t.vehicle_id
GROUP BY v.registration_number
ORDER BY Total_Trips DESC
LIMIT 1;


#Q30.	Find busiest route by passenger count.

SELECT r.route_id AS ID, r.route_name AS Route, SUM(t.passengers_count) as MAX_Passengers_Count
FROM routes r
JOIN trips t
ON 
r.route_id = t.route_id
GROUP BY r.route_id, r.route_name
ORDER BY MAX_Passengers_Count DESC
LIMIT 1;

