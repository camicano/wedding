db.sql

CREATE DATABASE wedding;

CREATE TABLE invitations (
	id serial primary key,
	name varchar(255) NOT NULL,
	num_ppl int NOT NULL,
	house_thu boolean,
	house_fr boolean,
	house_sat boolean,
	transportation varchar(100),
	arrival varchar(50),
	departure varchar(50),
	special_needs varchar(255),
	email varchar(100),
	english boolean
);

id, name, num_ppl, email (pre-made)