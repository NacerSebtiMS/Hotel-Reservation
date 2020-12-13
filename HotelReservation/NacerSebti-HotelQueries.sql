use HotelTSG;

/*
1
Write a query that returns a list of reservations that end in July 2023, including the name of the guest, the room number(s), and the reservation dates.
*/
select guests.FirstName, guests.LastName, rooms.RoomNumber, reservation.StartDate, reservation.EndDate
from guests
inner join reservation on guests.GuestId = reservation.GuestId
inner join roomreservation on reservation.ReservationId = roomreservation.ReservationId
inner join rooms on rooms.RoomId = roomreservation.RoomId
where reservation.EndDate between "2023-07-01" and "2023-07-31";
/*
# FirstName	LastName	RoomNumber	StartDate	EndDate
Nacer	Sebti	205	2023-06-28	2023-07-02
Walter	Holaway	204	2023-07-13	2023-07-14
Wilfred	Vise	401	2023-07-18	2023-07-21
Bettyann	Seery	303	2023-07-28	2023-07-29
*/

/*
2
Write a query that returns a list of all reservations for rooms with a jacuzzi, displaying the guest's name, the room number, and the dates of the reservation.
*/
select guests.FirstName, guests.LastName, rooms.RoomNumber, reservation.StartDate, reservation.EndDate
from guests
inner join reservation on guests.GuestId = reservation.GuestId
inner join roomreservation on reservation.ReservationId = roomreservation.ReservationId
inner join rooms on rooms.RoomId = roomreservation.RoomId
inner join roomamenity on rooms.RoomId = roomamenity.RoomId
where roomamenity.AmenityId = 4;
/*
# FirstName	LastName	RoomNumber	StartDate	EndDate
Karie	Yang	201	2023-03-06	2023-03-07
Bettyann	Seery	203	2023-02-05	2023-02-10
Karie	Yang	203	2023-09-13	2023-09-15
Nacer	Sebti	205	2023-06-28	2023-07-02
Wilfred	Vise	207	2023-04-23	2023-04-24
Walter	Holaway	301	2023-04-09	2023-04-13
Mack	Simmer	301	2023-11-22	2023-11-25
Bettyann	Seery	303	2023-07-28	2023-07-29
Duane	Cullison	305	2023-02-22	2023-02-24
Bettyann	Seery	305	2023-08-30	2023-09-01
Nacer	Sebti	307	2023-03-17	2023-03-20
*/

/*
3
Write a query that returns all the rooms reserved for a specific guest, including the guest's name, the room(s) reserved, the starting date of the reservation, and how many people were included in the reservation. (Choose a guest's name from the existing data.)
*/
select guests.FirstName, guests.LastName, rooms.RoomNumber, reservation.StartDate, reservation.EndDate, roomreservation.Adults, roomreservation.Children
from guests
inner join reservation on guests.GuestId = reservation.GuestId
inner join roomreservation on reservation.ReservationId = roomreservation.ReservationId
inner join rooms on rooms.RoomId = roomreservation.RoomId
where guests.FirstName = "Nacer" and guests.LastName = "Sebti";
/*
# FirstName	LastName	RoomNumber	StartDate	EndDate	Adults	Children
Nacer	Sebti	307	2023-03-17	2023-03-20	1	1
Nacer	Sebti	205	2023-06-28	2023-07-02	2	0
*/

/*
4
Write a query that returns a list of rooms, reservation ID, and per-room cost for each reservation. The results should include all rooms, whether or not there is a reservation associated with the room.
*/
select rooms.RoomNumber, roomreservation.ReservationId, roomreservation.TotalCost
from rooms
left join roomreservation on rooms.RoomId = roomreservation.RoomId;
/*
# RoomNumber	ReservationId	TotalCost
201	4	199.99
202	7	349.98
203	2	999.95
203	20	399.98
204	15	184.99
205	14	699.96
206	12	599.96
206	22	449.97
207	10	174.99
208	12	599.96
208	19	149.99
301	9	799.96
301	22	599.97
302	6	924.95
302	23	699.96
303	17	199.99
304	13	184.99
305	3	349.98
305	18	349.98
306		
307	5	524.97
308	1	299.98
401	11	1199.97
401	16	1259.97
401	21	1199.97
402		
*/

/*
5
Write a query that returns all the rooms accommodating at least three guests and that are reserved on any date in April 2023.
*/
select rooms.RoomNumber
from rooms
inner join roomreservation on rooms.RoomId = roomreservation.RoomId
inner join reservation on reservation.ReservationId = roomreservation.ReservationId
where (roomreservation.Adults + roomreservation.Children) >= 3
and ( (reservation.StartDate between "2023-04-01" and "2023-04-30") or (reservation.EndDate between "2023-04-01" and "2023-04-30") or (reservation.StartDate <= "2023-04-01" and  reservation.StartDate >= "2023-04-30") );
/*
# RoomNumber
*/

/*
6
Write a query that returns a list of all guest names and the number of reservations per guest, sorted starting with the guest with the most reservations and then by the guest's last name.
*/
select guests.FirstName, guests.LastName, count(reservation.ReservationId) as NumberOfReservations
from guests
inner join reservation on reservation.GuestId = guests.GuestId
group by guests.GuestId
order by NumberOfReservations desc, guests.LastName;
/*
# FirstName	LastName	NumberOfReservations
Bettyann	Seery	3
Mack	Simmer	3
Duane	Cullison	2
Walter	Holaway	2
Aurore	Lipton	2
Nacer	Sebti	2
Maritza	Tilton	2
Wilfred	Vise	2
Karie	Yang	2
Zachery	Luechtefeld	1
Joleen	Tison	1
*/

/*
7
Write a query that displays the name, address, and phone number of a guest based on their phone number. (Choose a phone number from the existing data.)
*/
select guests.FirstName, guests.LastName, guests.Address, guests.Phone
from guests
where guests.Phone = "(123) 456-7891";
/*
# FirstName	LastName	Address	Phone
Nacer	Sebti	123 New Mars Street	(123) 456-7891
*/