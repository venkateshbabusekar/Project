

```python

```

# Final Project 

# DIGITAL MUSIC & ARTIST ANALYSIS 


```python

```

Data for analysing the digital music (ablums) has been collected from the source like **_TWITTER_** , **_SPOTFIY_** and **_AMAZON_** using **API** and **websites**.
    1. Artists and album related details from SPOTFIY
    2. Reviews related to album from AMAZON
    3. Tweets realated to Artist from TWITTER

### Data Formats
    1. Amazon - http://jmcauley.ucsd.edu/data/amazon/  - Zip File contains album cost,ratings and reviews
    2. SPOTIFY - https://api.spotify.com/v1/search?query - API Request 
    3. TWITTER - https://api.twitter.com/1.1/search/tweets.json - API Request

## Data processing and cleaning 

### AMAZON DATA

####     Steps to obtain the data:
        - Hit the above metioned Url
        - Download the metadata and reviews related to digital music form the link
        - Data **_meta_Digital_Music.json.gz_** and **_reviews_Digital_Music.json.gz_** will downloaded 

####     Steps to Process the data:
        - Run a python code to load the .json.gz file 
        - Meta_Digital_Music.json.gz
            - File contains album ID, price , descrition of the product (Album)
            - Once the data is loaded, convert it to a data frame 
            - Get only the necessary colums and write it to csv and save the csv  
        
        - Reviews_Digital_Music.json.gz
            - File contains the reviews, overall rating of the product (Album) 
            - Once the data is loaded, convert it to a data frame 
            - Get only the necessary colums and write it to csv and save the csv

### SPOTIFY DATA
        
####     Steps to obtain the data: (part 1)
        
        - Run a python code that will hit the API 
        - For each hit we get a respond in the form of json
        - Process it and save the Json file 
####     Steps to Process the data: (part 2)
        - Run a python code to Loop thru all the json file  
        - Traverse thru the json file 
        - Get the necessary information only 
        - write the data in to csv and save the csv
####     Amazon and Spotify data linkage :
        - Album name obtained from amazon is used as a input for spotify search 
        - General Search :
            - We pass the Album name from amazon to stopity general search API
            - Repeat part 1 and part 2
            - we will get a get search detils and Album Id for the general search
        - Album Id Search:
            - We pass the Album ID obtained from general search to stopity Album search API 
            - Repeat part 1 and part 2
            - we will get a get Album deatils and artist ids from  Album search API
        - Artist Id Search:
            - We pass the Artist ID obtained from Album search to stopity Artist search API 
            - Repeat part 1 and part 2
            - we will get a artist details  from  Artist search API
            
            
        
### TWITTER DATA
        
####     Steps to obtain the data: (part 1)
        
        - Run a python code that will hit the API 
        - For each hit we get a respond in the form of json
        - Process it and save the Json file 
####     Steps to Process the data: (part 2)
        - Run a python code to Loop thru all the json file  
        - Traverse thru the json file 
        - Get the necessary information only 
        - write the data in to csv and save the csv
####     Spotify and Twitter data linkage :
        - Artist name obtained from Spotify is used as a input for Twitter search 
        - General Search :
            - We pass the Album name from Spotify to  Twitter general search API
            - Repeat part 1 and part 2
            
           
        






# Analysis 

## Analysis 1 

### **we will analyse the spotify and amazon dataset to get a overview of the data**

#### **Data Need**
        Load the product details, Ablum details, Artist details file which are obtained from amazon and spotify

- ## Finding - 1

We are trying the find wether the artist gener really plays a import role in the popularity ?

        - We are finding the Top 10 artist based on the follower
        - We are finding the Top 10 artist based on the Popularity
        - We are finding the gener of the artist who fall on the top based on the follower and popularity
        - We are finding the 10 gener of all time  


- ## Finding - 2

We are trying to get a find out the trends in reivew over the period of time   

        - We are finding the Top 10 reivew company based on the number of review they have writen
        - We are finding the variation in the review over the period of time 
        

- ## Finding - 3

We are trying to get a overall idea about who are the top production compay for music and the oversll market avaliablity of the albums  


        - We are finding the Top 10 production company based on the number of ablums they have produced
        - We are finding the Top 10 country for which the  market avalibality is high
        
        
        
        
# Processing Steps 
   
   #### Analysis _ 1  -->  Finding 1 
         
         - First we load the artist data
         - Sort the artist data by based on the follower
         - Get the top 10 artist with most no of followers
         - Sort the artist data by based on the Popularity
         - Get the top 10 artist with most no of Popularity
         - Now meger both the top 10 artist to find the artist who has both the Popularity and follower higest
         - Then for those artist find the top most frequent gener(note: artist may have many different and repeating geners )
         - Now Find the top 10 gener for the  entire album dataset
         
        
        
   #### Analysis _ 1  -->  Finding 2 
         
         - First we load the review data
         - find how man reviews has been written by each reviewer
         - Get the top 10 reviewer with most no of reviews
         - Find the average number of reviews for each year
         - Now plot the graph to see the trend of review over the period of time 
        
        
   #### Analysis _ 1  -->  Finding 3 
         
         - First we load the Album data
         - find how many Album has been produced by each production company
         - Get the top 10 production company with most no of Album
         - Create a list which entire market avaliablity of each ablum 
         - Loop thru list and find the frequency of each country 
         - Find the top 10 country with most no of avaliablity
         - Now link this table to iso_contry code table to get the country name        
        
        
        

# OUT PUT: 
### Analysis 1--> Finding - 1


### Top Artist based on followers

![1_a_p](https://cloud.githubusercontent.com/assets/25119470/25310384/39abbc7e-27b1-11e7-92f2-e662d4372b3a.JPG)


### Top Artist based on popularity

![2_a_f](https://cloud.githubusercontent.com/assets/25119470/25310388/431e8c14-27b1-11e7-82c8-b5f219527fb5.JPG)


### Graph for top artist 



### Graph 

![top_10_f_p](https://cloud.githubusercontent.com/assets/25119470/25310307/9a1ca7be-27af-11e7-89e6-9622d9a0f7f8.JPG)


### Artist who have top followers  and populatity

![3_a_con](https://cloud.githubusercontent.com/assets/25119470/25310391/4e9f86ec-27b1-11e7-9e61-dfce31faad5f.JPG)


# Graph for artist gener and the popularity 

![2_a1_f1](https://cloud.githubusercontent.com/assets/25119470/25310418/a24be0e2-27b1-11e7-81d8-daba4bf60c1d.JPG)


### Conclusion 

- ## For Finding - 1

From the above graph its very clear that geners specifiy to artist doesnt really plays a import role in their popularity . There is no relation between the artist popularity and their geners


# OUT PUT: 
### Analysis 1--> Finding - 2


# Grapg for top reviwers and treand of reviews

![3_a1_f2_reviewtrends](https://cloud.githubusercontent.com/assets/25119470/25310445/55209104-27b2-11e7-8e14-83594ac00f8b.JPG)


### Conclusion 


- ## For  Finding - 2

-From the above graph we can infere that Over the period of time the count of people give review has been reduced        
-From the above graph we can seen that "Michael and mistermax gave most no of reviews nearly 1000 reviews "



# OUT PUT: 
### Analysis 1--> Finding - 3


# Graph  fo top production company and market avalibality 

![4_a1_f3_distribution](https://cloud.githubusercontent.com/assets/25119470/25310448/621a1664-27b2-11e7-86c6-7beae35462fc.JPG)


### Conclusion 

- ## For  Finding - 3

-From the above graph we can infere that most no of album are sold in the us.So if artist lauch a new ablum he shuld consider us  
-From the above graph we can seen that "Universal and columbia gave most no of albums. So if artist lauch a new ablum he can approch these company for the production


## Analysis 2 

### **we will analyse the product reviews from amazon dataset and try to implement sentimental analysis on those reviews and dig deeper into the reviews and rating**

#### **Data Need**
        Load the product details, review details,  file which are obtained from amazon 

- ## Finding - 1

We are trying to implement sentimental analysis on the top most review product

        - We are finding the Top 10 product based on the no of review 
        - We are doing sentiment analysis on the review
        - We are calculating the sentimental score 
        - we are analysing the rating and the helpfulness of each review based on the review sentimental score 


- ## Finding - 2

We are extending our analysis furter to find the relationship between postive negative reviews  over the helpfulness of each
product review through out the year 

        - We are finding the review with postitive  and negative sentiment
        - Finding the helpfulness for the product reviews  
        

- ## Finding - 3

We are extending our analysis furter to find the relationship between overall rating and the sentimental score 


        
        
        
# Processing Steps 
   
   #### Analysis _ 2  -->  Finding 1 
         
         - First we load the product data
         - Get the top 6 product with most no of reviews
         - Take all the review of that 6 product and do sentimental analysis
         - Assing the score 1 if the review is positive 
         - Assing the score 0 if the review is negative  
         - For the negative reviews we are find the helpfulness of each product 
         - For the Positive reviews we are find the helpfulness of each product 
         
        
        
   #### Analysis _ 2  -->  Finding 2 
         
         - We are getting the data which contain only postive sentiment 
         - We are getting the data which contain only negative sentiment 
         - For product with postive sentiment we are calculating how  helpful of the reviews is 
         - For product with postive sentiment we are calculating how the reviews is not  helpful  
         - For product with negative sentiment we are calculating how  helpful of the reviews is 
         - For product with negative sentiment we are calculating how   the reviews is not  helpful 
         - Now plot all the graph to see the trend over the period of time 
        
        
   #### Analysis _ 2  -->  Finding 3 
         
         - We are getting the data which contain only postive sentiment 
         - We are getting the data which contain only negative sentiment 
         - Now we are calculating the mean of overall rating for postive sentiment 
         - Now we are calculating the mean of overall rating for negative sentiment 
         - Now plot all the graph to see the trend over the period of time 
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        

# OUT PUT: 
## For Analysis 2--> Finding - 1



![5_a2_f1-1](https://cloud.githubusercontent.com/assets/25119470/25310463/c4b89110-27b2-11e7-890f-4dcc74e5db8a.JPG)


![6_a2_f1-2](https://cloud.githubusercontent.com/assets/25119470/25310465/d1619aec-27b2-11e7-8e50-7f7b1a6ec276.JPG)


### Conclusion 

- ## For Analysis 2--> Finding - 1

Identified Top 6  product based on the no of review and done the sentimantal analysis.
From the above graph its is very clear that what ever the review may be (positive or negative) peopel always tend to say tht the review is **NOT HELPFUL**


# OUT PUT: 
## For Analysis 2--> Finding - 2



# ##Graph show the trends in the review

![7_a2_f2_1](https://cloud.githubusercontent.com/assets/25119470/25310480/3f2dd432-27b3-11e7-97d9-00b75b1ea13a.JPG)


![8_a2_f2_2](https://cloud.githubusercontent.com/assets/25119470/25310481/473f26c6-27b3-11e7-841e-2fcca0847534.JPG)


### Conclusion 

- ## For Analysis 2--> Finding - 2

From the above graph we can clearlyn see a pattern , no matter wether the review is helpfull or not helpfull the way people tend to give review is same except for the review count .
Its is also clear that every product tends to get positive and negative review at the begining , but over the period it get saturated to zero . 


# OUT PUT: 
## For Analysis 2--> Finding - 3



# Graph which showas the avg of overall rating fpr the product based on the sentiment 

![9_a2_f3](https://cloud.githubusercontent.com/assets/25119470/25310501/a0e29cee-27b3-11e7-88d5-69574e9e9391.JPG)



```python

```

### Conclusion 


- ## For Analysis 2--> Finding - 3

From the graph its clear that if the product get a postive review the avg overall rating is high when compared to the negative reivews whoes avg overall rating is low 




```python

```


```python

```

## Analysis 3

### **we will analyse wether the artist popularity have an impact on the ablum sung by the artist and dig deep into the twitter dataset  **

#### **Data Need**
        Load the Twitter details, ablum details file which are obtained from spotify, twitter and amazon  

- ## For Analysis 3--> Finding - 1

We are trying to find the most popular album for each year for the given time frame and also most popular album with in that year  

        - User can enter the input 
        - We are finding the Top ablum  based on the no the maximun popluarity for the given yaer  
        - Then with the year we are find the ablum with max popularity and ploting the ablum image 

- ## For Analysis 3-->  Finding - 2

We are extending our analysis furter to find the relationship between album popularity and artist popularity 

        

- ## For Analysis 3-->  Finding - 3

We are extending our analysis furter in twitter data set to find the top time zone and the details related to that time zone  

        - Find the top artist with most no of retweets 
        - Find the top timezone with most no of retweets 
        - Find the followers of users in the top timezone 
        - Find the Friends of users in the top timezone 
        
        
# Processing Steps 
   
   #### Analysis _ 3  -->  Finding 1 
         
         - Get the user input for the years range 
         - Sort the album for each year based on popularity and get the max 
         - Get the popular Ablum for each year for the input range 
         - Now the album based on popularity and get the max 
        
        
   #### Analysis _ 3  -->  Finding 2 
         
         - For the above albums we are getting the artist name 
         - Then we are passing the Artist name in Twitter API
         - Getting infromation related to artist 
         - We are getting the  popularity of the artist by count the tweets related to the artist 
         - We have the popularity of each albums in the file  
         - Now plot all the graph for popularity of artist and albums to see the trend 
        
   #### Analysis _ 3  -->  Finding 3 
         
         - We are aggregating the reweet count for each artist  
         - Find the top artist with most no of retweets  
         - Find the frequecy of the timezone of the users 
         - Getting the top 5 timezone with most no of user 
         - Getting the Count of follower of user in the top  time zone 
         - Getting the Count of friends of user in the top  time zone 
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        

# OUT PUT: 
## For Analysis 3--> Finding - 1



### Graph for the top 5 ablum 
### Top most all ablum image 


![11_a3_f1_1](https://cloud.githubusercontent.com/assets/25119470/25310530/35a96e2a-27b4-11e7-9dba-7c87efb35238.JPG)


### Album image 

![12_a3_f1_2](https://cloud.githubusercontent.com/assets/25119470/25310534/3f2cea3a-27b4-11e7-8d9d-dcffbea76573.JPG)


# Conclusion 

- ## For Analysis 3--> Finding - 1

We have plotted the graph for album with the maximum popularity for the give year range . With in the range have found the max popularity and pulled the album  image .



# OUT PUT: 
## For Analysis 3--> Finding - 2



## Album popularity and artist popularity 

![13_a3_f2](https://cloud.githubusercontent.com/assets/25119470/25310535/4bb90388-27b4-11e7-91f4-bf486486356e.JPG)


# Conclusion 

- ## For Analysis 3--> Finding - 2

from the above graph it is very clear that artist popularity doesnt have a any impact on the ablum popularity . 
        


# OUT PUT: 
## For Analysis 3--> Finding - 3



## Tweets talk abt artist 

![14_a3_f3_1](https://cloud.githubusercontent.com/assets/25119470/25310538/5db35d22-27b4-11e7-9be3-473ccf68f7a4.JPG)


### Friends and followers of users based on the time zone 

![15_a3_f3_2](https://cloud.githubusercontent.com/assets/25119470/25310539/67dac538-27b4-11e7-8960-e6da3d0f1deb.JPG)


# Conclusion 
        

- ## For Analysis 3--> Finding - 3
From the graph we can say thayt rihanna and Drake are the most popular artist in the tweeter and many people talk about them .
As per the tweets , tht top 5 time zone in which more no of tweets happen . So if people form these region have many frinds and follower so if they post anythinh it will reach to huge number of people. 



```python

```


```python

```


```python

```


```python

```


```python

```


```python

```
