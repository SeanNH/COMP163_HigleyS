BEGIN TRANSACTION;

-- CREATE LINK "lnk_State_City" --------------------------------
ALTER TABLE [dbo].[City]
	ADD CONSTRAINT [lnk_State_City]
	FOREIGN KEY ([StateID])
	REFERENCES [dbo].[State]( [StateID] )
	ON DELETE Cascade
	ON UPDATE Cascade
GO;
-- -------------------------------------------------------------

-- CHANGE "ENABLED" OF "LINK "lnk_State_City" ------------------
ALTER TABLE [dbo].[City] NOCHECK CONSTRAINT [lnk_State_City]
GO;
-- -------------------------------------------------------------

COMMIT TRANSACTION;


BEGIN TRANSACTION;

-- CREATE LINK "lnk_City_Company" ------------------------------
ALTER TABLE [dbo].[Company]
	ADD CONSTRAINT [lnk_City_Company]
	FOREIGN KEY ([CityID])
	REFERENCES [dbo].[City]( [CityID] )
	ON DELETE Cascade
	ON UPDATE Cascade
GO;
-- -------------------------------------------------------------

-- CHANGE "ENABLED" OF "LINK "lnk_City_Company" ----------------
ALTER TABLE [dbo].[Company] NOCHECK CONSTRAINT [lnk_City_Company]
GO;
-- -------------------------------------------------------------

COMMIT TRANSACTION;

BEGIN TRANSACTION;

-- CREATE LINK "lnk_Company_Contact" ---------------------------
ALTER TABLE [dbo].[Contact]
	ADD CONSTRAINT [lnk_Company_Contact]
	FOREIGN KEY ([CompanyID])
	REFERENCES [dbo].[Company]( [CompanyID] )
	ON DELETE Cascade
	ON UPDATE Cascade
GO;
-- -------------------------------------------------------------

-- CHANGE "ENABLED" OF "LINK "lnk_Company_Contact" -------------
ALTER TABLE [dbo].[Contact] NOCHECK CONSTRAINT [lnk_Company_Contact]
GO;
-- -------------------------------------------------------------

COMMIT TRANSACTION;

BEGIN TRANSACTION;

-- CREATE LINK "lnk_City_Driver" -------------------------------
ALTER TABLE [dbo].[Driver]
	ADD CONSTRAINT [lnk_City_Driver]
	FOREIGN KEY ([CityID])
	REFERENCES [dbo].[City]( [CityID] )
	ON DELETE Cascade
	ON UPDATE Cascade
GO;
-- -------------------------------------------------------------

-- CHANGE "ENABLED" OF "LINK "lnk_City_Driver" -----------------
ALTER TABLE [dbo].[Driver] NOCHECK CONSTRAINT [lnk_City_Driver]
GO;
-- -------------------------------------------------------------

COMMIT TRANSACTION;

BEGIN TRANSACTION;

-- CREATE LINK "lnk_Truck_Refuel" ------------------------------
ALTER TABLE [dbo].[Refuel]
	ADD CONSTRAINT [lnk_Truck_Refuel]
	FOREIGN KEY ([TruckVIN])
	REFERENCES [dbo].[Truck]( [VIN] )
	ON DELETE Cascade
	ON UPDATE Cascade
GO;
-- -------------------------------------------------------------

-- CHANGE "ENABLED" OF "LINK "lnk_Truck_Refuel" ----------------
ALTER TABLE [dbo].[Refuel] NOCHECK CONSTRAINT [lnk_Truck_Refuel]
GO;
-- -------------------------------------------------------------

COMMIT TRANSACTION;

BEGIN TRANSACTION;

-- CREATE LINK "lnk_Driver_Refuel" -----------------------------
ALTER TABLE [dbo].[Refuel]
	ADD CONSTRAINT [lnk_Driver_Refuel]
	FOREIGN KEY ([DriverID])
	REFERENCES [dbo].[Driver]( [DriverID] )
	ON DELETE Cascade
	ON UPDATE Cascade
GO;
-- -------------------------------------------------------------

-- CHANGE "ENABLED" OF "LINK "lnk_Driver_Refuel" ---------------
ALTER TABLE [dbo].[Refuel] NOCHECK CONSTRAINT [lnk_Driver_Refuel]
GO;
-- -------------------------------------------------------------

COMMIT TRANSACTION;

BEGIN TRANSACTION;

-- CREATE LINK "lnk_Contact_Shipment" --------------------------
ALTER TABLE [dbo].[Shipment]
	ADD CONSTRAINT [lnk_Contact_Shipment]
	FOREIGN KEY ([ContactID])
	REFERENCES [dbo].[Contact]( [ContactID] )
	ON DELETE Cascade
	ON UPDATE Cascade
GO;
-- -------------------------------------------------------------

-- CHANGE "ENABLED" OF "LINK "lnk_Contact_Shipment" ------------
ALTER TABLE [dbo].[Shipment] NOCHECK CONSTRAINT [lnk_Contact_Shipment]
GO;
-- -------------------------------------------------------------

COMMIT TRANSACTION;

BEGIN TRANSACTION;

-- CREATE LINK "lnk_Truck_Shipment" ----------------------------
ALTER TABLE [dbo].[Shipment]
	ADD CONSTRAINT [lnk_Truck_Shipment]
	FOREIGN KEY ([TruckVIN])
	REFERENCES [dbo].[Truck]( [VIN] )
	ON DELETE Cascade
	ON UPDATE Cascade
GO;
-- -------------------------------------------------------------

-- CHANGE "ENABLED" OF "LINK "lnk_Truck_Shipment" --------------
ALTER TABLE [dbo].[Shipment] NOCHECK CONSTRAINT [lnk_Truck_Shipment]
GO;
-- -------------------------------------------------------------

COMMIT TRANSACTION;

BEGIN TRANSACTION;

-- CREATE LINK "lnk_Driver_Shipment" ---------------------------
ALTER TABLE [dbo].[Shipment]
	ADD CONSTRAINT [lnk_Driver_Shipment]
	FOREIGN KEY ([DriverID])
	REFERENCES [dbo].[Driver]( [DriverID] )
	ON DELETE No Action
	ON UPDATE No Action
GO;
-- -------------------------------------------------------------

-- CHANGE "ENABLED" OF "LINK "lnk_Driver_Shipment" -------------
ALTER TABLE [dbo].[Shipment] NOCHECK CONSTRAINT [lnk_Driver_Shipment]
GO;
-- -------------------------------------------------------------

COMMIT TRANSACTION;

BEGIN TRANSACTION;

-- CREATE LINK "lnk_Shipment_Transaction" ----------------------
ALTER TABLE [dbo].[Transaction]
	ADD CONSTRAINT [lnk_Shipment_Transaction]
	FOREIGN KEY ([TransactionID])
	REFERENCES [dbo].[Shipment]( [ShipmentID] )
	ON DELETE Cascade
	ON UPDATE Cascade
GO;
-- -------------------------------------------------------------

-- CHANGE "ENABLED" OF "LINK "lnk_Shipment_Transaction" --------
ALTER TABLE [dbo].[Transaction] NOCHECK CONSTRAINT [lnk_Shipment_Transaction]
GO;
-- -------------------------------------------------------------

COMMIT TRANSACTION;

BEGIN TRANSACTION;

-- CREATE LINK "lnk_City_Warehouse" ----------------------------
ALTER TABLE [dbo].[Warehouse]
	ADD CONSTRAINT [lnk_City_Warehouse]
	FOREIGN KEY ([CityID])
	REFERENCES [dbo].[City]( [CityID] )
	ON DELETE Cascade
	ON UPDATE Cascade
GO;
-- -------------------------------------------------------------

-- CHANGE "ENABLED" OF "LINK "lnk_City_Warehouse" --------------
ALTER TABLE [dbo].[Warehouse] NOCHECK CONSTRAINT [lnk_City_Warehouse]
GO;
-- -------------------------------------------------------------

COMMIT TRANSACTION;
