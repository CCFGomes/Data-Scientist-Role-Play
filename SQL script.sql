/* Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

This is a 2-part assignment. In the first part, you are asked a series of questions that will help you profile and understand the data just like a data scientist would. 
For this first part of the assignment, you will be assessed both on the correctness of your findings, as well as the code you used to arrive at your answer. You will be graded on how easy your code is to read, so remember to use proper formatting and comments where necessary.
In the second part of the assignment, you are asked to come up with your own inferences and analysis of the data for a particular research question you want to answer. You will be required to prepare the dataset for the analysis you choose to do. As with the first part, you will be graded, in part, on how easy your code is to read, so use proper formatting and comments to illustrate and communicate your intent as required.

For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked, and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your peers can review your work. 
You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) to copy and paste your answers. If you are going to use Word or some other page layout application, just be careful to make sure your answers and code are lined appropriately.
In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.
*/

-- Part 1: Yelp Dataset Profiling and Understanding

/* 1. Profile the data by finding the total number of records for each of the tables below:
	
i. Attribute table =
ii. Business table =
iii. Category table =
iv. Checkin table =
v. elite_years table =
vi. friend table = 
vii. hours table =
viii. photo table = 
ix. review table = 
x. tip table = 
xi. user table =
*/
SELECT 'Attribute' AS Table_Name, COUNT(*) AS Total_Records FROM Attribute UNION
SELECT 'Business', COUNT(*) FROM Business UNION
SELECT 'Category', COUNT(*) FROM Category UNION
SELECT 'Checkin', COUNT(*) FROM Checkin UNION
SELECT 'elite_years', COUNT(*) FROM elite_years UNION
SELECT 'friend', COUNT(*) FROM friend UNION
SELECT 'hours', COUNT(*) FROM hours UNION
SELECT 'photo', COUNT(*) FROM photo UNION
SELECT 'review', COUNT(*) FROM review UNION
SELECT 'tip', COUNT(*) FROM tip UNION
SELECT 'user', COUNT(*) FROM user;

+-------------+---------------+
| Table_Name  | Total_Records |
+-------------+---------------+
| Attribute   |         10000 |
| Business    |         10000 |
| Category    |         10000 |
| Checkin     |         10000 |
| elite_years |         10000 |
| friend      |         10000 |
| hours       |         10000 |
| photo       |         10000 |
| review      |         10000 |
| tip         |         10000 |
| user        |         10000 |
+-------------+---------------+

  
/*
  2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

i. Business = 
ii. Hours =
iii. Category =
iv. Attribute =
v. Review =
vi. Checkin = 
vii. Photo =
viii. Tip = 
ix. User = 
x. Friend = 
xi. Elite_years =

Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	
*/
  
SELECT count(distinct id) FROM business;
SELECT count(distinct business_id) FROM hours;
SELECT count(distinct business_id) FROM category;
SELECT count(distinct business_id) FROM attribute;
SELECT count(distinct id), count(distinct business_id), count(distinct user_id) FROM review;
SELECT count(distinct business_id) FROM checkin;
SELECT count(distinct id), count(distinct business_id) FROM photo;
SELECT count(distinct business_id), count(distinct user_id) FROM tip;
SELECT count(distinct id) FROM user;
SELECT count(distinct user_id) FROM friend;
SELECT count(distinct user_id) FROM elite_years;

/* 
Business = 10000 records for id
Hours = 2052 records for hours, 1562 records for business_id
Category = 712 records for category / 2643 records for business_id
Attribute = 39 records for name / 1115 records for business_id
Review = 10000 records for id
Checkin = 493 records for business_id
Photo = 6493 records for business_id
Tip = 3979 records for business_id
User = 10000 records for id
Friend = 11 records for user_id
Elite_years = 2780 records for user_id
*/


-- 3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

-- Answer: No
	
-- SQL code used to arrive at answer: 
SELECT COUNT(*)
FROM user
WHERE id IS NULL OR  
name IS NULL OR  
review_count IS NULL OR  
yelping_since IS NULL OR  
useful IS NULL OR  
funny IS NULL OR  
cool IS NULL OR  
fans IS NULL OR  
average_stars IS NULL OR  
compliment_hot IS NULL OR  
compliment_more IS NULL OR  
compliment_profile IS NULL OR  
compliment_cute IS NULL OR  
compliment_list IS NULL OR  
compliment_note IS NULL OR  
compliment_plain IS NULL OR  
compliment_cool IS NULL OR  
compliment_funny IS NULL OR  
compliment_writer IS NULL OR  
compliment_photos IS NULL

  
-- 4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

-- i. Table: Review, Column: Stars

SELECT MIN(stars), MAX(stars), AVG(stars)
FROM review;

-- min: 1		max: 5		avg: 3.71

		
--	ii. Table: Business, Column: Stars
SELECT min(stars), max(stars), avg(stars) 
FROM business;
	
-- min: 0 max: 2 avg: 0.0144
		
	
-- iii. Table: Tip, Column: Likes
SELECT min(likes), max(likes), avg(likes) 
FROM tip;
	
-- min: 0 max: 2 avg: 0.0144	
	
-- iv. Table: Checkin, Column: Count
SELECT min(count), max(count), avg(count) 
FROM checkin;
	
-- min: 1 max: 53 avg: 1.9414
		
-- v. Table: User, Column: Review_count
SELECT min(review_count), max(review_count), avg(review_count) 
FROM user

-- min: 0 max: 2000 avg: 24.2995

  
-- 5. List the cities with the most reviews in descending order:

-- SQL code used to arrive at answer:
	
SELECT
    city,
    review_count
FROM business
ORDER BY review_count DESC;

-- Copy and Paste the Result Below:
	
/*
city       | review_count |
+------------+--------------+
| Las Vegas  |         3873 |
| Montréal   |         1757 |
| Gilbert    |         1549 |
| Las Vegas  |         1410 |
| Las Vegas  |         1389 |
| Las Vegas  |         1252 |
| Las Vegas  |         1116 |
| Las Vegas  |         1084 |
| Las Vegas  |          961 |
| Gilbert    |          902 |
| Las Vegas  |          864 |
| Scottsdale |          823 |
| Las Vegas  |          821 |
| Las Vegas  |          786 |
| Henderson  |          785 |
| Toronto    |          778 |
| Las Vegas  |          768 |
| Las Vegas  |          758 |
| Scottsdale |          726 |
| Cleveland  |          723 |
| Las Vegas  |          720 |
| Charlotte  |          715 |
| Phoenix    |          711 |
| Las Vegas  |          706 |
| Phoenix    |          700 |
+------------+--------------+
(Output limit exceeded, 25 of 10000 total rows shown)
*/


-- 6. Find the distribution of star ratings to the business in the following cities:

-- i. Avon

-- SQL code used to arrive at answer:

SELECT
    stars AS star_rating,
    COUNT(*) AS count
FROM
    business
WHERE
    city = 'Avon'
GROUP BY
    stars
ORDER BY
    stars;

/*
Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):
+-------------+-------+
| star_rating | count |
+-------------+-------+
|         1.5 |     1 |
|         2.5 |     2 |
|         3.5 |     3 |
|         4.0 |     2 |
|         4.5 |     1 |
|         5.0 |     1 |
+-------------+-------+
*/

-- ii. Beachwood

-- SQL code used to arrive at answer:

SELECT
    stars AS star_rating,
    COUNT(*) AS count
FROM
    business
WHERE
    city = 'Beachwood'
GROUP BY
    stars
ORDER BY
    stars;

/*
Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):
+-------------+-------+
| star_rating | count |
+-------------+-------+
|         2.0 |     1 |
|         2.5 |     1 |
|         3.0 |     2 |
|         3.5 |     2 |
|         4.0 |     1 |
|         4.5 |     2 |
|         5.0 |     5 |
+-------------+-------+		
*/

-- 7. Find the top 3 users based on their total number of reviews:
		
-- SQL code used to arrive at answer:

SELECT id, name, review_count
FROM user
ORDER BY review_count DESC
LIMIT 3;	
		
/*
Copy and Paste the Result Below:
		
+------------------------+--------+--------------+
| id                     | name   | review_count |
+------------------------+--------+--------------+
| -G7Zkl1wIWBBmD0KRy_sCw | Gerald |         2000 |
| -3s52C4zL_DHRK0ULG6qtg | Sara   |         1629 |
| -8lbUNlXVSoXqaRRiHiSNg | Yuri   |         1339 |
+------------------------+--------+--------------+
*/


-- 8. Does posing more reviews correlate with more fans?

-- Please explain your findings and interpretation of the results:

SELECT id, name, review_count, fans
FROM user
ORDER BY review_count DESC
LIMIT 10

/*
+------------------------+-----------+--------------+------+
| id                     | name      | review_count | fans |
+------------------------+-----------+--------------+------+
| -G7Zkl1wIWBBmD0KRy_sCw | Gerald    |         2000 |  253 |
| -3s52C4zL_DHRK0ULG6qtg | Sara      |         1629 |   50 |
| -8lbUNlXVSoXqaRRiHiSNg | Yuri      |         1339 |   76 |
| -K2Tcgh2EKX6e6HqqIrBIQ | .Hon      |         1246 |  101 |
| -FZBTkAZEXoP7CYvRV2ZwQ | William   |         1215 |  126 |
| --2vR0DIsmQ6WfcSzKWigw | Harald    |         1153 |  311 |
| -gokwePdbXjfS0iF7NsUGA | eric      |         1116 |   16 |
| -DFCC64NXgqrxlO8aLU5rg | Roanna    |         1039 |  104 |
| -8EnCioUmDygAbsYZmTeRQ | Mimi      |          968 |  497 |
| -0IiMAZI2SsQ7VmyzJjokQ | Christine |          930 |  173 |

*/

SELECT id, name, review_count, fans
FROM user
ORDER BY fans DESC
LIMIT 10;

/*
| id                     | name      | review_count | fans |
+------------------------+-----------+--------------+------+
| -9I98YbNQnLdAmcYfb324Q | Amy       |          609 |  503 |
| -8EnCioUmDygAbsYZmTeRQ | Mimi      |          968 |  497 |
| --2vR0DIsmQ6WfcSzKWigw | Harald    |         1153 |  311 |
| -G7Zkl1wIWBBmD0KRy_sCw | Gerald    |         2000 |  253 |
| -0IiMAZI2SsQ7VmyzJjokQ | Christine |          930 |  173 |
| -g3XIcCb2b-BD0QBCcq2Sw | Lisa      |          813 |  159 |
| -9bbDysuiWeo2VShFJJtcw | Cat       |          377 |  133 |
| -FZBTkAZEXoP7CYvRV2ZwQ | William   |         1215 |  126 |
| -9da1xk7zgnnfO1uTVYGkA | Fran      |          862 |  124 |
| -lh59ko3dxChBSZ9U7LfUw | Lissa     |          834 |  120 |
*/	


-- No, posing more reviews does not correlate with more fans.
-- As we can see above, the top 10 users ranked by review_count does not match the same position when the useras are listed ranked by number of fans.


-- 9. Are there more reviews with the word "love" or with the word "hate" in them?

-- Answer: There are more reviews with the word love (1780) than with the word hate (232).

-- SQL code used to arrive at answer:

SELECT COUNT(*) text
FROM review
WHERE text LIKE '%love%';

/*
+------+
| text |
+------+
| 1780 |
+------+
*/

SELECT COUNT(*) text
FROM review
WHERE text LIKE '%hate%'

/*
+------+
| text |
+------+
|  232 |
+------+
*/


-- 10. Find the top 10 users with the most fans:

-- SQL code used to arrive at answer:

SELECT id, name, fans
FROM user
ORDER BY fans DESC
LIMIT 10;

/*
Copy and Paste the Result Below:

+------------------------+-----------+------+
| id                     | name      | fans |
+------------------------+-----------+------+
| -9I98YbNQnLdAmcYfb324Q | Amy       |  503 |
| -8EnCioUmDygAbsYZmTeRQ | Mimi      |  497 |
| --2vR0DIsmQ6WfcSzKWigw | Harald    |  311 |
| -G7Zkl1wIWBBmD0KRy_sCw | Gerald    |  253 |
| -0IiMAZI2SsQ7VmyzJjokQ | Christine |  173 |
| -g3XIcCb2b-BD0QBCcq2Sw | Lisa      |  159 |
| -9bbDysuiWeo2VShFJJtcw | Cat       |  133 |
| -FZBTkAZEXoP7CYvRV2ZwQ | William   |  126 |
| -9da1xk7zgnnfO1uTVYGkA | Fran      |  124 |
| -lh59ko3dxChBSZ9U7LfUw | Lissa     |  120 |
+------------------------+-----------+------+
*/		

-- Part 2: Inferences and Analysis

-- 1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.

-- categories: Restaurants
-- city: Las Vegas

-- i. Do the two groups you chose to analyze have a different distribution of hours?

/*
Group with 2-3 Stars: Wingstop is the only business in this group. It is open on Saturday from 11:00 to 0:00 (midnight).
Group with 4-5 Stars: Big Wong Restaurant and Jacques Cafe are in this group. Big Wong Restaurant is open on Saturday from 10:00 to 23:00, while Jacques Cafe operates from 11:00 to 20:00 on Saturdays.
It's clear that there is indeed a difference in the distribution of hours between the two groups. The businesses with 4-5 stars have slightly shorter operating hours compared to the business with 2-3 stars.
*/

-- ii. Do the two groups you chose to analyze have a different number of reviews?

-- Yes, the two groups have different numbers of reviews:

/*
Group with 2-3 Stars: Wingstop, with a star rating of 3.0, has 123 reviews.
Group with 4-5 Stars: Big Wong Restaurant and Jacques Cafe, both with star ratings of 4.0, have 768 and 168 reviews, respectively.
The businesses with 4-5 stars generally have higher review counts compared to the business with 2-3 stars, indicating that they have received more feedback from customers
*/
         
-- iii. Are you able to infer anything from the location data provided between these two groups? Explain.

-- We can only observe the physical locations of the businesses without making further assumptions about their customer demographics or market positioning.

-- SQL code used for analysis:

SELECT
    business.name, 
    business.city, 
    business.stars,
    category.category, 
    hours.hours,
    business.review_count,
    business.address,
    business.postal_code,
    business.neighborhood
FROM 
    business 
    INNER JOIN category ON business.id = category.business_id
    INNER JOIN hours ON hours.business_id = business.id
WHERE 
    (business.city = 'Las Vegas' AND category.category = 'Restaurants')
    AND (business.stars BETWEEN 2 AND 3 OR business.stars BETWEEN 4 AND 5)
GROUP BY 
    business.name, 
    business.stars,
    business.neighborhood;

/*
+---------------------+-----------+-------+-------------+----------------------+--------------+---------------------------------+-------------+--------------+
| name                | city      | stars | category    | hours                | review_count | address                         | postal_code | neighborhood |
+---------------------+-----------+-------+-------------+----------------------+--------------+---------------------------------+-------------+--------------+
| Big Wong Restaurant | Las Vegas |   4.0 | Restaurants | Saturday|10:00-23:00 |          768 | 5040 Spring Mountain Rd         | 89146       | Chinatown    |
| Jacques Cafe        | Las Vegas |   4.0 | Restaurants | Saturday|11:00-20:00 |          168 | 1910 Village Center Cir, Unit 1 | 89134       | Summerlin    |
| Wingstop            | Las Vegas |   3.0 | Restaurants | Saturday|11:00-0:00  |          123 | 5045 W Tropicana Ave            | 89103       |              |
+---------------------+-----------+-------+-------------+----------------------+--------------+---------------------------------+-------------+--------------+
*/

-- 2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.
		
-- i. Difference 1: Number of Businesses: There are significantly more businesses that are open compared to those that are closed.

-- ii. Difference 2: Average Star Rating: The average star rating for businesses that are closed is higher than for businesses that are open.         
         
-- SQL code used for analysis:

SELECT    
	is_open,    
	COUNT(*) AS business_count,    
	stars,    
	review_count
FROM    business
GROUP BY    is_open;

/*
+---------+----------------+-------+--------------+
| is_open | business_count | stars | review_count |
+---------+----------------+-------+--------------+
|       0 |           1520 |   3.5 |           19 |
|       1 |           8480 |   2.5 |           25 |
+---------+----------------+-------+--------------+
*/


-- 3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.
-- Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
-- i. Indicate the type of analysis you chose to do:
         -- Predictive Analysis: I will calculates the average star rating for each business based on their historical ratings.
         
-- ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:

/*
For predictive analysis of overall star ratings in the Yelp database, the key data required includes business attributes such as review count, location (neighborhood, city, state, postal code, latitude, longitude), and whether the business is open or closed. 
Additionally, historical star ratings for each business are essential for training the predictive model. 
These attributes provide valuable insights into the factors that contribute to a business's overall rating and help in building a predictive model to forecast future ratings.
The choice of these data attributes is based on their relevance to determining a business's star rating. Review count reflects the level of engagement and feedback from customers, while location attributes provide context regarding the business's geographic presence and local market dynamics. Whether a business is open or closed also impacts its overall rating, as operational factors may influence customer satisfaction. By leveraging these data attributes, we can develop a robust predictive model that accurately forecasts a business's overall star rating, empowering stakeholders to make informed decisions and optimize business performance.
*/
  
-- iii. Output of your finished dataset:
/*
+------------------------+----------------------------------------+---------------+--------------------------------------------+------------------+-------+-------------+----------+-----------+--------------+---------+-----------------------+
| business_id            | business_name                          | neighborhood  | address                                    | city             | state | postal_code | latitude | longitude | review_count | is_open | predicted_star_rating |
+------------------------+----------------------------------------+---------------+--------------------------------------------+------------------+-------+-------------+----------+-----------+--------------+---------+-----------------------+
| --6MefnULPED_I942VcFNA | John's Chinese BBQ Restaurant          |               | 328 Highway 7 E, Chalmers Gate 11, Unit 10 | Richmond Hill    | ON    | L4B 3P7     |  43.8409 |  -79.3996 |           30 |       1 |                   3.0 |
| --7zmmkVg-IMGaXbuVd0SQ | Primal Brewery                         |               | 16432 Old Statesville Rd                   | Huntersville     | NC    | 28078       |  35.4371 |  -80.8437 |           42 |       1 |                   4.0 |
| --8LPVSo5i0Oo61X01sV9A | Valley Bone and Joint Specialists      |               | 3941 E Baseline Rd, Ste 102                | Gilbert          | AZ    | 85234       |  33.3795 |  -111.728 |            3 |       1 |                   4.5 |
| --9QQLMTbFzLJ_oT-ON3Xw | Great Clips                            |               | 1835 E Guadalupe Rd, Ste 106               | Tempe            | AZ    | 85283       |  33.3617 |   -111.91 |            9 |       1 |                   3.0 |
| --9e1ONYQuAa-CB_Rrw7Tw | Delmonico Steakhouse                   | The Strip     | 3355 Las Vegas Blvd S                      | Las Vegas        | NV    | 89109       |  36.1232 |  -115.169 |         1389 |       1 |                   4.0 |
| --DaPTJW3-tB1vP-PfdTEg | Sunnyside Grill                        | Corso Italia  | 1218 Saint Clair Avenue W                  | Toronto          | ON    | M6E         |  43.6778 |  -79.4447 |           37 |       1 |                   3.5 |
| --DdmeR16TRb3LsjG0ejrQ | World Food Championships               | The Strip     | 3645 Las Vegas Blvd S                      | Las Vegas        | NV    | 89109       |  36.1143 |  -115.171 |            5 |       1 |                   3.0 |
| --EX4rRznJrltyn-34Jz1w | Bath & Body Works                      |               | 6801 Northlake Mall Dr, Ste 172            | Charlotte        | NC    | 28216       |  35.3521 |  -80.8512 |            3 |       1 |                   4.0 |
| --FBCX-N37CMYDfs790Bnw | The Bar At Bermuda & St. Rose          | Southeast     | 11624 Bermuda Rd                           | Henderson        | NV    | 89052       |  35.9787 |  -115.155 |          100 |       1 |                   4.0 |
| --FLdgM0GNpXVMn74ppCGw | Welch Physical Therapy                 |               | 3011 S Lindsay Rd, Bldg 6, Ste 114         | Gilbert          | AZ    | 85296       |  33.2955 |  -111.773 |            6 |       1 |                   3.5 |
| --GM_ORV2cYS-h38DSaCLw | Mm Mm Pizza                            |               | 407 S Central Ave                          | Canonsburg       | PA    | 15317       |  40.2526 |  -80.1839 |            7 |       1 |                   4.0 |
| --I7YYLada0tSLkORTHb5Q | Happy Moose Bar and Grill              |               | 9436 State Rte 14                          | Streetsboro      | OH    | 44241       |  41.2426 |  -81.3526 |           61 |       1 |                   3.5 |
| --KCl2FvVQpvjzmZSPyviA | Hungry Howie's Pizza                   |               | 6426 W Sugar Creek Rd, Unit A              | Charlotte        | NC    | 28269       |  35.3335 |  -80.7962 |           12 |       1 |                   3.0 |
| --KQsXc-clkO7oHRqGzSzg | Sam's Club                             |               | 15255 N Northsight Blvd                    | Scottsdale       | AZ    | 85260       |  33.6228 |  -111.895 |           26 |       1 |                   3.0 |
| --LY7PrnEegglB7vnPCjQw | International Newsagents               | Old Town      | 351 High Street, New Town                  | Edinburgh        | EDH   | EH1 1PW     |  55.9498 |  -3.19119 |           10 |       1 |                   4.0 |
| --Ni3oJ4VOqfOEu7Sj2Vzg | KFC                                    |               | 1245 Pearl Road                            | Brunswick        | OH    | 44212       |  41.2419 |  -81.8411 |            6 |       1 |                   2.0 |
| --R3uiY2dB43MpdwtG6jhQ | Don Valley North Toyota Scion, Service |               | 3300 Steeles Avenue E                      | Markham          | ON    | L3R 1G9     |  43.8159 |  -79.3421 |           10 |       1 |                   3.5 |
| --Rsj71PBe31h5YljVseKA | Circle K                               |               | 1850 W Happy Valley Rd                     | Phoenix          | AZ    | 85085       |  33.7135 |  -112.099 |            6 |       1 |                   4.0 |
| --S62v0QgkqQaVUhFnNHrw | Denny's                                |               | 6207 Wilson Mills Rd                       | Highland Heights | OH    | 44143       |  41.5394 |  -81.4551 |           22 |       1 |                   2.0 |
| --SrzpvFLwP_YFwB_Cetow | Keung Kee Restaurant                   | Scarborough   | 3300 Midland Avenue, Unit 41               | Toronto          | ON    | M1V 0C7     |  43.8068 |  -79.2889 |           38 |       1 |                   3.5 |
| --TcDRzRIxhvHM4DSgEuMA | The Greens                             |               | 2241 N Green Valley Pkwy                   | Henderson        | NV    | 89014       |  36.0548 |  -115.084 |            4 |       1 |                   2.0 |
| --U98MNlDym2cLn36BBPgQ | Pronto Pizza                           |               | 7870 Idlewild Rd                           | Indian Trail     | NC    | 28079       |   35.107 |  -80.6326 |            4 |       1 |                   3.0 |
| --W4kqPWwXFycuqejFANmw | SAE Institute                          |               | Stuttgarter Str. 23                        | Stuttgart        | BW    | 70469       |  48.8106 |   9.16523 |            3 |       1 |                   4.5 |
| --WsruI0IGEoeRmkErU5Gg | Dial Carpet Cleaning                   | Westside      | 3111 S Valley Vw, #H-104                   | Las Vegas        | NV    | 89102       |  36.1309 |  -115.191 |           13 |       1 |                   5.0 |
| --Y7NhBKzLTbNliMUX_wfg | Pinnacle Restoration                   | Spring Valley | 10075 Mystic Lake Ave                      | Las Vegas        | NV    | 89148       |  36.0704 |  -115.313 |            7 |       1 |                   5.0 |
+------------------------+----------------------------------------+---------------+--------------------------------------------+------------------+-------+-------------+----------+-----------+--------------+---------+-----------------------+
(Output limit exceeded, 25 of 10000 total rows shown)
*/

-- iv. Provide the SQL code you used to create your final dataset:

-- Predicting Overall Star Rating for Businesses
SELECT
    id AS business_id,
    name AS business_name,
    neighborhood,
    address,
    city,
    state,
    postal_code,
    latitude,
    longitude,
    review_count,
    is_open,
    AVG(stars) AS predicted_star_rating
FROM
    business
GROUP BY
    id, name, neighborhood, address, city, state, postal_code, latitude, longitude, review_count, is_open;
