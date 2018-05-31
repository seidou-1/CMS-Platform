<<<<<<< HEAD
USE `BBLTravelsTest`;
=======
USE `BBLTravels`;
>>>>>>> 56be3ccf71c7b79e9c024cbf396beaff8bf29045

INSERT INTO `CATEGORIES` (CategoryName)
VALUES 
('Beaches'),
('Sky Scrapers'),
('Views')
;

INSERT INTO `PERMISSIONS` (UserCrud, AddPosts, DeletePosts, UpdatePosts, AddCategories, DeleteCategories, ReadPosts)
VALUES 
('0', '1', '0', '0', '0', '0', '1'), -- Contributor
('1', '1', '1', '1', '1', '1', '1') -- Admin
;

INSERT INTO `USERTYPES` (UserType, PermissionID)
VALUES 
('Contributor', '1'),
('Admin', '2')
;

INSERT INTO `USERS` (UserTypeID, UserName, UserEmail, UserPassword, UserAvatar)
VALUES 
('1', 'chopstickSauce234', 'jackson5@mj.com', '123456', 'smiley face'),
('1', 'fuegoDjengo123', 'fab5@michigan.com', 'abcdef', 'straight face')
;

INSERT INTO`POSTS` (PostTitle, PostDate, ExpirationDate, FeatureImage, CategoryID, UserID)
VALUES 
('Adventerous Views', '2018-03-20 23:59:59', '2018-03-20 23:59:59', 'Beach Vibes', '2', '2'),
<<<<<<< HEAD
('Scenes from the streams', '2018-03-20 23:59:59', '2018-03-20 23:59:59', 'Image of the sky', '3', '1'),
('Night and Day Meals', '2016-05-10 20:59:59', '2013-03-15 11:00:12', 'Image of the sky', '2', '1')
=======
('Scenes from the streams', '2018-03-20 23:59:59', '2018-03-20 23:59:59', 'Image of the sky', '3', '1')
>>>>>>> 56be3ccf71c7b79e9c024cbf396beaff8bf29045
;

INSERT INTO `TAGS` (TagName)
VALUES
('Ice Cream'),
('Programming'),
<<<<<<< HEAD
('Mountains'),
('FISHING');

INSERT INTO `POSTS_TAGS` (PostID, TagID)
VALUES
('1', '1'),
('1', '2'),
('1', '3'),
('1', '4'),
('2', '1'),
('2', '2'),
('2', '3'),
('2', '4');
=======
('Mountains');

INSERT INTO `POSTS_TAGS` (PostID, TagID)
VALUES
('2', '2');
>>>>>>> 56be3ccf71c7b79e9c024cbf396beaff8bf29045

