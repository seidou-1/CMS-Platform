USE `BBLTravels`;

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
('Scenes from the streams', '2018-03-20 23:59:59', '2018-03-20 23:59:59', 'Image of the sky', '3', '1')
;

INSERT INTO `TAGS` (TagName)
VALUES
('Ice Cream'),
('Programming'),
('Mountains');

INSERT INTO `POSTS_TAGS` (PostID, TagID)
VALUES
('2', '2');

