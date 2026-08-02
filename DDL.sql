CREATE DATABASE SMART_CITY_DB;

USE SMART_CITY_DB;

CREATE TABLE drivers (
    driver_id INT PRIMARY KEY,
	driver_name VARCHAR(100) NOT NULL,
    license_number VARCHAR(50) UNIQUE NOT NULL,
    hire_date DATE NOT NULL,
    phone_number VARCHAR(20),
    status VARCHAR(20) CHECK (status IN ('ACTIVE','INACTIVE'))
);

CREATE TABLE vehicles (
    vehicle_id INT PRIMARY KEY,
    registration_number VARCHAR(30) UNIQUE NOT NULL,
    vehicle_type VARCHAR(50),
    capacity INT NOT NULL,
    manufacture_year INT,
    driver_id INT,
    FOREIGN KEY (driver_id)
    REFERENCES drivers(driver_id)
);

CREATE TABLE routes (
    route_id INT PRIMARY KEY,
    route_name VARCHAR(100) NOT NULL,
    source_station VARCHAR(100),
    destination_station VARCHAR(100),
    distance_km DECIMAL(8,2)
);

CREATE TABLE trips (
    trip_id BIGINT PRIMARY KEY,
    vehicle_id INT NOT NULL,
    route_id INT NOT NULL,
    driver_id INT NOT NULL,
    trip_start DATETIME,
    trip_end DATETIME,
    passengers_count INT,
    revenue_amount DECIMAL(12,2),

    FOREIGN KEY (vehicle_id)
    REFERENCES vehicles(vehicle_id),

    FOREIGN KEY (route_id)
    REFERENCES routes(route_id),

    FOREIGN KEY (driver_id)
    REFERENCES drivers(driver_id)
);

CREATE TABLE payments (
    payment_id BIGINT PRIMARY KEY,
    trip_id BIGINT NOT NULL,
    payment_method VARCHAR(50),
    amount DECIMAL(10,2),
    payment_datetime DATETIME,
	    FOREIGN KEY (trip_id)
    REFERENCES trips(trip_id)
);

CREATE TABLE traffic_incidents (
    incident_id BIGINT PRIMARY KEY,
    route_id INT,
    incident_type VARCHAR(100),
    severity_level VARCHAR(20),
    incident_time DATETIME,
    delay_minutes INT,

    FOREIGN KEY (route_id)
    REFERENCES routes(route_id)
);

CREATE TABLE passenger_feedback (
    feedback_id BIGINT PRIMARY KEY,
    trip_id BIGINT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comments VARCHAR(500),
    feedback_date DATE,

    FOREIGN KEY (trip_id)
    REFERENCES trips(trip_id)
);






