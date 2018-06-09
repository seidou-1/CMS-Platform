USE `BBLTravelsTest`;

INSERT INTO `CATEGORIES` (CategoryName)
VALUES 
('Beaches'),
('Sky Scrapers'),
('Views')
;

INSERT INTO `PERMISSIONS` (UserCrud, AddPosts, DeletePosts, UpdatePosts, AddCategories, DeleteCategories, ReadPosts)
VALUES 
('0', '1', '0', '0', '0', '0', '1'), -- Standard
('1', '1', '1', '1', '1', '1', '1') -- Admin
;

INSERT INTO `USERTYPES` (UserType, PermissionID)
VALUES 
('admin', '1'),
('standard', '2')
;

INSERT INTO `USERS` (UserTypeID, UserName, UserEmail, UserPassword, UserAvatar, Enabled)
VALUES 
('1', 'admin', 'jackson5@mj.com', '123456', 'smiley face','1'),
('2', 'standard', 'fab5@michigan.com', 'abcdef', 'straight face','1')
;

INSERT INTO`POSTS` (PostTitle, PostBody, PostDate, ExpirationDate, FeatureImage, CategoryID, UserID)
VALUES 
('Adventerous Views', 'Stuff stuffer stuffest', '2018-03-20 23:59:59', '2018-03-20 23:59:59', 'Beach Vibes', '2', '2'),
('Scenes from the streams', 'Stuff stuffer stuffestester', '2018-03-20 23:59:59', '2018-03-20 23:59:59', 'Image of the sky', '3', '1'),
('Night and Day Meals', 'Stuff stuffer stuffesterrrrer', '2016-05-10 20:59:59', '2013-03-15 11:00:12', 'Image of the sky', '2', '1')
;

INSERT INTO `TAGS` (TagName)
VALUES
('Ice Cream'),
('Programming'),
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

INSERT INTO `AUTHORITIES`(UserName, Authority) 
VALUES
('admin', 'ROLE_ADMIN'),
('admin', 'ROLE_STANDARD'),
('standard', 'ROLE_STANDARD');