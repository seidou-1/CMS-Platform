USE `BBLTravels`;


INSERT INTO `USERS` (UserName, UserEmail, UserPassword, UserAvatar, Enabled, LastActive)
VALUES 
('molife', 'molife@shinobilife.com', '1', 'smiley face', 1, '2018-02-20 23:59:59'),
('asherlife', 'asherlife@shinobilife.com', '1', 'straight face', 1, '2018-01-12 23:59:59'),
('mattlife', 'asherlife@shinobilife.com', '1', 'straight face', 1, '2018-03-30 23:59:59'),
('travzlife', 'travzlife@shinobilife.com', '1', 'straight face', 1, '2018-01-11 23:59:59')
;


INSERT INTO `CATEGORIES` (CategoryName, CategoryDesc, CategoryStatus, ApprovedBy, CreatedBy)
VALUES 
('Sky', 'This category deals with the sky and its beautiful features', 'Approved', 1, 3),
('Technology', 'This category deals everything that has to do with tech', 'Approved', 2, 3),
('Computers', 'Everything that computers have to do in this world', 'Approved', 3, 2),
('Planes', 'Where did planes come from?', 'Approved', 4, 2),
('Animals', 'Are animals really tasty?', 'Approved', 1, 4),
('Creatures', 'What kind of creatures come fro beneath the earth', 'Approved', 2, 4),
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
('Soap', 'The benefits of bathing with soap', 'Approved',  4, 4),
('Fans', 'This category makes all the fans happy', 'Approved', 1, 4);


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
 


INSERT INTO `TAGS` (TagName, TagStatus, CreatedBy)
VALUES
('Ice Cream', 'Approved', 1),
('Programming', 'Approved', 1),
('Mountains', 'Approved', 1),
('Dogs', 'Approved', 1),
('Cats', 'Approved', 2),
('Water', 'Approved', 2),
('Facebook', 'Approved', 2),
('Thor', 'Approved', 2),
('Superhero', 'Approved', 3),
('Dumb People', 'Approved', 3),
('Wardrobe', 'Approved', 3),
('Goya', 'Approved', 3),
('Seasoning', 'Approved', 3),
('Lettuce', 'Approved', 3),
('Meg', 'Approved', 4),
('Anime', 'Approved', 4),
('VAT', 'Approved', 4),
('Lightbulbs', 'Approved', 4),
('Exercise', 'Approved', 4),
('Feelings', 'Approved', 4),
('10s', 'Approved', 4),
('Gloricida', 'Approved', 4)
;


INSERT INTO`POSTS` (PostTitle,  PostDate, ExpirationDate, FeatureImage, CategoryID, UserID, PostDesc,  PostBody, PostStatus, Likes, Shares, Readers)
VALUES 
('Life on edge', '2018-03-20 23:59:59', '2018-03-20 23:59:59', 'https://res.cloudinary.com/jollystudios/image/upload/v1538609984/800px_COLOURBOX11338932.jpg', '1', '1', 
'Have you ever something crazy? Like, really out of this world. How did it feel. Guess what we did this weekend! Find out how we did some crazy stuff and went all the way to the top!',
'I am not sure if you want to make a permanent change, or just want a radical experience to shake up your life a little. I am assuming the latter. Here’s my two cents’ worth;
Go to South Africa and help build RDP housing for the poor. While you’re there, take a wildlife conservation course and spend some time tracking elephants and rhino (before they’re poached into extinction). Shark cage diving is also a good option.
Travel to each of the “Seven Wonders of the World” - there are several of these lists, so you can choose one that interests you. Do a vlog (video blog) at each one and post it to Youtube to record your achievements. You may be able to get sponsorship to help offset the costs.
Do a long and gruelling hike/bicycle ride between two remote and well-known landmarks. Or choose the route of an early explorer and follow it.
Echoing one of the previous posters, go to Taiwan to teach English. It’s an easy life with good pay - as long as you don’t have to send your money back to the West.
Go to a Buddhist monastery and spend a week in silent contemplation. It will give you a whole new appreciation for cheeseburgers.
Write down the names of all of the safe, moderately civilised countries in the world on pieces of paper, put them in a hat and draw one. Get on a plane and go there without reading anything about it or making any plans as to were to stay or what to do.
Think of something that scares the living daylights out of you (and is not guaranteed to kill you) and do that.',
'Approved', 13056, 433, 20233
),
('Technicolor beat', '2018-03-20 23:59:59', '2018-03-20 23:59:59', 'https://res.cloudinary.com/jollystudios/image/upload/v1538610104/the_wizard_of_oz-11601.jpg', '1', '1', 
'Have you ever something crazy? Like, really out of this world. How did it feel. Guess what we did this weekend! Find out how we did some crazy stuff and went all the way to the top!',
'No one is going to fix you , you gotta help yourself.
You need to accept yourself , the way you are.
Life will never be perfect.
Failures are an important part of our life.
Your achievements in life won’t matter on death bed.
Nobody cares how difficult your life is. Everyone is busy in his/her life.
We are always in hurry but hardly ever on time.
Poor people have no friends.
Nobody wants you to be yourself. They want you to be the person they like being around.
We people judge others by their actions & ourselves by our intentions.',
'Approved', 1056, 43, 2023
),

('Colouring this life', '2018-03-20 23:59:59', '2018-03-20 23:59:59', 'https://res.cloudinary.com/jollystudios/image/upload/v1538610458/random_ugly_paint_deidara_by_heiditheodd.jpg', '2', '2', 
'A wise man once said, Girl, you color my life, like its all in crayons. You mustve come from a magazine. That man is known as the World Boss. Heres why we should strive to paint some more ',
'This is a digital painting I did some time ago. It has its blatant flaws, but I feel it is my "best" among my paintings because of what I was able to do. I enjoyed how I was able to capture the glossiness of this scorpion womans chitin with the fine white lines over the black, as well as the highlights of her crown and sickles. I feel the most impressive thing about it, for my skill as far as painting is concerned, is in her back. Never before did I feel so satisfied in how I represented the back of the female figure as I have with this painting as I was able to represent changes in value and actual shading *big shock* rather than the flat 2D drawings Im far more accustomed to doing. The only annoying bit is that I havent been able to reproduce the same quality in my further paintings, mostly out of a lack of diligence and patience rather than the know-how.',
'Approved', 1456, 443, 1323
),


('Thats what she said', '2018-03-20 23:59:59', '2018-03-20 23:59:59', 'https://res.cloudinary.com/jollystudios/image/upload/v1537828426/qe07v1lg02gisuw7rspq.jpg', '2', '2', 
'An unforgettable story about true love, real life, and second chances. Rachel Blum and Andy Landis are just eight years old when they meet one night in an ER',
'Most juice cleanses consist of replacing your solid food intake with six fruit and/or veggie juices per day. However, Jus by Julie gives you three naturally sweet juices to enjoy for breakfast, a mid-morning snack and dessert, plus three soups (they varied every day which I loved) to eat as lunch, afternoon snack and dinner. All the soups and juices are gluten-free, dairy-free, 100 percent vegan and kosher. One of the biggest differences between Jus by Julies cleanse and any other cleanse I have tried is that their products are all blended rather than cold press. Their justification is that youre getting 100 percent of the whole fruits and vegetables ... [which] means youre consuming powerhouse antioxidants and live enzymes, plus lots of fiber, which plays a major role in absorbing and flushing toxins from your body. But it definitely affects the consistency of the soups and juices. ',
'Approved', 1056, 43, 2023
),


('Charlie and the Chocolate Factory', '2018-03-20 23:59:59', '2018-03-20 23:59:59', 'https://res.cloudinary.com/jollystudios/image/upload/v1538610769/iStock-522735736.jpg', '3', '3', 
'Eating chocolate is often associated with happiness and celebrations, and studies have proved that consuming chocolate can help improve your mood, making you feel calmer and more content!',
'We crave chocolate because it is good! It tastes good. It smells good. It feels good when it melts on our tongue. And all of those ‘feelings’ are the result of our brain releasing chemicals in response to each chocolate experience. The experience of eating chocolate results in feel good neurotransmitters (mainly dopamine) being released in particular brain regions (frontal lobe, hippocampus and hypothalamus—definitions a bit later).
Dopamine is released when you experience anything that you enjoy—sex, laughing, or watching your favorite Olympian claim the gold. This reward circuit is partially hard-wired by genetics, but it learns, changes and responds to your specific preferences based on your life experiences. This malleability of the brain is what makes each of us unique. In fact, there are supposedly people in the world who do not like chocolate.
By simply using one neurotransmitter system to associate rewards with actions, an efficient and powerful brain network evolved so that a positive outcome would be repeated. The dopamine signal sent through the reward circuit brings about positive feelings and assessments of the situation in the frontal lobe (just behind your eyes), creates a memory of the experience including where, who, what and why and links that to the positive experiences via the hippocampus (about an inch inside of each ear), and when food is involved, the hypothalamus (a few inches above the roof of your mouth) gathers information about the caloric and nutrient content for future hunger and satiety signals.',
'Approved', 106, 403, 1023
),

('Tight skin and dried fruits', '2018-03-20 23:59:59', '2018-03-20 23:59:59', 'https://res.cloudinary.com/jollystudios/image/upload/v1538610978/top-view-of-variety-of-dried-fruits-royalty-free-image-151531351-1533134365.jpg.jpg', '3', '3', 
'Dried fruit is fruit from which the majority of the original water content has been removed either naturally, through sun drying, or through the use of specialized dryers or dehydrators.',
'Dried Fruit is Loaded With Micronutrients, Fiber and Antioxidants
Dried fruit is highly nutritious. One piece of dried fruit contains about the same amount of nutrients as the fresh fruit, but condensed in a much smaller package.
By weight, dried fruit contains up to 3.5 times the fiber, vitamins and minerals of fresh fruit.
Therefore, one serving can provide a large percentage of the daily recommended intake of many vitamins and minerals, such as folate (1).
However, there are some exceptions. For example, the vitamin C content is significantly reduced when the fruit is dried (2).
Dried fruit generally contains a lot of fiber and is a great source of antioxidants, especially polyphenols (3).
Polyphenol antioxidants are associated with health benefits such as improved blood flow, better digestive health, decreased oxidative damage and reduced risk of many diseases ',
'Approved', 343, 223, 22242
),

('Very beautiful women', '2018-03-20 23:59:59', '2018-03-20 23:59:59', 'https://res.cloudinary.com/jollystudios/image/upload/v1538611114/2974341.jpg', '4', '4', 
'Self/Reflection is a week of stories on the Cut about how we feel, versus how we look. Here, a woman in her late 50s tells Alexa Tsoulis-Reay how her looks affected her life.',
'All citrus trees belong to the single genus Citrus and remain almost entirely interfertile. This includes grapefruits, lemons, limes, oranges, and various other types and hybrids. As the interfertility of oranges and other citrus has produced numerous hybrids and cultivars, and bud mutations have also been selected, citrus taxonomy is fairly controversial, confusing or inconsistent.[10][12] The fruit of any citrus tree is considered a hesperidium, a kind of modified berry; it is covered by a rind originated by a rugged thickening of the ovary wall.[13][14]
Different names have been given to the many varieties of the genus. Orange applies primarily to the sweet orange – Citrus sinensis (L.) Osbeck. The orange tree is an evergreen, flowering tree, with an average height of 9 to 10 m (30 to 33 ft), although some very old specimens can reach 15 m (49 ft).',
'Approved', 116, 23, 223
),

('Healthy food and drinks', '2018-03-20 23:59:59', '2018-03-20 23:59:59', 'https://res.cloudinary.com/jollystudios/image/upload/v1537644344/jzvtum5jqc5wdniz5oyn.jpg', '4', '4', 
'While I did see a small weight drop of two pounds, I do not recommend doing a cleanse for the sole purpose of losing weight, as youll likely be disappointed if that is your only motivation. ',
'Like a car, your brain needs quality fuel to run efficiently. When it comes to your job, working more efficiently can help you earn more, since high achievers are usually first in line for promotions and raises. Nessel says her clients frequently experience increased focus shortly after improving their diets.
How much can eating healthy help? One 2012 study published by Population Health Management found that eating an unhealthy diet puts you at a 66% increased risk of productivity loss. Another study in the Journal of Occupational and Environmental Medicine found that an unhealthy diet represented the highest risk for low productivity out of 19 possible risk factors, including lack of exercise, chronic pain and financial instability.',
'Approved', 256, 134, 423
) ;


INSERT INTO `POSTS_TAGS` (PostID, TagID)
VALUES
('1', '1'),
('1', '2'), 
('6', '5'),
('4', '6'), 
('2', '1'),
('2', '2'),
('2', '3'),
('2', '5'),
('3', '6'),
('3', '4'),
('4', '1'),
('4', '2'),
('5', '3'),
('5', '5'),
('6', '6'),
('6', '4'),
('6', '10'),
('7', '1'),
('7', '2'),
('7', '3'),
('8', '5'),
('8', '6'), 
('1', '11');


INSERT INTO `notifications` (NotificationClass, NotificationDate, NotificationType, Username, ID, NotificationBrief, NotificationStatus)
VALUES 
('create','2018-04-20 12:30:30', 'post', 'asherlife', 1, 'I look at all types of Adventerous View', 'Closed'),
('create','2018-04-20 12:30:30', 'tag', 'asherlife', 1, 'Ice Cream', 'Closed'),
('change','2018-04-20 12:30:30', 'category', 'asherlife', 1, 'Beaches', 'Closed'),
('change','2018-04-20 12:30:30', 'post', 'asherlife', 1, 'I look at all types of Adventerous View', 'Closed'),
('create','2018-04-20 12:30:30', 'category', 'asherlife', 1, 'Beaches', 'Closed'),
('delete','2018-04-20 12:30:30', 'post', 'asherlife', 1, 'I look at all types of Adventerous View', 'Closed'),
('delete','2018-04-20 12:30:30', 'tag', 'asherlife', 1, 'Ice Cream', 'Closed'),
('create','2018-04-20 12:30:30', 'post', 'molife', 1, 'I look at all types of Adventerous View', 'Closed'),
('create','2018-04-20 12:30:30', 'tag', 'molife', 1, 'Ice Cream', 'Closed'),
('change','2018-04-20 12:30:30', 'category', 'molife', 1, 'Beaches', 'Closed'),
('change','2018-04-20 12:30:30', 'post', 'molife', 1, 'I look at all types of Adventerous View', 'Closed'),
('create','2018-04-20 12:30:30', 'category', 'molife', 1, 'Beaches', 'Closed')
;
