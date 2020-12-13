/* 
	INSERT QUERIES 
*/

use HotelTSG;

-- Type
insert into type (TypeId, Name, StandardOccupancy, MaximumOccupancy, BasePrice, ExtraPerson) values
	(1, "Single", 2, 2, 149.99, 0),
    (2, "Double", 2, 4, 174.99, 10),
    (3, "Suite", 3, 8, 399.99, 20);

-- Rooms
insert into Rooms (RoomId, RoomNumber, TypeId, AdaAccessibility) values
	(1, 201, 2, 0),
    (2, 202, 2, 1),
    (3, 203, 2, 0),
    (4, 204, 2, 1),
    (5, 205, 1, 0),
    (6, 206, 1, 1),
    (7, 207, 1, 0),
    (8, 208, 1, 1),
    
    (9, 301, 2, 0),
    (10, 302, 2, 1),
    (11, 303, 2, 0),
    (12, 304, 2, 1),
    (13, 305, 1, 0),
    (14, 306, 1, 1),
    (15, 307, 1, 0),
    (16, 308, 1, 1),
    
    (17, 401, 3, 1),
    (18, 402, 3, 1);

-- Amenity
insert into Amenity (AmenityId, Name, Price) values
	(1, "Microwave", 0),
    (2, "Refrigerator", 0),
    (3, "Oven", 0),
    (4, "Jacuzzi", 25);

-- RoomAmenity
insert into RoomAmenity (RoomId, AmenityId) values
	(1, 1),
    (1, 4),
    
    (2, 2),
    
    (3, 1),
    (3, 4),
    
    (4, 2),
    
    (5, 1),
    (5, 2),
    (5, 4),
    
    (6, 1),
    (6, 2),
    
    (7, 1),
    (7, 2),
    (7, 4),
    
    (8, 1),
    (8, 2),
    
    (9, 1),
    (9, 4),
    
    (10, 2),
    
    (11, 1),
    (11, 4),
    
    (12, 2),
    
    (13, 1),
    (13, 2),
    (13, 4),
    
    (14, 1),
    (14, 2),
    
    (15, 1),
    (15, 2),
    (15, 4),
    
    (16, 1),
    (16, 2),
    
    (17, 1),
    (17, 2),
    (17, 3),
    
    (18, 1),
    (18, 2),
    (18, 3);

-- Guests
insert into Guests (GuestId, FirstName, LastName, Address, City, State, Zip, Phone) values
	(1, "Nacer", "Sebti", "123 New Mars Street", "Montréal", "QC", 12345, "(123) 456-7891"),
    (2, "Mack", "Simmer", "379 Old Shore Street", "Council Bluffs", "IA", 51501, "(291) 553-0508"),
    (3, "Bettyann", "Seery", "750 Wintergreen Dr.", "Wasilla", "AK", 99654, "(478) 277-9632"),
    (4, "Duane", "Cullison", "9662 Foxrun Lane", "Harlingen", "TX", 78552, "(308) 494-0198"),
    (5, "Karie", "Yang", "9378 W. Augusta Ave.", "West Deptford", "NJ", 08096, "(214) 730-0298"),
    (6, "Aurore", "Lipton", "762 Wild Rose Street", "Saginaw", "MI", 48601, "(377) 507-0974"),
    (7, "Zachery", "Luechtefeld", "7 Poplar Dr.", "Arvada", "CO", 80003, "(814) 485-2615"),
    (8, "Jeremiah", "Pendergrass", "70 Oakwood St.", "Zion", "IL", 60099, "(279) 491-0960"),
    (9, "Walter", "Holaway", "7556 Arrowhead St.", "Cumberland", "RI", 02864, "(446) 396-6785"),
    (10, "Wilfred", "Vise", "77 West Surrey Street", "Oswego", "NY", 13126, "(834) 727-1001"),
    (11, "Maritza", "Tilton", "939 Linda Rd.", "Burke", "VA", 22015, "(446) 351-6860"),
    (12, "Joleen", "Tison", "87 Queen St.", "Drexel Hill", "PA", 19026, "(231) 893-2755");

-- Reservation
insert into Reservation (ReservationId, GuestId, StartDate, EndDate) values
	(1, 2, "2023-02-02", "2023-02-04"),
	(2, 3, "2023-02-05", "2023-02-10"),
	(3, 4, "2023-02-22", "2023-02-24"),
	(4, 5, "2023-03-06", "2023-03-07"),
	(5, 1, "2023-03-17", "2023-03-20"),
	(6, 6, "2023-03-18", "2023-03-23"),
	(7, 7, "2023-03-29", "2023-03-31"),
	(8, 8, "2023-03-31", "2023-04-05"),
	(9, 9, "2023-04-09", "2023-04-13"),
	(10, 10, "2023-04-23", "2023-04-24"),
	(11, 11, "2023-05-30", "2023-06-02"),
	(12, 12, "2023-06-10", "2023-06-14"),
	(13, 6, "2023-06-17", "2023-06-18"),
	(14, 1, "2023-06-28", "2023-07-02"),
	(15, 9, "2023-07-13", "2023-07-14"),
	(16, 10, "2023-07-18", "2023-07-21"),
	(17, 3, "2023-07-28", "2023-07-29"),
	(18, 3, "2023-08-30", "2023-09-01"),
	(19, 2, "2023-09-16", "2023-09-17"),
	(20, 5, "2023-09-13", "2023-09-15"),    
	(21, 4, "2023-11-22", "2023-11-25"),
	(22, 2, "2023-11-22", "2023-11-25"),
	(23, 11, "2023-12-24", "2023-12-28");

-- RoomReservation
insert into RoomReservation (RoomId, ReservationId, Adults, Children, TotalCost) values
	(16, 1, 1, 0, 299.98),
	(3, 2, 2, 1, 999.95),
	(13, 3, 2, 0, 349.98),
	(1, 4, 2, 2, 199.99),
	(15, 5, 1, 1, 524.97),
	(10, 6, 3, 0, 924.95),
	(2, 7, 2, 2, 349.98),
	(12, 8, 2, 0, 874.95),
	(9, 9, 1, 0, 799.96),
	(7, 10, 1, 1, 174.99),  
	(17, 11, 2, 4, 1199.97),
	(6, 12, 2, 0, 599.96),
	(8, 12, 1, 0, 599.96),
	(12, 13, 3, 0, 184.99),
	(5, 14, 2, 0, 699.96),
	(4, 15, 3, 1, 184.99),
	(17, 16, 4, 2, 1259.97),
	(11, 17, 2, 1, 199.99),
	(13, 18, 1, 0, 349.98),
	(8, 19, 2, 0, 149.99),
	(3, 20, 2, 2, 399.98),
	(17, 21, 2, 2, 1199.97),
	(6, 22, 2, 0, 449.97),
	(9, 22, 2, 2, 599.97),
	(10, 23, 2, 0, 699.96);
    
/* 
	DELETE QUERIES
*/

delete from RoomReservation
where ReservationId = 8;

delete from Reservation
where GuestId = 8;

delete from Guests
where GuestId = 8;