USE SMART_CITY_DB;

# Q11. Insert a new driver and vehicle.

INSERT INTO drivers 
VALUES (11,'John Doe','L1011','2024-02-01','9001111112','ACTIVE');

INSERT INTO vehicles
VALUES (111,'BUS1011','BUS',50,2018,11);

# Q12.	Insert a new trip record.

INSERT INTO trips
VALUES (10011,110,10,10,'2025-01-02 17:00:00','2025-01-03 18:00:00',50,2000, "ACTIVE");

# Q13.	Update revenue for a specific trip.

UPDATE trips
SET revenue_amount = 4000
WHERE trip_id = 10011;

# Q14.	Update driver status to INACTIVE.
UPDATE drivers
SET status = "INACTIVE"
WHERE driver_id = 11;


