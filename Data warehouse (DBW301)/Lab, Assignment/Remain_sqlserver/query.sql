------------------------------C2
create procedure BookingInfo
@bNumber int
as
begin
	select distinct b.ID, b.CustomerID, isnull(i.FirstName + i.LastName, o.Name) as CustomerName, 
		ct.Name as 'CartypeName', ct.SeatCapacity, bd.Quantity as 'bookedQuantity', b.ExpectedPickupDatetime,
		b.ExpectedReturnDatetime, s.Name as 'PickupStationName', s.StreetAddress,
		s1.Name as 'ReturnStationName', s1.StreetAddress
	from Bookings b
	join BookingDetails bd on b.id = bd.BookingID
	join Customers c on c.ID = b.CustomerID
	left join Individuals i on c.ID = i.CustomerID
	left join Organizations o on c.ID = o.CustomerID
	join Stations s on s.ID = b.PickupStationID
	left join Stations s1 on s1.ID = b.ReturnStationID
	join SubTypes st on st.ID = bd.SubTypeID
	join CarTypes ct on st.CarTypeID = ct.ID
	where b.ID = @bNumber;
end

exec BookingInfo 1;

---------------------------C3
create procedure BookingInfo1
@bNumber int
as
begin
	select distinct b.ID, c.CarNumber, m.Name as CarManufacturer, st.Model as CarModel,
	ct.Name as CarType, st.YearOfMake, bc.realPickupDate, bc.realReturnDate, (DATEDIFF(DAY, bc.realPickupDate, bc.realReturnDate) + 1) as RentalDurationByDay,
	(bd.RentalPrice * bd.Quantity) as RentelAmount
	from Bookings b
	join BookingDetails bd on b.id = bd.BookingID
	join BookingCars bc on bc.BookingDetailID = bd.ID
	join SubTypes st on st.ID = bd.SubTypeID
	join CarTypes ct on st.CarTypeID = ct.ID
	join Cars c on st.ID = c.SubTypeID
	join Manufactures m on m.ID = st.ManufactureID
	where b.ID = @bNumber
end


-------------------C4
Create trigger TrigInsertIndividual
on Individuals
instead of insert
as
begin
	if not exists (
		select *
		from inserted 
		join Organizations on inserted.CustomerID = Organizations.CustomerID
	)
		begin
		 insert into Individuals
		 select * from inserted
	     end
	else
		begin
			Print('ERROR')
		end
		
end

Create trigger TrigInsertOrganizations
on Organizations
instead of insert
as
begin
	if not exists (
		select *
		from inserted join Individuals on inserted.CustomerID = Individuals.CustomerID
	)
	begin
		insert into Organizations
		select * from inserted
	end
	else
		begin
		Print('ERROR')
		end
end

---------------------C5
Create trigger TrigInsertCarIntoBooking
on BookingCars
instead of insert
as
begin
	insert into BookingCars
	select * from inserted

	update Cars set IsRent = 1
	from inserted
	where Cars.CarNumber = inserted.CarNumber
end

-------------------------------------C6
Create trigger TrigUpdateBooking
on BookingCars
instead of update
as
begin

	if exists(
		select inserted.realReturnDate from inserted
	)
		begin 
			update BookingCars 
				set BookingCars.RentalAmount = (
					Select (bd.RentalPrice*(DATEDIFF(DAY, i.realPickupDate, i.realReturnDate) + 1))
					from inserted i
					join BookingDetails bd on bd.ID = i.BookingDetailID
					where i.BookingDetailID = BookingCars.BookingDetailID
			)
			where BookingDetailID IN (select BookingDetailID from inserted)

			update Cars
				set StationID = (
					Select b.ReturnStationID
					from inserted i
					join BookingDetails bd on bd.ID = i.BookingDetailID
					join Bookings b on b.ID = bd.BookingID
					where i.BookingDetailID = bd.ID
			), IsRent = 0
			where Cars.CarNumber IN (select CarNumber from inserted)
		end
	else
		begin
			print('ERROR')
		end
end

------------------------------------C7
with t as(
SELECT  1 AS num_month
        UNION ALL
        SELECT  num_month + 1
        FROM    t
        WHERE   num_month < 12
), 
t1 as(
select Month(bc.realPickupDate) as monthPic, Count(ct.id) as 'CountCar', ct.Name as CarType
from BookingCars bc
join BookingDetails bd on bd.ID = bc.BookingDetailID
join SubTypes st on st.ID = bd.SubTypeID
join CarTypes ct on st.CarTypeID = ct.ID
group by Month(bc.realPickupDate), ct.id, ct.Name
)
select t.num_month as month, isnull(t1.CountCar, 0) as Count_Type, t1.CarType
from t
left join t1 on t.num_month = t1.monthPic;

-------------------------------------------C8
select YEAR(bc.realPickupDate) as 'Year',
			ct.Name as Type_Name, count(c.ID) as Count_Car, 
			Case when o.Name is null THEN 'Individuals' ELSE 'Organizations' END as Customer_Type
from  BookingDetails bd
join BookingCars bc on bc.BookingDetailID = bd.ID
join SubTypes st on st.ID = bd.SubTypeID
join CarTypes ct on ct.ID = st.CarTypeID
join Bookings b on b.ID = bd.BookingID
join Customers c on b.CustomerID = c.ID
left join Organizations o on o.CustomerID = c.ID
group by c.id, YEAR(bc.realPickupDate), ct.Name, o.Name
------------------------------------------C9
select YEAR(bc.realPickupDate) as 'YEAR', d.City, Count(ct.id) as 'CountCar', ct.Name as CarType
from BookingCars bc
join BookingDetails bd on bd.ID = bc.BookingDetailID
join Bookings b on b.ID = bd.BookingID
join Stations s on s.ID = b.PickupStationID
join Districts d on d.ID = s.DistinctID
join SubTypes st on st.ID = bd.SubTypeID
join CarTypes ct on st.CarTypeID = ct.ID
group by YEAR(bc.realPickupDate), d.City, ct.id, ct.Name;

------------------------------------------C10
with t as(
select b.ID as bID, Count(bd.Quantity) as CountQuantity, b.PickupStationID as StationID
from Bookings b
join BookingDetails bd on b.ID = bd.BookingID
group by b.ID, b.PickupStationID
), 
r as(
select Sum(t.CountQuantity) as Quantity, d.City from t join Stations s on s.ID = t.StationID
join Districts d on d.ID = s.ID
group by d.City
)
select * from r
where r.Quantity = (Select MAX(r.Quantity) from r)

