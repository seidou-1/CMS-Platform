USE `BBLTravels`;

INSERT INTO `CATEGORIES` (CategoryName, CategoryDesc, CategoryStatus, ApprovedBy, CreatedBy)
VALUES 
('Sky', 'This category deals with the sky and its beautiful features', 'Approved', 1, 3),
('Technology', 'This category deals everything that has to do with tech', 'Approved', 2, 3),
('Computers', 'Everything that computers have to do in this world', 'Approved', 3, 2),
('Planes', 'Where did planes come from?', 4, 2),
('Animals', 'Are animals really tasty?', 1, 4),
('Creatures', 'What kind of creatures come fro beneath the earth', 2, 4),
('Adventure', 'What kind of spooky adventures did we get into today!', 'Approved', 3, 1),
('Vehicles', 'Look at us repair vehicles and talk fast cars',  'Approved', 4, 1),
('Peanuts', 'Do you like nuts as much as the other guy?', 'Approved', 1, 3),
('Money', 'No time for broke mofos. Lets get this cash!', 'Approved', 2, 3),
('US Dollars', 'Lets explore the economy together', 'Approved', 3, 4),
('Stocks', 'My stocks or your stocks, which one is better', 'Approved', 4, 2),
('List', 'I have a list that one day the world will no longer be flat', 'Approved', 1, 2),
('Fear', 'Watch us abandon our fears and talk to the most attractive sharks out there', 'Approved', 3, 2),
('Life', 'Important life lessons taught by a two hyear old', 'Approved', 2, 1),
('Girls', 'Only bad chicks allowed', 'Approved', 4, 1),
('Soap', 'The benefits of bathing with soap',  4, 4),
('Fans', 'This category makes all the fans happy', 1, 4)
;





INSERT INTO `USERS` (UserName, UserEmail, UserPassword, UserAvatar, Enabled, LastActive)
VALUES 
('molife', 'molife@shinobilife.com', '1', 'smiley face', 1, '2018-02-20 23:59:59'),
('asherlife', 'asherlife@shinobilife.com', '1', 'straight face', 1, '2018-01-12 23:59:59'),
('mattlife', 'asherlife@shinobilife.com', '1', 'straight face', 1, '2018-03-30 23:59:59'),
('travzlife', 'travzlife@shinobilife.com', '1', 'straight face', 1, '2018-01-11 23:59:59')
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


