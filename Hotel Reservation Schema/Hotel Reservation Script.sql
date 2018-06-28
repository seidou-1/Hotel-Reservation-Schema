CREATE DATABASE IF NOT EXISTS HotelReservation;

USE HotelReservation;



CREATE TABLE IF NOT EXISTS `AddOns`(
    `AddOnsID` int not null auto_increment,
    `RoomService` boolean null,
    `Movies` boolean null,
    `Description` mediumtext null,

    `BillID` int not null,
    `ReservationID` int not null,
    PRIMARY KEY (`AddOnsID`)
    /*
    pk_tablename and fk_primarytable_foreigntable
    FKs - 
    */

);

CREATE TABLE IF NOT EXISTS `Bill` (
`BillID` int not null auto_increment,
`From` DATE null,
`To` DATE null,
`Description` mediumtext null,
PRIMARY KEY (`BillID`)

);

CREATE TABLE IF NOT EXISTS `BillingDetails` (
`BillingDetailsID` int not null auto_increment,
`RoomCharges` float null,
`RoomChargesDescription` mediumtext null,

`BillID` int not null,
PRIMARY KEY (`BillingDetailsID`)
); 

CREATE TABLE IF NOT EXISTS `Customer` (
`CustomerID` int not null auto_increment,
`FirstName` varchar(45) not null,
`LastName` varchar(45) not null,
`Email` varchar(45) null,
`Phone` varchar(45) null,
`Age` int null,
PRIMARY KEY (`CustomerID`)
);

CREATE TABLE IF NOT EXISTS `Guests` (
`GuestID` int not null auto_increment,
`FirstName` varchar(45) not null,
`LastName` varchar(45) not null,
`Email` varchar(45) null,
`Phone` varchar(45) null,
`Age` int null,

`CustomerID` int not null,
PRIMARY KEY (`GuestID`)
);

CREATE TABLE IF NOT EXISTS `PromotionCodes` (
`PromotionCodesID` int not null auto_increment,
`ConferenceAttendee` boolean null,
`CorporateClient` boolean null,
`From` DATE null,
`To` DATE null,
`DiscountRate` float null,

`ReservationID` int not null,
`BillID` int not null,
PRIMARY KEY (`PromotionCodesID`)
);

CREATE TABLE IF NOT EXISTS `Reservation` (
`ReservationID` int not null auto_increment,
`From` DATE not null,
`To` DATE not null,

`CustomerID` int not null,
PRIMARY KEY (`ReservationID`)
);

CREATE TABLE IF NOT EXISTS `ReservationRoom` (
`ReservationRoomID` int not null auto_increment,

`ReservationID` int not null,
`RoomID` int not null,
PRIMARY KEY (`ReservationRoomID`)
);

CREATE TABLE IF NOT EXISTS `Room` (
`RoomID` int not null auto_increment,
`Floor` int not null,
`OccupancyLimit` int null,
PRIMARY KEY (`RoomID`)
);

CREATE TABLE IF NOT EXISTS `RoomType` (
`RoomTypeID` int not null auto_increment,
`Single` boolean null,
`Double` boolean null,
`King` boolean null,
`Queen` boolean null,

`RoomID` int not null,
PRIMARY KEY (`RoomTypeID`)
);

CREATE TABLE IF NOT EXISTS `RoomAmenities` (
`RoomAmenitiesID` int not null auto_increment,
`Fridge` boolean null,
`Spa` boolean null,
`Jacuzzi` boolean null,

`RoomID` int not null,
PRIMARY KEY (`RoomAmenitiesID`)
);

CREATE TABLE IF NOT EXISTS `RoomRate` (
`RoomRateID` int not null auto_increment,
`ShortTermEvent` boolean null,

`RoomTypeID` int not null,
PRIMARY KEY (`RoomRateID`)
);

CREATE TABLE IF NOT EXISTS `RoomRateDate` (
`RoomRateDateID` int not null auto_increment,
`From` DATE not null,
`To` DATE not null,

`RoomRateID` int not null,
PRIMARY KEY(`RoomRateDateID`)
);

CREATE TABLE IF NOT EXISTS `Season` (
`SeasonID` int not null auto_increment,
`Spring` boolean null,
`Fall` boolean null,
`Winter` boolean null,
`Summer` boolean null,

`RoomRateID` int not null,
PRIMARY KEY (`SeasonID`)
);

-- ALTER TABLE `Movie`
--  ADD CONSTRAINT `fk_MovieGenre` FOREIGN KEY (`GenreID`) REFERENCES `Genre`
-- (`GenreID`) ON DELETE NO ACTION;

-- fk_primarytable_foreigntable


-- *********************AddOns TABLE************************
ALTER TABLE `AddOns`
ADD CONSTRAINT `fk_AddOns_Bill` FOREIGN KEY (`BillID`) REFERENCES `Bill`
(`BillID`) ON DELETE NO ACTION;

ALTER TABLE `AddOns`
ADD CONSTRAINT `fk_AddOns_Reservation` FOREIGN KEY (`ReservationID`) REFERENCES `Reservation`
(`ReservationID`) ON DELETE NO ACTION;

-- **********************************************************


-- ******************BillingDetails TABLE********************
ALTER TABLE `BillingDetails`
ADD CONSTRAINT `fk_BillingDetails_Bill` FOREIGN KEY (`BillID`) REFERENCES `Bill`
(`BillID`) ON DELETE NO ACTION;

-- **********************************************************


-- **********************Guests TABLE************************
ALTER TABLE `Guests`
ADD CONSTRAINT `fk_Guests_Customer` FOREIGN KEY (`CustomerID`) REFERENCES `Customer`
(`CustomerID`) ON DELETE NO ACTION;

-- **********************************************************


-- *******************PromotionCodes TABLE*******************
ALTER TABLE `PromotionCodes`
ADD CONSTRAINT `fk_PromotionCodes_Reservation` FOREIGN KEY (`ReservationID`) REFERENCES `Reservation`
(`ReservationID`) ON DELETE NO ACTION;

ALTER TABLE `PromotionCodes`
ADD CONSTRAINT `fk_PromotionCodes_Bill` FOREIGN KEY (`BillID`) REFERENCES `Bill`
(`BillID`) ON DELETE NO ACTION;

-- **********************************************************


-- *********************Reservation TABLE********************
ALTER TABLE `Reservation`
ADD CONSTRAINT `fk_Reservation_Customer` FOREIGN KEY (`CustomerID`) REFERENCES `Customer`
(`CustomerID`) ON DELETE NO ACTION;

-- **********************************************************


-- ******************Reservation_Room TABLE******************
ALTER TABLE `ReservationRoom`
ADD CONSTRAINT `fk_ReservationRoom_Reservation` FOREIGN KEY (`ReservationID`) REFERENCES `Reservation`
(`ReservationID`) ON DELETE NO ACTION;

ALTER TABLE `ReservationRoom`
ADD CONSTRAINT `fk_ReservationRoom_Room` FOREIGN KEY (`RoomId`) REFERENCES `Room`
(`RoomID`) ON DELETE NO ACTION;
-- **********************************************************

-- *******************Room_Amenities TABLE*******************
ALTER TABLE `RoomAmenities` 
ADD CONSTRAINT `fk_RoomAmenities_Room` FOREIGN KEY (`RoomID`) REFERENCES `Room`
(`RoomID`) ON DELETE NO ACTION;

-- **********************************************************


-- *********************Room_Rates TABLE*********************
ALTER TABLE `RoomRate` 
ADD CONSTRAINT `fk_RoomRate_RoomType` FOREIGN KEY (`RoomTypeID`) REFERENCES `RoomType`
(`RoomTypeID`) ON DELETE NO ACTION;

-- **********************************************************


-- ********************RoomRateDate TABLE********************
ALTER TABLE `RoomRateDate`
ADD CONSTRAINT `fk_RoomRateDate_RoomRate` FOREIGN KEY (`RoomRateID`) REFERENCES `RoomRate`
(`RoomRateID`) ON DELETE NO ACTION;

-- **********************************************************


-- **********************RoomType TABLE**********************
ALTER TABLE `RoomType`
ADD CONSTRAINT `fk_RoomType_Room` FOREIGN KEY (`RoomID`) REFERENCES `Room`
(`RoomID`) ON DELETE NO ACTION;

-- **********************************************************


-- **********************Season TABLE************************
ALTER TABLE `Season`
ADD CONSTRAINT `fk_Season_RoomRate` FOREIGN KEY (`RoomRateID`) REFERENCES `RoomRate`
(`RoomRateID`) ON DELETE NO ACTION;

-- **********************************************************
