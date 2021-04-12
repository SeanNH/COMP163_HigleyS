BEGIN TRANSACTION;

-- CREATE TABLE "City" -----------------------------------------
CREATE TABLE [dbo].[City] ( 
	[CityID] INT NOT NULL, 
	[StateID] INT NOT NULL, 
	[CityName] VARCHAR( 256 ) NOT NULL,
	PRIMARY KEY ( [CityID] ) )
GO;
-- -------------------------------------------------------------

COMMIT TRANSACTION;

BEGIN TRANSACTION;

-- CREATE TABLE "Company" --------------------------------------
CREATE TABLE [dbo].[Company] ( 
	[CompanyID] INT NOT NULL, 
	[Address] VARCHAR( 256 ) NOT NULL, 
	[Description] VARCHAR( 256 ) NULL, 
	[CityID] INT NOT NULL, 
	[ZipCode] VARCHAR( 256 ) NOT NULL,
	PRIMARY KEY ( [CompanyID] ) )
GO;
-- -------------------------------------------------------------

-- CREATE INDEX "index_Address" --------------------------------
CREATE  INDEX [index_Address] ON [dbo].[Company]( [Address] ASC )
GO;
-- -------------------------------------------------------------

COMMIT TRANSACTION;

BEGIN TRANSACTION;

-- CREATE TABLE "Contact" --------------------------------------
CREATE TABLE [dbo].[Contact] ( 
	[ContactID] INT NOT NULL, 
	[FirstName] VARCHAR( 256 ) NOT NULL, 
	[LastName] VARCHAR( 256 ) NOT NULL, 
	[Phone] VARCHAR( 256 ) NOT NULL, 
	[Email] VARCHAR( 256 ) NOT NULL, 
	[CompanyID] INT NOT NULL,
	PRIMARY KEY ( [ContactID] ) )
GO;
-- -------------------------------------------------------------

-- CREATE INDEX "index_FirstName" ------------------------------
CREATE  INDEX [index_FirstName] ON [dbo].[Contact]( [FirstName] ASC )
GO;
-- -------------------------------------------------------------

-- CREATE INDEX "index_LastName" -------------------------------
CREATE  INDEX [index_LastName] ON [dbo].[Contact]( [LastName] ASC )
GO;
-- -------------------------------------------------------------

-- CREATE INDEX "index_CompanyID" ------------------------------
CREATE  INDEX [index_CompanyID] ON [dbo].[Contact]( [CompanyID] ASC )
GO;
-- -------------------------------------------------------------

-- CREATE INDEX "index_Phone" ----------------------------------
CREATE  INDEX [index_Phone] ON [dbo].[Contact]( [Phone] ASC )
GO;
-- -------------------------------------------------------------

COMMIT TRANSACTION;

BEGIN TRANSACTION;

-- CREATE TABLE "Driver" ---------------------------------------
CREATE TABLE [dbo].[Driver] ( 
	[DriverID] VARCHAR( 256 ) NOT NULL, 
	[Preferences] VARCHAR( 256 ) NULL, 
	[LicenseNum] VARCHAR( 256 ) NOT NULL, 
	[TrainingCategory] VARCHAR( 256 ) NOT NULL, 
	[LicenseExp] DATE NOT NULL, 
	[CityID] INT NOT NULL, 
	[Address] VARCHAR( 256 ) NOT NULL, 
	[Fname] VARCHAR( 256 ) NOT NULL, 
	[Lname] VARCHAR( 256 ) NOT NULL, 
	[Title] VARCHAR( 256 ) NOT NULL, 
	[Phone] INT NULL, 
	[Salary] MONEY NULL, 
	[Zipcode] VARCHAR( 256 ) NOT NULL,
	PRIMARY KEY ( [DriverID] ), 
	CONSTRAINT [salaryCheck] CHECK ( ([Salary]<(100000)) ) )
GO;
-- -------------------------------------------------------------

-- CREATE INDEX "index_LicenseNum" -----------------------------
CREATE  INDEX [index_LicenseNum] ON [dbo].[Driver]( [LicenseNum] ASC )
GO;
-- -------------------------------------------------------------

-- CREATE INDEX "index_Fname" ----------------------------------
CREATE  INDEX [index_Fname] ON [dbo].[Driver]( [Fname] ASC )
GO;
-- -------------------------------------------------------------

-- CREATE INDEX "index_Lname" ----------------------------------
CREATE  INDEX [index_Lname] ON [dbo].[Driver]( [Lname] ASC )
GO;
-- -------------------------------------------------------------

-- CREATE INDEX "index_CityID1" --------------------------------
CREATE  INDEX [index_CityID1] ON [dbo].[Driver]( [CityID] ASC )
GO;
-- -------------------------------------------------------------

-- CREATE INDEX "index_Zipcode" --------------------------------
CREATE  INDEX [index_Zipcode] ON [dbo].[Driver]( [Zipcode] ASC )
GO;
-- -------------------------------------------------------------

COMMIT TRANSACTION;

BEGIN TRANSACTION;

-- CREATE TABLE "Refuel" ---------------------------------------
CREATE TABLE [dbo].[Refuel] ( 
	[RefuelID] INT NOT NULL, 
	[Date] DATETIME NOT NULL, 
	[Quantity] INT NOT NULL, 
	[Price] MONEY NOT NULL, 
	[CityID] INT NOT NULL, 
	[Vendor] VARCHAR( 256 ) NULL, 
	[Comments] TEXT NULL, 
	[TruckVIN] VARCHAR( 256 ) NOT NULL, 
	[DriverID] VARCHAR( 256 ) NOT NULL,
	PRIMARY KEY ( [RefuelID] ) )
GO;
-- -------------------------------------------------------------

-- CREATE INDEX "index_DriverID" -------------------------------
CREATE  INDEX [index_DriverID] ON [dbo].[Refuel]( [DriverID] ASC )
GO;
-- -------------------------------------------------------------

-- CREATE INDEX "index_TruckVIN1" ------------------------------
CREATE  INDEX [index_TruckVIN1] ON [dbo].[Refuel]( [TruckVIN] ASC )
GO;
-- -------------------------------------------------------------

-- CREATE INDEX "index_Date" -----------------------------------
CREATE  INDEX [index_Date] ON [dbo].[Refuel]( [Date] ASC )
GO;
-- -------------------------------------------------------------

-- CREATE INDEX "index_Price" ----------------------------------
CREATE  INDEX [index_Price] ON [dbo].[Refuel]( [Price] ASC )
GO;
-- -------------------------------------------------------------

-- CREATE INDEX "index_CityID2" --------------------------------
CREATE  INDEX [index_CityID2] ON [dbo].[Refuel]( [CityID] ASC )
GO;
-- -------------------------------------------------------------

COMMIT TRANSACTION;

BEGIN TRANSACTION;

-- CREATE TABLE "Shipment" -------------------------------------
CREATE TABLE [dbo].[Shipment] ( 
	[ShipmentID] INT NOT NULL, 
	[ContactID] INT NOT NULL, 
	[WarehouseID] INT NOT NULL, 
	[TruckVIN] VARCHAR( 256 ) NOT NULL, 
	[DeliverBy] DATE NOT NULL, 
	[Contents] VARCHAR( 256 ) NOT NULL, 
	[PickupDate] DATE NOT NULL, 
	[EstWeight] FLOAT( 53 ) NULL, 
	[EstMiles] FLOAT( 53 ) NULL, 
	[ActualWeight] FLOAT( 53 ) NOT NULL, 
	[ActualMiles] FLOAT( 53 ) NOT NULL, 
	[DriverComments] TEXT NULL, 
	[CustComments] TEXT NULL, 
	[DriverID] VARCHAR( 256 ) NOT NULL,
	PRIMARY KEY ( [ShipmentID] ) )
GO;
-- -------------------------------------------------------------

-- CREATE INDEX "index_ShipmentID1" ----------------------------
CREATE  INDEX [index_ShipmentID1] ON [dbo].[Shipment]( [ShipmentID] ASC )
GO;
-- -------------------------------------------------------------

-- CREATE INDEX "index_ActualMiles" ----------------------------
CREATE  INDEX [index_ActualMiles] ON [dbo].[Shipment]( [ActualMiles] ASC )
GO;
-- -------------------------------------------------------------

-- CREATE INDEX "index_ActualWeight" ---------------------------
CREATE  INDEX [index_ActualWeight] ON [dbo].[Shipment]( [ActualWeight] ASC )
GO;
-- -------------------------------------------------------------

COMMIT TRANSACTION;

BEGIN TRANSACTION;

-- CREATE TABLE "State" ----------------------------------------
CREATE TABLE [dbo].[State] ( 
	[StateID] INT NOT NULL, 
	[StateName] VARCHAR( 256 ) NOT NULL, 
	[StateAbbrev] VARCHAR( 256 ) NOT NULL,
	PRIMARY KEY ( [StateID] ) )
GO;
-- -------------------------------------------------------------

COMMIT TRANSACTION;

BEGIN TRANSACTION;

-- CREATE TABLE "Transaction" ----------------------------------
CREATE TABLE [dbo].[Transaction] ( 
	[TransactionID] INT NOT NULL, 
	[ShipmentID] INT NOT NULL, 
	[BaseFee] MONEY NOT NULL, 
	[MileageFee] MONEY NOT NULL, 
	[ExpressFee] MONEY NOT NULL, 
	[TotalCost] MONEY NOT NULL,
	PRIMARY KEY ( [TransactionID] ), 
	CONSTRAINT [costCheck] CHECK ( ([TotalCost]>=(([BaseFee]+[ExpressFee])+[MileageFee])) ) )
GO;
-- -------------------------------------------------------------

-- CREATE INDEX "index_ShipmentID" -----------------------------
CREATE  INDEX [index_ShipmentID] ON [dbo].[Transaction]( [ShipmentID] ASC )
GO;
-- -------------------------------------------------------------

-- CREATE INDEX "index_TotalCost" ------------------------------
CREATE  INDEX [index_TotalCost] ON [dbo].[Transaction]( [TotalCost] ASC )
GO;
-- -------------------------------------------------------------

COMMIT TRANSACTION;

BEGIN TRANSACTION;

-- CREATE TABLE "Truck" ----------------------------------------
CREATE TABLE [dbo].[Truck] ( 
	[VIN] VARCHAR( 256 ) NOT NULL, 
	[Year] DATE NOT NULL, 
	[Make] VARCHAR( 256 ) NOT NULL, 
	[Model] VARCHAR( 256 ) NOT NULL, 
	[Engine] VARCHAR( 256 ) NOT NULL, 
	[Color] VARCHAR( 256 ) NOT NULL, 
	[Size] VARCHAR( 256 ) NOT NULL, 
	[DateAcq] DATE NOT NULL, 
	[PurchasePrice] MONEY NOT NULL, 
	[MilesStart] INT NOT NULL, 
	[CurrentMiles] INT NOT NULL,
	PRIMARY KEY ( [VIN] ), 
	CONSTRAINT [milesCheck] CHECK ( ([CurrentMiles]>=[MilesStart]) ) )
GO;
-- -------------------------------------------------------------

-- CREATE INDEX "index_CurrentMiles" ---------------------------
CREATE  INDEX [index_CurrentMiles] ON [dbo].[Truck]( [CurrentMiles] ASC )
GO;
-- -------------------------------------------------------------

-- CREATE INDEX "index_MilesStart" -----------------------------
CREATE  INDEX [index_MilesStart] ON [dbo].[Truck]( [MilesStart] ASC )
GO;
-- -------------------------------------------------------------

-- CREATE INDEX "index_Model" ----------------------------------
CREATE  INDEX [index_Model] ON [dbo].[Truck]( [Model] ASC )
GO;
-- -------------------------------------------------------------

-- CREATE INDEX "index_Make" -----------------------------------
CREATE  INDEX [index_Make] ON [dbo].[Truck]( [Make] ASC )
GO;
-- -------------------------------------------------------------

COMMIT TRANSACTION;

BEGIN TRANSACTION;

-- CREATE TABLE "Warehouse" ------------------------------------
CREATE TABLE [dbo].[Warehouse] ( 
	[WarehouseID] INT NOT NULL, 
	[CityID] INT NOT NULL, 
	[Address] VARCHAR( 256 ) NOT NULL, 
	[Description] VARCHAR( 256 ) NULL, 
	[Zipcode] VARCHAR( 256 ) NOT NULL,
	PRIMARY KEY ( [WarehouseID] ) )
GO;
-- -------------------------------------------------------------

-- CREATE INDEX "index_Address1" -------------------------------
CREATE  INDEX [index_Address1] ON [dbo].[Warehouse]( [Address] ASC )
GO;
-- -------------------------------------------------------------

-- CREATE INDEX "index_CityID" ---------------------------------
CREATE  INDEX [index_CityID] ON [dbo].[Warehouse]( [CityID] ASC )
GO;
-- -------------------------------------------------------------

COMMIT TRANSACTION;