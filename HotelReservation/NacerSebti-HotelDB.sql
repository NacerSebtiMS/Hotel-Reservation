drop database if exists HotelTSG;

create database HotelTSG;

use HotelTSG;

-- Type
create table Type(
	TypeId int primary key auto_increment,
    Name varchar(10) not null,
    StandardOccupancy int not null,
    MaximumOccupancy int not null,
    BasePrice decimal(6,2) not null,
    ExtraPerson decimal(6,2) not null
);

-- Rooms
create table Rooms(
	RoomId int primary key auto_increment,
    RoomNumber int not null,
    TypeId int not null,
    AdaAccessibility boolean not null,
    foreign key fk_CastMembers_TypeId (TypeId)
		references Type(TypeId)
);

-- Amenity
create table Amenity(
	AmenityId int primary key auto_increment,
    Name varchar(50) not null,
    Price int null
);

-- RoomAmenity
create table RoomAmenity(
	RoomId int not null,
    AmenityId int not null,
    PRIMARY KEY pk_RoomAmenity (RoomId, AmenityId),
    foreign key fk_RoomAmenity_RoomId (RoomId)
		references Rooms(RoomId),
	foreign key fk_RoomAmenity_AmenityId (AmenityId)
		references Amenity(AmenityId)
);

-- Guests
create table Guests(
	GuestId int primary key auto_increment,
    FirstName varchar(50) not null,
    LastName varchar(50) not null,
    Address varchar(256),
    City varchar(100),
    State char(2),
    Zip int,
    Phone varchar(20)
);

-- Reservation
create table Reservation(
	ReservationId int primary key auto_increment,
	GuestId int not null,
    StartDate date not null,
    EndDate date not null,
    foreign key fk_Reservation_GuestId (GuestId)
		references Guests(GuestId)
);

-- RoomReservation
create table RoomReservation(
	RoomId int not null,
    ReservationId int not null,
    Adults int not null,
    Children int not null,
    TotalCost decimal(6,2) not null,
    PRIMARY KEY pk_RoomReservation (RoomId, ReservationId),
    foreign key fk_RoomReservation_RoomId (RoomId)
		references Rooms(RoomId),
	foreign key fk_RoomReservation_ReservationId (ReservationId)
		references Reservation(ReservationId)
);