/*	1a	Identify trucks that have never been used.	*/
select Truck.VIN, Truck.Model, Truck.Make, Truck.Year, (Truck.CurrentMiles - Truck.MilesStart) as MilesDriven
from Truck
where ((Truck.CurrentMiles - Truck.MilesStart) <= 0)

/*	1b	What is the least expensive truck*/
Select Truck.VIN, Truck.Make, Truck.Year, Truck.PurchasePrice
from Truck
order by PurchasePrice asc

/* 1c		Identify the truck with the most log entries.*/
Select Top 1 Truck.VIN, count(TruckLog.VIN) as numLogs
from Truck
inner join TruckLog on TruckLog.VIN = Truck.VIN
group by Truck.VIN
order by numLogs desc

/* 1d 	Identify the truck with that has had the most expensive amount of work done. Sum up all of the log entries.*/
Select Top 1 Truck.VIN, sum(TruckLog.Cost) as totalWorkSpent
from Truck
inner join TruckLog on TruckLog.VIN = Truck.VIN
group by Truck.VIN
order by totalWorkSpent desc

/* 1e 	Show the amount of maintenance per vendor in a sortable grid view.*/
select TruckLog.Vendor, count(TruckLog.Date) as NumJobs
from TruckLog
group by Vendor
order by NumJobs desc

/* 1f 		Show a dropdown of maintenance actions – when selected, list the trucks up for this action in descending order of mileage.*/
select TruckLog.WorkDone, Truck.VIN, Truck.CurrentMiles
from TruckLog
inner join Truck on Truck.VIN = TruckLog.VIN
order by CurrentMiles desc

/* 2a		Rank the customers in descending revenue amounts in a sortable grid.*/
Select sum(TransactionTable.TotalCost) as revenueEarned, Company.Description
from TransactionTable
inner join Shipment on Shipment.ShipmentID = TransactionTable.ShipmentID
Inner join Contact on Contact.ContactID = Shipment.ContactID
inner join Company on Company.CompanyID = Contact.CompanyID
group by Company.Description
order by revenueEarned desc 

/* 2b		Which customer has placed the most shipping requests*/
Select top 1 count(Shipment.ShipmentID) as numTrips, Company.Description
from Shipment
Inner join Contact on Contact.ContactID = Shipment.ContactID
inner join Company on Company.CompanyID = Contact.CompanyID
group by Company.Description
order by numTrips desc 

/* 2c		Which request has the largest estimated miles.*/
select top 1 Shipment.EstMiles, Company.Description
from Shipment
inner join Contact on Contact.ContactID = Shipment.ContactID
Inner join Company on Company.CompanyID = Contact.CompanyID
order by EstMiles DESC

/* 2d		Which pickup location is used the most.*/
select top 1 count(Shipment.ShipmentID) as numTrips, Company.Address
from Shipment
inner join Contact on Contact.ContactID = Shipment.ContactID
Inner join Company on Company.CompanyID = Contact.CompanyID
group by Company.Address
order by NumTrips DESC

/* 2e		Identify the customer with the largest total express charges. */
Select top 1 sum(TransactionTable.ExpressFee) as expressTotal, Company.Description
from Shipment
Inner join TransactionTable on TransactionTable.ShipmentID = Shipment.ShipmentID
Inner join Contact on Contact.ContactID = Shipment.ContactID
inner join Company on Company.CompanyID = Contact.CompanyID
group by Company.Description
order by expressTotal desc 

/* 3a 	 Identify new drivers. These are drivers who have never been on a trip.*/

/* 3b		  Who is the oldest driver*/

/* 3c		Cool wheels likes to buy the drivers birthday cakes during their birthday month. List the driver names sorted by birth month. Show just the month, not the specific birthdate. */

