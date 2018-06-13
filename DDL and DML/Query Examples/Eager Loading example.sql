-- SELECT * FROM BBLTravelsTest.Posts_Tags;

-- THIS IS CALLED EAGER LOADING BECAUSE... EAGER TO GET ALL THE DATA
USE `BBLTRAVELSTEST`;

SELECT * FROM BBLTRAVELSTEST.POSTS

INNER JOIN CATEGORIES ON CATEGORIES.CATEGORYID = POSTS.CATEGORYID

INNER JOIN USERS ON USERS.USERID = POSTS.USERID

LEFT  JOIN POSTS_TAGS ON POSTS.POSTID = POSTS_TAGS.POSTID

LEFT JOIN TAGS ON TAGS.TAGID = POSTS_TAGS.TAGID;