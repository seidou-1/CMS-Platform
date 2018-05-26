DROP DATABASE IF EXISTS `BBLTravels`;
CREATE DATABASE `BBLTravels`;
USE `BBLTravels`;

 
 -- Permission Table--
CREATE TABLE IF NOT EXISTS `Permissions` (
 `PermissionID` INT NOT NULL AUTO_INCREMENT,
 `UserCrud` boolean NOT NULL,
 `AddPosts` boolean NOT NULL,
 `DeletePosts` boolean NOT NULL,
 `UpdatePosts` boolean NOT NULL,
 `AddCategories` boolean NOT NULL,
 `DeleteCategories` boolean NOT NULL,
 `ReadPosts` boolean NOT NULL,
 PRIMARY KEY (`PermissionID`)
 );
 
 
-- User Type Table--
CREATE TABLE IF NOT EXISTS `UserTypes` (
 `UserTypeID` INT NOT NULL AUTO_INCREMENT,
 `UserType` VARCHAR(100) NOT NULL,
 `PermissionID` INT NOT NULL,
 PRIMARY KEY (`UserTypeID`),
   CONSTRAINT `fk_UserTypes_Permissions`
   FOREIGN KEY (`PermissionID`)
   REFERENCES `Permissions` (`PermissionID`)
   ON DELETE Cascade
 );

-- Users Table--
CREATE TABLE IF NOT EXISTS `Users` (
 `UserID` INT NOT NULL AUTO_INCREMENT,
 `UserTypeID` INT NOT NULL,
 `UserName` VARCHAR(100) NOT NULL,
 `UserEmail` VARCHAR(100) NOT NULL,
 `UserPassword` VARCHAR(100) NOT NULL,
 `UserAvatar` VARCHAR(100) NOT NULL,
 PRIMARY KEY (`UserID`),
 CONSTRAINT `fk_Users_UserTypes`
 
 -- Mo: This table was just floating with the Permissions table above. Made a relationship connection between Users and UserTypes
 FOREIGN KEY (`UserTypeID`)
 REFERENCES `UserTypes` (`UserTypeID`)
 ON DELETE CASCADE
 
 );
 
-- Categories Table--
CREATE TABLE IF NOT EXISTS `Categories` (
 `CategoryID` INT NOT NULL AUTO_INCREMENT,
 `CategoryName` VARCHAR(100) NOT NULL,
 PRIMARY KEY (`CategoryID`));
 
 -- Tags Table--
CREATE TABLE IF NOT EXISTS `Tags` (
 `TagID` INT NOT NULL AUTO_INCREMENT,
 `TagName` VARCHAR(100) NOT NULL,
 PRIMARY KEY (`TagID`));
 
 -- Posts --
CREATE TABLE IF NOT EXISTS `Posts` (
 `PostID` INT NOT NULL AUTO_INCREMENT,
 `PostTitle` VARCHAR(100) NOT NULL,
 
 -- Mo: Changed data types of dates below from VARCHAR(100) to DATETIME
 `PostDate` DATETIME NOT NULL,
 `ExpirationDate` DATETIME NOT NULL,
 
 `FeatureImage` VARCHAR(100) NOT NULL,
 `CategoryID` INT NOT NULL,
 `UserID` INT NOT NULL,
 PRIMARY KEY (`PostID`),
  CONSTRAINT `fk_Post_Categories`
   FOREIGN KEY (`CategoryID`)
   REFERENCES `Categories` (`CategoryID`)
   ON DELETE Cascade,
  CONSTRAINT `fk_Post_User`
   FOREIGN KEY (`UserID`)
   REFERENCES `Users` (`UserID`)
   ON DELETE Cascade
);

 -- Posts to Tags bridge table -- 
CREATE TABLE IF NOT EXISTS `Posts_Tags` (
`PostID` INT NOT NULL,
`TagID` INT NOT NULL,
 PRIMARY KEY (`PostID`, `TagID`),
 CONSTRAINT `fk_Posts_Tags_Posts`
   FOREIGN KEY (`PostID`)
   REFERENCES `Posts` (`PostID`)
   ON DELETE CASCADE,
 CONSTRAINT `fk_Posts_Tags_Tags`
   FOREIGN KEY (`TagID`)
   REFERENCES `Tags` (`TagID`)
   ON DELETE CASCADE
 );
 




