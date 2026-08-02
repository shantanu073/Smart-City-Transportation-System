USE SMART_CITY_DB;

# Q1. Create an index on trip_start
CREATE INDEX idx_trip_start
ON trips (trip_start);

# Q3. Add a column named trip_status to the trips table
ALTER TABLE trips
ADD COLUMN trip_status varchar(50);

# Q4. Modify driver_name to support 150 characters
ALTER TABLE drivers
MODIFY driver_name VARCHAR(150);


#Q5.	Create a view showing route-wise revenue.

CREATE VIEW route_wise_revenue
AS
SELECT r.route_name, SUM(t.revenue_amount)
from routes r
JOIN trips t
ON
r.route_id = t.route_id
GROUP BY 
r.route_name;

SELECT * FROM route_wise_revenue;

#Q6.	Create a view showing driver performance metrics.
CREATE view Driver_Performance_Metric AS
SELECT d.driver_name, f.rating, f.comments, t.revenue_amount, t.passengers_count
FROM drivers d
JOIN trips t
ON d.driver_id = t.driver_id
JOIN passenger_feedback f
ON t.trip_id = f.trip_id ;

SELECT * FROM Driver_Performance_Metric;

# Q8. Create a new archive table for historical trips

CREATE TABLE trips_archive
LIKE trips;

# Q9. Add a check constraint on payments amount greater than zero

ALTER TABLE payments
MODIFY amount DECIMAL(10,2),
ADD CONSTRAINT chk_amount_positive
CHECK (amount > 0);

# Q10.	Create a monthly partitioning strategy for trips.



