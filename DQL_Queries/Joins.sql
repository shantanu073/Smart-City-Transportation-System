# Q21.	Retrieve trip, vehicle, driver, and route details in a single report.

SELECT 
	t.trip_start, 
    t.trip_end, 
    d.driver_name,
    v.registration_number,
    r.route_name
FROM trips t
JOIN drivers d
ON t.driver_id = d.driver_id
JOIN vehicles v
ON t.vehicle_id = v.vehicle_id
JOIN routes r
ON t.route_id = r.route_id;

# Q22.	Find trips with their payment information.
SELECT 
	t.trip_start,
    t.trip_end,
    p.payment_method,
    p.payment_datetime,
    p.amount
FROM trips t
JOIN payments p
ON
t.trip_id = p.trip_id;

# Q23.	Show feedback and corresponding route details.
SELECT 
	f.feedback_date,
    f.rating,
    f.comments,
    t.route_id,
    r.route_name,
    r.source_station,
    r.destination_station,
    r.distance_km
FROM passenger_feedback f
JOIN trips t
ON
f.trip_id = t.trip_id
JOIN routes r
ON
t.route_id = r.route_id;

#Q24.	Identify routes that experienced traffic incidents.
SELECT
	r.route_name,
    ti.incident_type
FROM routes r
JOIN traffic_incidents ti
ON r.route_id = ti.route_id;
