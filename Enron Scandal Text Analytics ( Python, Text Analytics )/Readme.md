
## Question 1 :  Enron Scandal Analysis


# Summary about the scandal

- Enron Corp. is a company that reached dramatic heights, only to face a dizzying collapse. The story ends with the bankruptcy of one of America's largest corporations.Enron's collapse affected the lives of thousands of employees and shook Wall Street to its core. At Enron's peak, its shares were worth $90.7 but fter the company declared bankruptcy on December 2, 2001, they plummeted to $0.67 by January 2002.





# Intial findings about Data : 
    - We are given set of email which are related to enron corp.
    - we were given 5,17,401
    - Email are date from 2000 to 2001 , conversation between 150 people hwo worked in enron

# Process for storing the Data :

    - We are targeting the email which are in the sent mail of all the 150 employee
    - We are writting a recursive function , to fetch all the sent mail of the each employee
    - We are storing the obtained data from recursive function in csv , for the later use 
     
![email_save](https://cloud.githubusercontent.com/assets/25119470/23641958/b6144b16-02c5-11e7-8d97-e2a8e78d3895.JPG)

# Analysis _ 1 
    
    -Finding 1 

        - We are trying to find all the most number of email sent by a person , We are analysing only the sent email's  
        - We are trying to generate the data dynamicaly by give range for year, day, month rather than finding the 
           value for a particular year, day, month . 

    -Finding 2 

        - We are trying to find all the most number of email received by a person , We are analysing only the sent 
          email's  
        - We are trying to generate the data dynamicaly by give range for year, day, month rather than finding the 
           value for a particular year, day, month . 


# Processing Steps 
   
   #### Analysis _ 1  -->  Finding 1 
   
       - We are loading the csv file which has only the data of sent email from all the 150 employee 
       - We are looping thru all the row and we are getting the data of the rows which ever satisfiy the give range for 
         year, day, month
       - We are storing that value in a dictionary 
       - We are sorting the dictionary 
       - Then we are find the top 10 person who has sent most no of emails and the count 
       - We are saving the final data to a csv 

   #### Analysis _ 1  --> Finding 2
   
       - We are loading the csv file which has only the data of sent email from all the 150 employee 
       - We are looping thru all the row and we are getting the data of the rows which ever satisfiy the give range for 
         year, day, month
       - We are storing that value in a dictionary 
       - We are sorting the dictionary 
       - Then we are find the top 10 person who has received most no of emails and the count 
       - We are saving the final data to a csv 
    

# Output
   #### Analysis _ 1  -->  Finding 1 

![out1](https://cloud.githubusercontent.com/assets/25119470/23642139/8004c07c-02c6-11e7-8fd6-62a12eeb3d92.JPG)

# Output
   #### Analysis _ 1  -->  Finding 2 

![out2](https://cloud.githubusercontent.com/assets/25119470/23642145/8d6e3fc2-02c6-11e7-9607-350a772483af.JPG)

# Conclusion 
 - We have found out the list of most number of email sent by a particular person and email sent to particular person
 
 # Further Analysis 

- Since we have the top sender and receiver , we can start our investigation from them . 
- We can dig deeper into these people histroy , what they were sending and receiving .






# Analysis _ 2 
    
    -Finding 1 

        - we are trying to analyze the most occuring word in the subject of the sent email 
        - We are trying to generate the data dynamicaly by give range for year, day, month rather than finding the 
           value for a particular year, day, month . 

    -Finding 2 

        - We are trying to find the email which was forwarded many times by taking the occurance of each subject   
        - We are trying to generate the data dynamicaly by give range for year, day, month rather than finding the 
           value for a particular year, day, month . 


# Processing Steps 
   
   #### Analysis _ 2  -->  Finding 1 
   
       - We are loading the csv file which has only the data of sent email from all the 150 employee 
       - We are looping thru all the row and we are getting the data of the rows which ever satisfiy the give range for 
         year, day, month
       - We are getting the subject of each mail 
       - we are tokenizing the subject 
       - We are storing the tokenized value in a dictionary 
       - We are sorting the dictionary 
       - Then we are find the top 10 words which was used in the subject and the count for the give time frame
       - We are saving the final data to a csv 

   #### Analysis _ 2  --> Finding 2 
   
       - We are loading the csv file which has only the data of sent email from all the 150 employee 
       - We are looping thru all the row and we are getting the data of the rows which ever satisfiy the give range for 
         year, day, month
       - We are getting the subject of each mail 
       - We are cleaning the subject by removing the "RE: , FW:" from the subject
       - We are storing that value and the occurance in a dictionary 
       - We are sorting the dictionary 
       - Then we are find the top 10 subject which was spoke for the give time frame 
       - We are saving the final data to a csv 
    

# Output
   #### Analysis _ 2  -->  Finding 1 

![q2_p1](https://cloud.githubusercontent.com/assets/25119470/23642163/9b49c102-02c6-11e7-8e2e-fd7447b7fab0.JPG)

# Output
   #### Analysis _ 2  -->  Finding 2 

![q2_p2](https://cloud.githubusercontent.com/assets/25119470/23642166/a200075e-02c6-11e7-8895-95ca491d4e41.JPG)

# Conclusion 
 - We have found out the list of most number of words used in the subject and which subject has be forwarded the most 
    for the given time period 
 
 # Further Analysis 

- Since we have the top list of most number of words used in the subject and which subject has be forwarded the most, 
   we can start our investigation by analysisng those email. 
- We can dig deeper into those email and what they were talking about  .






# Analysis _ 3


    -Finding 1 
        - We are trying to analyze only the email which was sent during the weekend and find the topic that was discussed
        - We are trying to generate the data dynamicaly by give range for year, day, month rather than finding the 
           value for a particular year, day, month . 

    -Finding 2 

        - We are trying to get the list of person who is receving email during weekend 
        - We are trying to generate the data dynamicaly by give range for year, day, month rather than finding the 
           value for a particular year, day, month . 

    -Finding 3
    
        - We are trying to get the list of person who is working during weekend 
        - We are trying to generate the data dynamicaly by give range for year, day, month rather than finding the 
           value for a particular year, day, month . 


# Processing Steps 
   
   #### Analysis _ 3  -->  Finding 1 
   
       - We are loading the csv file which has only the data of sent email from all the 150 employee 
       - We are looping thru all the row and we are getting the data of the rows which ever satisfiy the give range for 
         year, day, month
       - We are getting the content of each mail 
       - We are cleaning the subject by removing the stop words
       - we are tokenizing the content 
       - We are storing the tokenized value in a dictionary 
       - We are sorting the dictionary 
       - Then we are find the top 10 words which was used in the content and the count during the weekend for the give 
          time frame
       - We are saving the final data to a csv 

   #### Analysis _ 3  --> Finding 2 
   
       - We are loading the csv file which has only the data of sent email from all the 150 employee 
       - We are looping thru all the row and we are getting the data of the rows which ever satisfiy the give range for 
         year, day, month
       - We are getting the "TO" of each mail 
       - We are storing that value and the occurance in a dictionary 
       - We are sorting the dictionary 
       - Then we are find the top 10 person received the email during the weekend for the give time frame 
       - We are saving the final data to a csv 
 
   #### Analysis _ 3  --> Finding 3
   
       - We are loading the csv file which has only the data of sent email from all the 150 employee 
       - We are looping thru all the row and we are getting the data of the rows which ever satisfiy the give range for 
         year, day, month
       - We are getting the "TO" of each mail 
       - We are storing that value and the occurance in a dictionary 
       - We are sorting the dictionary 
       - Then we are find the top 10 person who was working during the weekend for the give time frame 
       - We are saving the final data to a csv 
 


# Output
   #### Analysis _ 3  -->  Finding 1 

![q3_p1](https://cloud.githubusercontent.com/assets/25119470/23642175/afebf1d4-02c6-11e7-9082-866eafbfcaf8.JPG)

# Output
   #### Analysis _ 3  -->  Finding 2

![q3_p2](https://cloud.githubusercontent.com/assets/25119470/23642179/b865c5ba-02c6-11e7-9275-0025e9584f3d.JPG)

# Output
   #### Analysis _ 3  -->  Finding 3

![q3_p3](https://cloud.githubusercontent.com/assets/25119470/23642185/c191a7bc-02c6-11e7-9e87-6cc179911266.JPG)

# Conclusion 
 - We have found out the list of person who was working during the weekend and the received the email during the weekend
    and what was all the topic is about for the given time period 
 
 # Further Analysis 

    - Since we have the list of person who was working during the weekend and the received the email during the weekend
        and what was all the topic is about we can start our investigation by analysing those email and person. 
    - We can dig deeper into those email and check what they were talking about  .







```python

```


```python

```


```python

```

# Question 2 : The New York Times Developer Network

# Summary :
 We are using NYTimes.com which is an unparalleled source of news and information. We are getting data froom different  
 API and analysing the data from the obtained data   

# Intial findings about Data : 
    - We many differnt type of API , decide which API we are going to analyse .
    - Then register you are mail and get the API key  


# Process for storing the Data :

    - With the help of the API key write a programm to get the data from API
    - Given all the necessary parameter in the code
    - Then dump the data into json file
    - Then break down the data into smaller size json file so that we can perform the operation effeciently 

![data](https://cloud.githubusercontent.com/assets/25119470/23642202/d6871d64-02c6-11e7-90f6-c441cae86d42.JPG)


# Analysis _ 1

    - Finding 1 

        - We are trying to find out the frequency of words related to world war over the period from 1940 to 1943 
        

# Processing Steps 
   
   #### Analysis _ 1 -->  Finding 1 
   
       - We are specifing the path wer all the data is stored 
       - we are creating a text file whcih contains thw word related to word war 
       - We Looping thru each file from the path  
       - We getting the content of the file 
       - we are tokenizing the content 
       - we are cleaning the data by removing the stop words 
       - For the cleaned data we are comparing it with the list 
       - Then we are finding out the frequenty of each words
       - Then we are potting the graph 


# Output
   #### Analysis _ 1  -->  Finding 1

![qq2_a1](https://cloud.githubusercontent.com/assets/25119470/23642213/e6289c20-02c6-11e7-81f8-6b57e35afd55.JPG)

# Conclusion 

- over the period 1941 we can see there is more artical talk about war and the talk wer gradually decreasing over the
    period of time 

# Analysis _ 2
   #### Analysis _ 2 -->  Finding 1    
   
   - For any give N no of article , we are find the relation between the section and most frequent words from the 
       paragraph that are related to section 
       

# Processing Steps 
   
   #### Analysis _ 2 -->  Finding 1 
   
       - We are specifing the path were all the data is stored 
       - We Looping thru each file from the path  
       - We getting the words from section the of each file
       - creating a dictionary and add the adding the word in the section
       - we are tokenizing the content 
       - we are cleaning the data by removing the stop words 
       - Then we are finding out the frequenty of each words
       - For the cleaned data we are adding it as the value to each key in dictionalry  
       - Then we are potting the graph 


# Output
   #### Analysis _ 2  -->  Finding 1

![qq2_a2](https://cloud.githubusercontent.com/assets/25119470/23642223/f6ab340e-02c6-11e7-989b-7e59710987ac.JPG)

# Conclusion
- Based on the unique section in any give article , we can the find the relationship between the top most words present acros any given article for the given section.

# Analysis 3
   #### Analysis _ 3
        - We are taking the data from  most popular API 
        - For the given year 2016 we are analysing the views and shares for past 30 days

# Processing Steps 
   
   #### Analysis _ 2 -->  Finding 1 
   
       - We are specifing the path were all the data is stored 
       - We Looping thru each file from the path  
       - We getting the value for the view and the value for share
       - creating a dictionary and add the adding the value and key to the dictionary 
       - Then we are potting the graph with the dictionary  


# Output
   #### Analysis _ 3  -->  Share

![l2](https://cloud.githubusercontent.com/assets/25119470/23642230/03ec5878-02c7-11e7-9ee0-42c4191a2667.JPG)

# Output
   #### Analysis _ 3  -->  View graph

![l3](https://cloud.githubusercontent.com/assets/25119470/23642238/0cfb1daa-02c7-11e7-982e-a3f4307511ff.JPG)

# CONCLUSION
    - From the above two graph we can conclude that people are sharing more than they are veiwing  


```python

```
