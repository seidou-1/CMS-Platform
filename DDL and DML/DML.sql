USE `BBLTravels`;

INSERT INTO `CATEGORIES` (CategoryName)
VALUES 
('Beaches'),
('Sky Scrapers'),
('Views')
;





INSERT INTO `USERS` (UserName, UserEmail, UserPassword, UserAvatar, Enabled)
VALUES 
('molife', 'molife@shinobilife.com', '1', 'smiley face', 1),
('asherlife', 'asherlife@shinobilife.com', '1', 'straight face', 1),
('mattlife', 'asherlife@shinobilife.com', '1', 'straight face', 1),
('travzlife', 'travzlife@shinobilife.com', '1', 'straight face', 1)
;

INSERT INTO `Authorities` (UserName, Authority)
VALUES 
('molife', 'ROLE_USER'),
('molife', 'ROLE_ADMIN'),
('asherlife', 'ROLE_USER'),
('asherlife', 'ROLE_ADMIN'),
('mattlife', 'ROLE_USER'),
('mattlife', 'ROLE_ADMIN'),
('travzlife', 'ROLE_USER'),
('travzlife', 'ROLE_ADMIN')
;

INSERT INTO `PERMISSIONS` (Authority, UserCrud, AddPosts, DeletePosts, UpdatePosts, AddCategories, DeleteCategories, ReadPosts)
VALUES 
('ROLE_USER', '0', '1', '0', '0', '0', '0', '1'), -- Contributor
('ROLE_ADMIN', '1', '1', '1', '1', '1', '1', '1') -- Admin
;
 
INSERT INTO`POSTS` (PostTitle,  PostDate, ExpirationDate, FeatureImage, CategoryID, UserID, PostBody)
VALUES 
('Adventerous Views', '2018-03-20 23:59:59', '2018-03-20 23:59:59', 'Beach Vibes', '2', '2', 'I look at all types of Adventerous Views'),
('Scenes from the streams', '2018-03-20 23:59:59', '2018-03-20 23:59:59', 'Image of the sky', '3', '1', 'I look at all types of scenes'),
('Night and Day Meals', '2016-05-10 20:59:59', '2013-03-15 11:00:12', 'Image of the sky', '2', '1', 'I look at all types of day and night meals')
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

INSERT INTO `notifications` (NotificationClass, NotificationDate, NotificationType, Username, ID, NotificationBrief)
VALUES 
('create','2018-04-20 12:30:30', 'post', 'asherlife', 1, 'I look at all types of Adventerous View'),
('create','2018-04-20 12:30:30', 'tag', 'asherlife', 1, 'Ice Cream'),
('modify','2018-04-20 12:30:30', 'category', 'asherlife', 1, 'Beaches'),
('modify','2018-04-20 12:30:30', 'post', 'asherlife', 1, 'I look at all types of Adventerous View'),
('create','2018-04-20 12:30:30', 'category', 'asherlife', 1, 'Beaches'),
('delete','2018-04-20 12:30:30', 'post', 'asherlife', 1, 'I look at all types of Adventerous View'),
('delete','2018-04-20 12:30:30', 'tag', 'asherlife', 1, 'Ice Cream'),
('create','2018-04-20 12:30:30', 'post', 'molife', 1, 'I look at all types of Adventerous View'),
('create','2018-04-20 12:30:30', 'tag', 'molife', 1, 'Ice Cream'),
('modify','2018-04-20 12:30:30', 'category', 'molife', 1, 'Beaches'),
('modify','2018-04-20 12:30:30', 'post', 'molife', 1, 'I look at all types of Adventerous View'),
('create','2018-04-20 12:30:30', 'category', 'molife', 1, 'Beaches'),
('delete','2018-04-20 12:30:30', 'post', 'molife', 1, 'I look at all types of Adventerous View'),
('delete','2018-04-20 12:30:30', 'tag', 'molife', 1, 'All things Ice Cream'),
('create','2018-04-20 12:30:30', 'post', 'mattlife', 1, 'I look at all types of Adventerous View'),
('create','2018-04-20 12:30:30', 'tag', 'mattlife', 1, 'Ice Cream'),
('modify','2018-04-20 12:30:30', 'category', 'mattlife', 1, 'Beaches'),
('modify','2018-04-20 12:30:30', 'post', 'mattlife', 1, 'I look at all types of Adventerous View'),
('create','2018-04-20 12:30:30', 'category', 'mattlife', 1, 'Beaches'),
('delete','2018-04-20 12:30:30', 'post', 'mattlife', 1, 'I look at all types of Adventerous View'),
('delete','2018-04-20 12:30:30', 'tag', 'mattlife', 1, 'Ice Cream'),
('create','2018-04-20 12:30:30', 'post', 'travzlife', 1, 'I look at all types of Adventerous View'),
('create','2018-04-20 12:30:30', 'tag', 'travzlife', 1, 'Ice Cream'),
('modify','2018-04-20 12:30:30', 'category', 'travzlife', 1, 'Beaches'),
('modify','2018-04-20 12:30:30', 'post', 'travzlife', 1, 'I look at all types of Adventerous View'),
('create','2018-04-20 12:30:30', 'category', 'travzlife', 1, 'Beaches'),
('delete','2018-04-20 12:30:30', 'post', 'travzlife', 1, 'I look at all types of Adventerous View'),
('delete','2018-04-20 12:30:30', 'tag', 'travzlife', 1, 'Ice Cream') 
;

 
select * from `notifications`;

