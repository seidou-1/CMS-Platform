DROP DATABASE IF EXISTS `BBLTravels`;
CREATE DATABASE `BBLTravels`;
USE `BBLTravels`;

 

-- Users Table--
CREATE TABLE IF NOT EXISTS `Users` (
 `UserID` INT NOT NULL AUTO_INCREMENT,
 `UserName` VARCHAR(100) NOT NULL,
 `UserEmail` VARCHAR(100) NOT NULL,
 `UserPassword` VARCHAR(100) NOT NULL,
 `UserAvatar` VARCHAR(100) NOT NULL,
 `LastActive`  DATETIME NOT NULL,
--  Mo: Included Enabled for active\inactive user. This is a boolean 0 for inactive, 1 for active
 `Enabled` tinyint(1) NOT NULL,
 PRIMARY KEY (`UserID`),
 -- Mo: Modifyed this table to include Aurhorities for Spring Security
 KEY `UserName` (`UserName`)
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
 
 
 

 
-- Authorities table
 
CREATE TABLE IF NOT EXISTS `Authorities` (
`UserName` varchar(20) NOT NULL,
`Authority` varchar(20) NOT NULL,
 PRIMARY KEY (`UserName`, `Authority`),
 KEY `Authority` (`authority`), 
 CONSTRAINT `fk_Authorities_Users`
   FOREIGN KEY (`UserName`)
   REFERENCES `Users` (`UserName`)
   ON DELETE CASCADE
 )ENGINE=InnoDB DEFAULT CHARSET=latin1;
 
 -- Permission Table--
CREATE TABLE IF NOT EXISTS `Permissions` (
 `Authority` varchar(20) NOT NULL,
 `UserCrud` boolean NOT NULL,
 `AddPosts` boolean NOT NULL,
 `DeletePosts` boolean NOT NULL,
 `UpdatePosts` boolean NOT NULL,
 `AddCategories` boolean NOT NULL,
 `DeleteCategories` boolean NOT NULL,
 `ReadPosts` boolean NOT NULL,
 PRIMARY KEY (`Authority`),
  CONSTRAINT `fk_Permissions_Authorities`
   FOREIGN KEY (`Authority`)
   REFERENCES `Authorities` (`authority`)
   ON DELETE No Action
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
 
 


 -- Took out this Auto Increment thing
 -- AUTO_INCREMENT=3 
 
-- Categories Table--
CREATE TABLE IF NOT EXISTS `Categories` (
 `CategoryID` INT NOT NULL AUTO_INCREMENT,
 `CategoryDesc` VARCHAR(500) NULL,
 `CategoryName` VARCHAR(100) NOT NULL,
 `CategoryStatus` VARCHAR(100) NOT NULL,
 `ApprovedBy` INT NULL,
 `CreatedBy` INT NULL,
  PRIMARY KEY (`CategoryID`),
  CONSTRAINT `fk_Cat_Approved`
   FOREIGN KEY (`ApprovedBy`)
   REFERENCES `Users` (`UserID`)
   ON DELETE NO ACTION,
     CONSTRAINT `fk_Cat_Create`
   FOREIGN KEY (`CreatedBy`)
   REFERENCES `Users` (`UserID`)
   ON DELETE NO ACTION
);
 
  
 -- Tags Table--
CREATE TABLE IF NOT EXISTS `Tags` (
 `TagID` INT NOT NULL AUTO_INCREMENT,
 `TagName` VARCHAR(100) NOT NULL,
  `TagStatus` VARCHAR(100) NOT NULL,
   `CreatedBy` INT NULL,
 PRIMARY KEY (`TagID`)) ENGINE=InnoDB DEFAULT CHARSET=latin1;
  
 -- Posts --
CREATE TABLE IF NOT EXISTS `Posts` (
 `PostID` INT NOT NULL AUTO_INCREMENT,
 `PostTitle` VARCHAR(100) NOT NULL,
 `PostStatus` VARCHAR(100) NOT NULL,
 `PostBody` LONGTEXT NOT NULL,
 `PostDesc` LONGTEXT NOT NULL,
 
 
 -- Mo: Changed data types of dates below from VARCHAR(100) to DATETIME
 `PostDate` DATETIME NOT NULL,
 `ExpirationDate` DATETIME NULL,
 
 `FeatureImage` VARCHAR(200) NULL,
 `Likes` INT NULL,
 `Readers` INT NULL,
 `Shares` INT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
 
 
  -- Posts to Tags bridge table -- 
CREATE TABLE IF NOT EXISTS `Notifications` (
`NotificationID` INT NOT NULL AUTO_INCREMENT,
`NotificationClass` VARCHAR(20) NOT NULL,
`NotificationDate` DATETIME NOT NULL,
`NotificationType` VARCHAR(20) NOT NULL,
`NotificationBrief` LONGTEXT NOT NULL,
`NotificationStatus` LONGTEXT NOT NULL,
`Username` VARCHAR(20) NOT NULL,
`ID` INT NOT NULL,
 PRIMARY KEY (`NotificationID`),
 CONSTRAINT `fk_Notifications_Username`
   FOREIGN KEY (`Username`)
   REFERENCES `Users` (`Username`)
   ON DELETE NO ACTION 
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;



