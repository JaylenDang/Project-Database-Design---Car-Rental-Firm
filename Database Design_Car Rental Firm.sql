DROP TABLE IF EXISTS PersonalClient;
CREATE TABLE PersonalClient (
    address VARCHAR(45) NOT NULL,
    street VARCHAR(45) NOT NULL,
    postcode CHAR(4) NOT NULL,
    phone CHAR(14),
    fName VARCHAR(20),
    lName VARCHAR(20),
    title CHAR(4),
    driversNum CHAR(12),
    PRIMARY KEY (address, street, postcode)
);

INSERT INTO PersonalClient (address, street, postcode, phone, fName, lName, title, driversNum) VALUES
('123 Main St', 'Main', '1234', '123-456-7890', 'John', 'Doe', 'Mr', 'D1234567'),
('456 Elm St', 'Elm', '2345', '234-567-8901', 'Jane', 'Smith', 'Ms', 'D2345678'),
('789 Oak St', 'Oak', '3456', '345-678-9012', 'Emily', 'Johnson', 'Ms', 'D3456789');

DROP TABLE IF EXISTS CompanyClient;
CREATE TABLE CompanyClient (
    address VARCHAR(45) NOT NULL,
    street VARCHAR(45) NOT NULL,
    postcode CHAR(4) NOT NULL,
    phone CHAR(14),
    cName VARCHAR(20),
    PRIMARY KEY (address, street, postcode),
    FOREIGN KEY (address, street, postcode) REFERENCES PersonalClient(address, street, postcode) ON DELETE CASCADE
);
INSERT INTO CompanyClient (address, street, postcode, phone, cName) VALUES
('321 Pine St', 'Pine', '4567', '456-789-0123', 'Pine Co.'),
('654 Cedar St', 'Cedar', '5678', '567-890-1234', 'Cedar Ltd.'),
('987 Birch St', 'Birch', '6789', '678-901-2345', 'Birch Inc.')


DROP TABLE IF EXISTS VehicleType;
CREATE TABLE VehicleType (
    Make VARCHAR(8) NOT NULL, 
    Model VARCHAR(20) NOT NULL,
    Doors INTEGER,             -- Number of doors
    Body VARCHAR(20),          -- Body type (e.g., Sedan, SUV)
    Trim VARCHAR(20),          -- Trim level (e.g., Standard, Luxury)
    Fuel VARCHAR(10),          -- Fuel type (e.g., Petrol, Diesel, Electric)
    PRIMARY KEY (Make, Model)
);

INSERT INTO VehicleType (Make, Model, Doors, Body, Trim, Fuel) VALUES
('Toyota', 'Corolla', 4, 'Sedan', 'Standard', 'Petrol'),
('Honda', 'Civic', 4, 'Sedan', 'Standard', 'Petrol'),
('Ford', 'Focus', 4, 'Hatchback', 'Standard', 'Petrol');

DROP TABLE IF EXISTS DailyTariff;
CREATE TABLE DailyTariff (
    tariffID CHAR(2) NOT NULL, 
    Conditions VARCHAR(50), 
    PRIMARY KEY (tariffID)
);
INSERT INTO DailyTariff (tariffID, Conditions) VALUES
('T01', 'Standard Conditions'),
('T02', 'Weekend Special'),
('T03', 'Weekly Rate');

DROP TABLE IF EXISTS Rent;
CREATE TABLE Rent (
    tariffID CHAR(2) NOT NULL, 
    Make VARCHAR(8) NOT NULL, 
    Model VARCHAR(20) NOT NULL,
    rentalPrice DECIMAL(5, 2), 
    PRIMARY KEY (tariffID, Make, Model),
    FOREIGN KEY (tariffID) REFERENCES DailyTariff(tariffID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (Make, Model) REFERENCES VehicleType(Make, Model) ON UPDATE CASCADE ON DELETE CASCADE
);
INSERT INTO Rent (tariffID, Make, Model, rentalPrice) VALUES
('T01', 'Toyota', 'Corolla', 30.00),
('T02', 'Honda', 'Civic', 35.00),
('T03', 'Ford', 'Focus', 25.00);

DROP TABLE IF EXISTS Depot;
CREATE TABLE Depot (
    DepotID INT(2) NOT NULL, 
    street VARCHAR(45),
    postcode CHAR(4),
    phone CHAR(14),
    email VARCHAR(24), 
    PRIMARY KEY (DepotID)
);
INSERT INTO Depot (DepotID, street, postcode, phone, email) VALUES
(1, 'Depot St', '1111', '111-111-1111', 'depot1@example.com'),
(2, 'Warehouse Rd', '2222', '222-222-2222', 'depot2@example.com');

DROP TABLE IF EXISTS Insurance;
CREATE TABLE Insurance (
    insuranceID INTEGER NOT NULL,
    policyType VARCHAR(20),
    cost DECIMAL(10, 2),
    policyNumber CHAR(20),
    PRIMARY KEY (insuranceID)
);
INSERT INTO Insurance (insuranceID, policyType, cost, policyNumber) VALUES
(1, 'Comprehensive', 300.00, 'POLICY001'),
(2, 'Third Party', 150.00, 'POLICY002');

DROP TABLE IF EXISTS Vehicle;

CREATE TABLE Vehicle (
    regNum CHAR(7) NOT NULL, 
    FleetNum INT(3), 
    Colour VARCHAR(20),
    Make VARCHAR(8) NOT NULL, 
    Model VARCHAR(20) NOT NULL, --our assumption 
    DepotID INT(2), 
    PRIMARY KEY (regNum),
    FOREIGN KEY (Make, Model) REFERENCES VehicleType(Make, Model) ON UPDATE CASCADE,
    FOREIGN KEY (DepotID) REFERENCES Depot(DepotID) ON DELETE SET NULL
);
INSERT INTO Vehicle (regNum, FleetNum, Colour, Make, Model, DepotID) VALUES
('ABC1234', 1, 'Red', 'Toyota', 'Corolla', 1),
('DEF5678', 2, 'Blue', 'Honda', 'Civic', 2),
('GHI9101', 3, 'Black', 'Ford', 'Focus', 1);

DROP TABLE IF EXISTS Booking;
CREATE TABLE Booking (
    startDate DATE NOT NULL,
    hireDays INT(2), 
    colour VARCHAR(12), 
    DepotID INT(2) NOT NULL, 
    address VARCHAR(45) NOT NULL,
    street VARCHAR(45) NOT NULL,
    postcode CHAR(4) NOT NULL,
    Make VARCHAR(8) NOT NULL, 
    Model VARCHAR(20) NOT NULL, 
    PRIMARY KEY (startDate),
    FOREIGN KEY (DepotID) REFERENCES Depot(DepotID) ON UPDATE CASCADE ON DELETE NO ACTION,
    FOREIGN KEY (address, street, postcode) REFERENCES PersonalClient(address, street, postcode) ON UPDATE CASCADE ON DELETE NO ACTION,
    FOREIGN KEY (Make, Model) REFERENCES VehicleType(Make, Model) ON UPDATE CASCADE ON DELETE NO ACTION
);
INSERT INTO Booking (startDate, hireDays, colour, DepotID, address, street, postcode, Make, Model) VALUES
('2024-10-01', 5, 'Red', 1, '123 Main St', 'Main', '1234', 'Toyota', 'Corolla'),
('2024-10-02', 3, 'Blue', 2, '456 Elm St', 'Elm', '2345', 'Honda', 'Civic'),
('2024-10-03', 7, 'Black', 1, '789 Oak St', 'Oak', '3456', 'Ford', 'Focus');

DROP TABLE IF EXISTS HiredVehicle;
CREATE TABLE HiredVehicle (
    Date DATE NOT NULL,
    cardType CHAR(2), 
    cardNo CHAR(20), 
    Odometer INT(5), 
    Days INT(2), 
    DepotID INT(2) NOT NULL,
    regNum CHAR(7) NOT NULL, 
    address VARCHAR(45) NOT NULL,
    street VARCHAR(45) NOT NULL,
    postcode CHAR(4) NOT NULL,
    tariffID CHAR(2) NOT NULL, 
    InsuranceID VARCHAR(15),  -- This can be NULL
    PRIMARY KEY (Date),
    FOREIGN KEY (DepotID) REFERENCES Depot(DepotID) ON UPDATE CASCADE ON DELETE NO ACTION,
    FOREIGN KEY (regNum) REFERENCES Vehicle(regNum) ON UPDATE CASCADE ON DELETE NO ACTION,
    FOREIGN KEY (address, street, postcode) REFERENCES PersonalClient(address, street, postcode) ON UPDATE CASCADE ON DELETE NO ACTION,
    FOREIGN KEY (tariffID) REFERENCES DailyTariff(tariffID) ON UPDATE CASCADE ON DELETE NO ACTION,
    FOREIGN KEY (InsuranceID) REFERENCES Insurance(insuranceID) ON UPDATE CASCADE ON DELETE NO ACTION
);
INSERT INTO HiredVehicle (Date, cardType, cardNo, Odometer, Days, DepotID, regNum, address, street, postcode, tariffID, InsuranceID) VALUES
('2024-10-01', 'CC', '1234567890123456', 12000, 5, 1, 'ABC1234', '123 Main St', 'Main', '1234', 'T01', 'INS001'),
('2024-10-02', 'DC', '2345678901234567', 15000, 3, 2, 'DEF5678', '456 Elm St', 'Elm', '2345', 'T02', NULL),
('2024-10-03', 'CC', '3456789012345678', 20000, 7, 1, 'GHI9101', '789 Oak St', 'Oak', '3456', 'T03', 'INS002');

DROP TABLE IF EXISTS Nomination;
CREATE TABLE Nomination (
    address VARCHAR(45) NOT NULL,
    street VARCHAR(45) NOT NULL,
    postcode CHAR(4) NOT NULL,
    Date DATE NOT NULL,
    PRIMARY KEY (address, street, postcode, Date),
    FOREIGN KEY (address, street, postcode) REFERENCES PersonalClient(address, street, postcode) ON DELETE CASCADE,
    FOREIGN KEY (Date) REFERENCES HiredVehicle(Date) ON DELETE CASCADE
);

INSERT INTO Nomination (address, street, postcode, Date) VALUES
('123 Main St', 'Main', '1234', '2024-10-01'),
('456 Elm St', 'Elm', '2345', '2024-10-02'),
('789 Oak St', 'Oak', '3456', '2024-10-03');

DROP TABLE IF EXISTS Invoice;
CREATE TABLE Invoice (
    InvoiceID INT(10) NOT NULL, 
    qualityCheck VARCHAR(3), --an indication that the vehicle passed a quality check (a 'Yes' or 'No') 
    datePaid DATE,
    Date DATE NOT NULL,
    PRIMARY KEY (InvoiceID),
    FOREIGN KEY (Date) REFERENCES HiredVehicle(Date) ON UPDATE CASCADE ON DELETE CASCADE
);
INSERT INTO Invoice (InvoiceID, qualityCheck, datePaid, Date) VALUES
(1, 'Yes', '2024-10-05', '2024-10-01'),
(2, 'No', NULL, '2024-10-02'),
(3, 'Yes', '2024-10-04', '2024-10-03');

