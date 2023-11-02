create database Airport;
use Airport;
drop database Airport;

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE
);
desc users;
insert into users values(1,'Heer','Dhandhukia','heerdhandhukia@gmail.com');
insert into users values(2,'Sarthak','Girish','sarthakgirish77@gmail.com');
insert into users values(3,'Aryan','Dalvi','aryanhdalvi@gmail.com');
insert into users values(4,'kenneth','Pereira','kenny.alpha26@gmail.com');
select * from users;
ALTER TABLE users
DROP COLUMN role;

CREATE TABLE shuttle_buses (
    bus_id INT PRIMARY KEY,
    bus_number VARCHAR(10),
    capacity INT,
    current_location_point VARCHAR(10),
    status ENUM('in_service', 'out_of_service')
);
desc shuttle_buses;
insert into shuttle_buses values(110,'BUS001', 50, 'Gate 1','in_service');
insert into shuttle_buses values(120,'BUS002', 40, 'Gate 4','out_of_service');
insert into shuttle_buses values(130,'BUS003', 60, 'Gate 3', 'in_service');
insert into shuttle_buses values(140,'BUS004', 45, 'Gate 2','in_service');
select * from shuttle_buses;

CREATE TABLE routes (
    route_id INT PRIMARY KEY,
    route_name VARCHAR(100)
);
desc routes;
Insert into routes values(100, 'Route A');
Insert into routes values(200, 'Route B');
Insert into routes values(300, 'Route C');
Insert into routes values(400, 'Route D');
select * from routes;

CREATE TABLE stops (
    stop_id INT PRIMARY KEY,
    stop_name VARCHAR(100),
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6)
);
desc stops;
drop table stops;
insert into stops values (111,'Stop 1', 40.7128, -74.0060);
insert into stops values (222,'Stop 2', 34.0522, -118.2437);
insert into stops values (333,'Stop 3', 51.5074, -0.1278);
insert into stops values (444,'Stop 4', 48.8566, 2.3522);
select * from stops;

CREATE TABLE schedules (
    schedule_id INT PRIMARY KEY,
    departure_time TIME,
    arrival_time TIME,
    day_of_week Varchar(100)
    
);
ALTER TABLE schedules
DROP COLUMN foreign_key_bus_id;
drop table schedules;

desc schedules;
insert into schedules values (501,'09:00:00', '10:00:00', 'Monday');
insert into schedules values (502,'10:30:00', '11:30:00', 'Tuesday');
insert into schedules values (503,'11:00:00', '12:00:00', 'Wednesday');
insert into schedules values (504,'12:30:00', '13:30:00', 'Thursday');
select * from schedules;

CREATE TABLE bookings (
    booking_id INT PRIMARY KEY,
    user_id INT,
    schedule_id INT,
    status ENUM('confirmed', 'cancelled'),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (schedule_id) REFERENCES schedules(schedule_id)
);


desc bookings;
insert into bookings values (91,1, 501, 'confirmed');
insert into bookings values (92,2, 502, 'confirmed');
insert into bookings values (93,3, 503, 'confirmed');
insert into bookings values (94,4, 504, 'confirmed');
select * from bookings;

CREATE TABLE languages (
    language_id INT PRIMARY KEY,
    language_name VARCHAR(50)
);
desc languages;
insert into languages values (85,'English');
insert into languages values (87,'English');
insert into languages values (89,'English');
insert into languages values (82,'English');
select * from languages;

CREATE TABLE accessibility_options (
    option_id INT PRIMARY KEY,
    option_name VARCHAR(50)
);
desc accessibility_options;
insert into accessibility_options values (007,'Wheelchair Accessible');
insert into accessibility_options values (008,'Audio Announcements');
insert into accessibility_options values (009,'Visual Assistance');
insert into accessibility_options values (006,'Braille Information');
select * from accessibility_options;

show tables;

