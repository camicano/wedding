db.sql

CREATE DATABASE wedding;

CREATE TABLE people (
	id serial primary key,
	name varchar(255) NOT NULL,
	num_ppl int, 
	rsvp varchar(3) NOT NULL,
	house_thu varchar(3),
	house_fr varchar(3),
	house_sat varchar(3),
	transportation varchar(100),
	arrival varchar(50),
	departure varchar(50),
	special_needs varchar(255),
	email varchar(100)
);

CREATE TABLE messages (
	id serial primary key,
	name varchar(100),
	message varchar(500)
);


id, name, num_ppl, email, english? (pre-made)