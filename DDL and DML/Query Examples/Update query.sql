USE `BBLTRAVELSTEST`;

-- DELETE FROM `POSTS` WHERE POSTID = '2';

UPDATE `POSTS`

SET PostTitle = 'New Title', PostDate = '2022-03-20 23:59:59', ExpirationDate = '2025-03-20 23:59:59', FeatureImage = 'New Image', CategoryID = '3', UserID = '1'

WHERE PostID = '1';