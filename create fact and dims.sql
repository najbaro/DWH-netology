--drop table dwh.dim_aircrafts cascade;
CREATE TABLE dwh.dim_aircrafts (
	aircraft_code varchar(3) primary key,
	model varchar(50) null,
	"range" int4 null
);

--drop table dwh.dim_airports cascade;
CREATE TABLE dwh.dim_airports (
	airport_code varchar(3) primary key,
	airport_name varchar(100) not null,
	city varchar(100) not null,
	coordinates varchar(100) not null,
	timezone varchar(100) not null
);

--drop table dwh.dim_calendaer cascade;
CREATE TABLE dwh.dim_calendare (
	date_name date primary key
);

--drop table dwh.dim_passengers cascade;
CREATE TABLE dwh.dim_passenger (
	passenger_id varchar(20) primary key,
	passenger_name text not null,
	contact_data varchar(400) null
);

--drop table dwh.dim_tariff cascade;
CREATE TABLE dwh.dim_tariff (
	fare_conditions varchar(50) primary key
);

--drop table dwh.fact_flights cascade;
CREATE TABLE dwh.fact_flights (
	flight_id integer not null,
	passenger_id varchar(20) not null references dwh.dim_passenger ( passenger_id ),
	actual_departure_date date null references dwh.dim_calendare ( date_name ),
	actual_arrival_date date null references dwh.dim_calendare ( date_name ),
	departure_delay integer null,
	arrival_delay integer null,
	aircraft_code varchar(3) not null references dwh.dim_aircrafts ( aircraft_code ),
	departure_airport varchar(3) not null references dwh.dim_airports ( airport_code ),
	arrival_airport varchar(3) not null references dwh.dim_airports ( airport_code ),
	fare_conditions varchar(50) not null references dwh.dim_tariff ( fare_conditions ),
	amount numeric(10, 2) null
);