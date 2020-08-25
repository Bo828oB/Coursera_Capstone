Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

This is a 2-part assignment. In the first part, you are asked a series of questions that will help you profile and understand the data just like a data scientist would. For this first part of the assignment, you will be assessed both on the correctness of your findings, as well as the code you used to arrive at your answer. You will be graded on how easy your code is to read, so remember to use proper formatting and comments where necessary.

In the second part of the assignment, you are asked to come up with your own inferences and analysis of the data for a particular research question you want to answer. You will be required to prepare the dataset for the analysis you choose to do. As with the first part, you will be graded, in part, on how easy your code is to read, so use proper formatting and comments to illustrate and communicate your intent as required.

For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked, and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your peers can review your work. You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) to copy and paste your answers. If you are going to use Word or some other page layout application, just be careful to make sure your answers and code are lined appropriately.
In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.



Part 1: Yelp Dataset Profiling and Understanding

1. Profile the data by finding the total number of records for each of the tables below:
	
i. Attribute table = 10000
ii. Business table = 10000
iii. Category table = 10000
iv. Checkin table = 10000
v. elite_years table =10000
vi. friend table = 10000
vii. hours table = 10000
viii. photo table = 10000
ix. review table = 10000
x. tip table = 10000
xi. user table =10000
	


2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

i. Business = 10000 
ii. Hours = 10000
iii. Category = 10000
iv. Attribute = 10000
v. Review = 8090 (FK business_id)
vi. Checkin = 10000
vii. Photo = 6493(FK business_id)
viii. Tip = 3979(FK business_id)
ix. User = 10000 (PK)
x. Friend = 11
xi. Elite_years = 2780

Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	



3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer:No
	
	
	SQL code used to arrive at answer:


SELECT count(id) AS NULL_indicator
FROM user
WHERE 
(id ISNULL
OR name ISNULL
OR review_count ISNULL
OR yelping_since ISNULL
OR useful ISNULL
OR funny ISNULL
OR cool ISNULL
OR fans ISNULL
OR average_stars ISNULL
OR compliment_hot ISNULL
OR compliment_more ISNULL
OR compliment_profile ISNULL
OR compliment_cute ISNULL
OR compliment_list ISNULL
OR compliment_note ISNULL
OR compliment_plain ISNULL
OR compliment_cool ISNULL
OR compliment_funny ISNULL
OR compliment_writer ISNULL
OR compliment_photos ISNULL)
	
	

	
4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

	i. Table: Review, Column: Stars
	
		min:1		max:5		avg:3.7082
		
	
	ii. Table: Business, Column: Stars
	
		min:1.0		max:5.0		avg:3.6549
		
	
	iii. Table: Tip, Column: Likes
	
		min:0		max:2		avg:0.0144
		
	
	iv. Table: Checkin, Column: Count
	
		min:1		max:53		avg:1.9414
		
	
	v. Table: User, Column: Review_count
	
		min:	0	max:2000		avg:24.2995
		


5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer:

    SELECT city,SUM(review_count) AS num_review
    FROM business
    GROUP BY city
    ORDER BY num_review DESC
	
	
	Copy and Paste the Result Below: 
+-----------------+------------+
| city            | num_review |
+-----------------+------------+
| Las Vegas       |      82854 |
| Phoenix         |      34503 |
| Toronto         |      24113 |
| Scottsdale      |      20614 |
| Charlotte       |      12523 |
| Henderson       |      10871 |
| Tempe           |      10504 |
| Pittsburgh      |       9798 |
| Montréal        |       9448 |
| Chandler        |       8112 |
| Mesa            |       6875 |
| Gilbert         |       6380 |
| Cleveland       |       5593 |
| Madison         |       5265 |
| Glendale        |       4406 |
| Mississauga     |       3814 |
| Edinburgh       |       2792 |
| Peoria          |       2624 |
| North Las Vegas |       2438 |
| Markham         |       2352 |
| Champaign       |       2029 |
| Stuttgart       |       1849 |
| Surprise        |       1520 |
| Lakewood        |       1465 |
| Goodyear        |       1155 |
+-----------------+------------+
	

	
6. Find the distribution of star ratings to the business in the following cities:

i. Avon

SQL code used to arrive at answer:

SELECT stars as star_rating, count(stars) AS Count
FROM business
WHERE city='Avon'
GROUP BY stars
ORDER BY stars




Copy and Paste the Resulting Table Below (2 columns 鈥� star rating and count):

+-------------+-------+
| star_rating | Count |
+-------------+-------+
|         1.5 |     1 |
|         2.5 |     2 |
|         3.5 |     3 |
|         4.0 |     2 |
|         4.5 |     1 |
|         5.0 |     1 |
+-------------+-------+


ii. Beachwood

SQL code used to arrive at answer:

SELECT stars as star_rating, count(stars) AS Count
FROM business
WHERE city=Beachwood'
GROUP BY stars
ORDER BY stars


Copy and Paste the Resulting Table Below (2 columns 鈥� star rating and count):

+-------------+-------+
| star_rating | Count |
+-------------+-------+
|         2.0 |     1 |
|         2.5 |     1 |
|         3.0 |     2 |
|         3.5 |     2 |
|         4.0 |     1 |
|         4.5 |     2 |
|         5.0 |     5 |
+-------------+-------+
		


7. Find the top 3 users based on their total number of reviews:
		
	SQL code used to arrive at answer:

SELECT id, name, SUM(review_count) as NumCount
FROM user
GROUP BY id
ORDER BY NumCount DESC
LIMIT 3
	
		
	Copy and Paste the Result Below:

+------------------------+--------+----------+
| id                     | name   | NumCount |
+------------------------+--------+----------+
| -G7Zkl1wIWBBmD0KRy_sCw | Gerald |     2000 |
| -3s52C4zL_DHRK0ULG6qtg | Sara   |     1629 |
| -8lbUNlXVSoXqaRRiHiSNg | Yuri   |     1339 |
+------------------------+--------+----------+
		


8. Does posing more reviews correlate with more fans?
     No

	Please explain your findings and interpretation of the results:
    No significant correlation between reviews and fans. 
    Because as the number of reviews reduces, the number of fans does't decrease.
    For instance, fans of William, Harald >fans of Sara 


+-----------+-----------+--------+
| name      | NumReview | NumFan |
+-----------+-----------+--------+
| Gerald    |      2000 |    253 |
| Sara      |      1629 |     50 |
| Yuri      |      1339 |     76 |
| .Hon      |      1246 |    101 |
| William   |      1215 |    126 |
| Harald    |      1153 |    311 |
| eric      |      1116 |     16 |
| Roanna    |      1039 |    104 |
| Mimi      |       968 |    497 |
| Christine |       930 |    173 |
| Ed        |       904 |     38 |
| Nicole    |       864 |     43 |
| Fran      |       862 |    124 |
| Mark      |       861 |    115 |
| Christina |       842 |     85 |
| Dominic   |       836 |     37 |
| Lissa     |       834 |    120 |
| Lisa      |       813 |    159 |
| Alison    |       775 |     61 |
| Sui       |       754 |     78 |
| Tim       |       702 |     35 |
| L         |       696 |     10 |
| Angela    |       694 |    101 |
| Crissy    |       676 |     25 |
| Lyn       |       675 |     45 |
+-----------+-----------+--------+
	

	
9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer:LoveText

+----------+----------+
| LoveText | HateText |
+----------+----------+
|     1780 |      232 |
+----------+----------+

	
	SQL code used to arrive at answer:
SELECT (SELECT count(text)
FROM review
WHERE text LIKE '%love%') as LoveText,
(SELECT count(text)
FROM review
WHERE text LIKE '%hate%') as HateText

	
	
10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:

SELECT name,fans
FROM user
ORDER BY fans DESC
LIMIT 10;
	
	
	Copy and Paste the Result Below:


+-----------+------+
| name      | fans |
+-----------+------+
| Amy       |  503 |
| Mimi      |  497 |
| Harald    |  311 |
| Gerald    |  253 |
| Christine |  173 |
| Lisa      |  159 |
| Cat       |  133 |
| William   |  126 |
| Fran      |  124 |
| Lissa     |  120 |
+-----------+------+
	
		

Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.
	
i. Do the two groups you chose to analyze have a different distribution of hours? YES 
 Choose Las Vegas and Shopping

ii. Do the two groups you chose to analyze have a different number of reviews? YES
         
         
iii. Are you able to infer anything from the location data provided between these two groups? Explain.
From the results, the E Tropicana Ave occurs twice. (I don't know much about the Las Vegas city). But I would like to guess this is 
the one of the busy streets, it's better to open a shop here.

SQL code used for analysis:

(i)
SELECT h.hours,b.stars
FROM business b INNER JOIN hours h on b.id = h.business_id
WHERE b.city = 'Las Vegas' and (b.stars between 2 and 3) 
UNION 
SELECT h.hours,b.stars
FROM business b INNER JOIN hours h on b.id = h.business_id

WHERE b.city = 'Las Vegas' and (b.stars between 4 and 5)
GROUP BY b.stars
ORDER BY b.stars

(ii)
SELECT sum(review_count),c.category as comparison
FROM business b INNER JOIN category c on b.id = c.business_id
WHERE c.category =='Shopping' 
UNION
SELECT sum(review_count),city
FROM business 
WHERE city =='Las Vegas' 

(iii)
SELECT *
FROM business b INNER JOIN category c on b.id = c.business_id
WHERE c.category =='Shopping' and b.city == 'Las Vegas'




		
2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.
		
i. Difference 1: The number of open and closed business is different. Open business have more >=3 stars but closed business has less.
         
         
ii. Difference 2: The Checkin number of open business is much higher than closed one's
         
         
         
SQL code used for analysis:
(i)
SELECT count(id),is_open,stars
FROM business
GROUP BY is_open, stars

(ii)
SELECT SUM(c.count),b.is_open
FROM business b INNER JOIN checkin c on b.id = c.business_id
GROUP BY b.is_open
	
	
3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
i. Indicate the type of analysis you chose to do:
   Numeric data of user

         
ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:
     I want to know effect of the useful funny .. on the avarage stars
     because avarage stars, useful , funny , cool ,fans, review_count are all numeric data,
     the method to solve this problem can be linear regression( this is easy to get p value)  or Neural network.                    
                  
iii. Output of your finished dataset:
    +---------------+--------+--------+--------+------+--------------+
| average_stars | useful |  funny |   cool | fans | review_count |
+---------------+--------+--------+--------+------+--------------+
|          3.97 |     67 |     22 |      9 |   15 |          245 |
|           5.0 |      0 |      0 |      0 |    0 |            2 |
|           4.0 |      1 |      0 |      0 |    0 |            2 |
|          3.79 |     34 |     14 |      0 |    0 |           57 |
|          2.78 |      2 |      3 |      1 |    0 |            8 |
|          3.84 |      1 |      0 |      0 |    1 |           43 |
|           4.5 |      0 |      0 |      0 |    0 |            2 |
|          4.11 |      0 |      0 |      0 |    0 |            7 |
|          3.48 |     10 |      2 |      0 |    2 |           26 |
|           5.0 |      0 |      0 |      0 |    0 |            1 |
|          2.33 |      0 |      0 |      2 |    0 |            3 |
|          4.33 |      0 |      0 |      0 |    0 |            9 |
|           5.0 |      0 |      0 |      0 |    0 |            5 |
|           5.0 |     15 |     13 |      9 |    0 |            2 |
|           4.6 |      7 |      1 |      0 |    0 |           28 |
|          4.17 |      0 |      0 |      0 |    0 |           23 |
|           4.4 | 122921 | 122419 | 122890 |  311 |         1153 |
|          4.25 |      0 |      0 |      0 |    0 |            4 |
|          3.93 |     63 |      6 |      2 |   10 |          213 |
|          3.43 |     97 |     57 |     32 |    2 |          111 |
|           4.0 |      1 |      0 |      0 |    0 |            2 |
|          3.86 |     64 |     15 |      3 |   23 |          239 |
|           5.0 |      0 |      0 |      0 |    0 |            2 |
|          3.42 |    405 |    313 |     72 |   23 |          400 |
|          2.46 |     12 |      5 |      1 |    0 |           25 |
+---------------+--------+--------+--------+------+--------------+    
         
iv. Provide the SQL code you used to create your final dataset:
train dataset 
SELECT average_stars,useful,funny, cool,fans,review_count
FROM user 
LIMIT 8000

test 
SELECT average_stars,useful,funny, cool,fans,review_count
FROM user 
LIMIT 2000