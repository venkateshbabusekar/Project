
# We are installing package  
install.packages("XLConnect")
install.packages("forecast")
library(forecast)

library(XLConnect)
# We are setting the path for the directory 
setwd("E:/NEU_MIS/Spring_2016/INFO_7390_Advance_Data_Science/Mid Term Project/train")

# we are loading the data into a dataframe 
Train_data <-read.csv("train.csv")

#We are just see the overall summary od each column and dimension of the data 
summary(Train_data)
dim(Train_data)
    





# ================================================================ < DATA CLEANING > ========================================================================
# Convert the categorical variables to their numerical representations using 0-to-C transformation
# Fill in missing values of a column using 0, min, max, median, or average of the column.
# Removing the column with more than 70% of empty data 
# We are removing the column with more than 8 categories to avoid the overfiting of data 

# ================================================================= < Product_Info > ================================================================ 


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < Prodcut_Info_1 > ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`~~`

# We are finding the unique value of the column 
# Then we are converting it to 0-to-C transformation
unique(Train_data$Product_Info_1)
Train_data$Product_Info_1.1 <- 0
Train_data$Product_Info_1.2 <- 0
Train_data$Product_Info_1.1[Train_data$Product_Info_1 == 1] <- 1
Train_data$Product_Info_1.2[Train_data$Product_Info_1 == 2] <- 1
Train_data$Product_Info_1 = NULL



Train_data$Id = NULL 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < Prodcut_Info_2 > ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`~~`

# It is having more 20 categories
# Hence We are removing the column to avoid the overfiting of data 


unique(Train_data$Product_Info_2)
Train_data$Product_Info_2 <- NULL
Train_data$Product_Info_2
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < Prodcut_Info_3 > ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`~~`

# It is having more 20 categories
# Hence We are removing the column to avoid the overfiting of data 

unique(Train_data$Product_Info_3)
Train_data$Product_Info_3 <- NULL


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < Prodcut_Info_4 > ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#It is contious and having no missing value
# So no changes needed 

sum(is.na(Train_data$Product_Info_4))

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < Prodcut_Info_5 > ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# Then we are converting it to 0-to-C transformation

unique(Train_data$Product_Info_5)
Train_data$Product_Info_5.1 <- 0
Train_data$Product_Info_5.2 <- 0
Train_data$Product_Info_5.1[Train_data$Product_Info_5 == 2] <- 1
Train_data$Product_Info_5.2[Train_data$Product_Info_5 == 3] <- 1
Train_data$Product_Info_5 = NULL

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < Prodcut_Info_6 > ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# Then we are converting it to 0-to-C transformation

Train_data$Product_Info_6
Train_data$Product_Info_6.1 <- 0
Train_data$Product_Info_6.2 <- 0
Train_data$Product_Info_6.1[Train_data$Product_Info_6 == 1] <- 1
Train_data$Product_Info_6.2[Train_data$Product_Info_6 == 3] <- 1
Train_data$Product_Info_6 = NULL

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < Prodcut_Info_7 > ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# we have more than 2 unique value so we are creating a new columns for  0-to-C transformation
# Then we are converting it to 0-to-C transformation

Train_data$Product_Info_7.1 <- 0
Train_data$Product_Info_7.2 <- 0
Train_data$Product_Info_7.3 <- 0
Train_data$Product_Info_7.1[Train_data$Product_Info_7 == 1] <- 1
Train_data$Product_Info_7.2[Train_data$Product_Info_7 == 2] <- 1
Train_data$Product_Info_7.3[Train_data$Product_Info_7 == 3] <- 1
Train_data$Product_Info_7 <- NULL


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < Age > < Height > < Weight > < BMI>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# These column are contineous and having no missing value . So no changes needed 

sum(is.na(Train_data$Ins_Age))
sum(is.na(Train_data$Ht))
sum(is.na(Train_data$Wt))
sum(is.na(Train_data$BMI))

# ================================================================= < Employment_Info > ================================================================ 

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < Employment_Info_1 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#We are check if there is any missing value in the column
# we are finding the mean of the column 
# we are replace the missing value with mean

sum(is.na(Train_data$Employment_Info_1))
MeanE_Info_1 <- mean(Train_data$Employment_Info_1[!is.na(Train_data$Employment_Info_1)])
Train_data$Employment_Info_1[is.na(Train_data$Employment_Info_1)] <- MeanE_Info_1
sum(is.na(Train_data$Employment_Info_1))


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < Employment_Info_2 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# It is having more 20 categories
# Hence We are removing the column to avoid the overfiting of data 
Train_data$Employment_Info_2
unique(Train_data$Employment_Info_2)
Train_data$Employment_Info_2 <- NULL
Train_data$Employment_Info_2

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < Employment_Info_3 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# Then we are converting it to 0-to-C transformation
Train_data$Employment_Info_3
unique(Train_data$Employment_Info_3)
Train_data$Employment_Info_3.1 <- 0
Train_data$Employment_Info_3.2 <- 0
Train_data$Employment_Info_3.1[Train_data$Employment_Info_5==1]=1
Train_data$Employment_Info_3.2[Train_data$Employment_Info_5==3]=1
Train_data$Employment_Info_3=NULL


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < Employment_Info_4 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#We are check if there is any missing value in the column
# we are finding the mean of the column 
# we are replace the missing value with mean

sum(is.na(Train_data$Employment_Info_4))
MeanE_Info_4 <- mean(Train_data$Employment_Info_4[!is.na(Train_data$Employment_Info_4)])
Train_data$Employment_Info_4[is.na(Train_data$Employment_Info_4)] <- MeanE_Info_4
sum(is.na(Train_data$Employment_Info_4))


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < Employment_Info_5 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# Then we are converting it to 0-to-C transformation
Train_data$Employment_Info_5
unique(Train_data$Employment_Info_5)

Train_data$Employment_Info_5.1 <- 0
Train_data$Employment_Info_5.2 <- 0
Train_data$Employment_Info_5.1[Train_data$Employment_Info_5==3]=1
Train_data$Employment_Info_5.2[Train_data$Employment_Info_5==2]=1
Train_data$Employment_Info_5=NULL



# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < Employment_Info_6 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#We are check if there is any missing value in the column
# we are finding the mean of the column 
# we are replace the missing value with mean

sum(is.na(Train_data$Employment_Info_6))
MeanE_Info_6 <- mean(Train_data$Employment_Info_6[!is.na(Train_data$Employment_Info_6)])
Train_data$Employment_Info_6[is.na(Train_data$Employment_Info_6)] <- MeanE_Info_6
sum(is.na(Train_data$Employment_Info_6))


# ================================================================= < Insured_Info > ================================================================ 

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < InsuredInfo_1 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# We are finding the unique value of the column 
# we have more than 2 unique value so we are creating a new columns for  0-to-C transformation
# Then we are converting the original column to 0-to-C transformation and replacing the original column with null value 

unique(Train_data$InsuredInfo_1)
Train_data$InsuredInfo_1.1 <- 0
Train_data$InsuredInfo_1.2 <- 0
Train_data$InsuredInfo_1.3 <- 0
Train_data$InsuredInfo_1.1[Train_data$InsuredInfo_1==1]=1
Train_data$InsuredInfo_1.2[Train_data$InsuredInfo_1==2]=1
Train_data$InsuredInfo_1.3[Train_data$InsuredInfo_1==3]=1
Train_data$InsuredInfo_1=NULL


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < InsuredInfo_2 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# Then we are converting it to 0-to-C transformation
Train_data$InsuredInfo_2
unique(Train_data$InsuredInfo_2)

Train_data$InsuredInfo_2.1 <- 0
Train_data$InsuredInfo_2.2 <- 0
Train_data$InsuredInfo_2.1[Train_data$InsuredInfo_2==3]=1
Train_data$InsuredInfo_2.2[Train_data$InsuredInfo_2==2]=1
Train_data$InsuredInfo_2=NULL


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < InsuredInfo_3 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# It is having more than 10 categories
# Hence We are removing the column to avoid the overfiting of data 

unique(Train_data$InsuredInfo_3)
Train_data$InsuredInfo_3=NULL

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < InsuredInfo_4 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# Then we are converting it to 0-to-C transformation

Train_data$InsuredInfo_4
unique(Train_data$InsuredInfo_4)

Train_data$InsuredInfo_4.1 <- 0
Train_data$InsuredInfo_4.2 <- 0
Train_data$InsuredInfo_4.1[Train_data$InsuredInfo_4 == 2] <- 1
Train_data$InsuredInfo_4.2[Train_data$InsuredInfo_4 == 3] <- 1
Train_data$InsuredInfo_4 = NULL

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < InsuredInfo_5 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# Then we are converting it to 0-to-C transformation

Train_data$InsuredInfo_5
unique(Train_data$InsuredInfo_5)
Train_data$InsuredInfo_5.1 <- 0
Train_data$InsuredInfo_5.2 <- 0
Train_data$InsuredInfo_5.1[Train_data$InsuredInfo_4 == 2] <- 1
Train_data$InsuredInfo_5.2[Train_data$InsuredInfo_4 == 3] <- 1
Train_data$InsuredInfo_5 = NULL

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < InsuredInfo_6 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# Then we are converting it to 0-to-C transformation

Train_data$InsuredInfo_6
unique(Train_data$InsuredInfo_6)
Train_data$InsuredInfo_6.1 <- 0
Train_data$InsuredInfo_6.2 <- 0
Train_data$InsuredInfo_6.1[Train_data$InsuredInfo_6 == 1] <- 1
Train_data$InsuredInfo_6.2[Train_data$InsuredInfo_6 == 2] <- 1
Train_data$InsuredInfo_6 = NULL



# ================================================================= < Insurance_History > ================================================================ 

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < Insurance_History_1 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# We are finding if there is any empty value in the column 
# We are finding the unique value of the column 
# Then we are converting it to 0-to-C transformation

sum(is.na(Train_data$Insurance_History_1))
Train_data$Insurance_History_1
unique(Train_data$Insurance_History_1)

Train_data$Insurance_History_1.1 <- 0
Train_data$Insurance_History_1.1 <- 0
Train_data$Insurance_History_1.1[Train_data$Insurance_History_1 == 1] <- 1
Train_data$Insurance_History_1.1[Train_data$Insurance_History_1 == 2] <- 1
Train_data$Insurance_History_1 = NULL




# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < Insurance_History_2 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# We are finding if there is any empty value in the column 
# We are finding the unique value of the column 
# we have more than 2 unique value so we are creating a new columns for  0-to-C transformation
# Then we are converting the original column to 0-to-C transformation and replacing the original column with null value 

sum(is.na(Train_data$Insurance_History_2))
unique(Train_data$Insurance_History_2)
Train_data$Insurance_History_2.1 <- 0
Train_data$Insurance_History_2.2 <- 0
Train_data$Insurance_History_2.3 <- 0
Train_data$Insurance_History_2.1[Train_data$Insurance_History_2==1]=1
Train_data$Insurance_History_2.2[Train_data$Insurance_History_2==2]=1
Train_data$Insurance_History_2.3[Train_data$Insurance_History_2==3]=1
Train_data$Insurance_History_2=NULL

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < Insurance_History_3 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# We are finding if there is any empty value in the column 
# We are finding the unique value of the column 
# we have more than 2 unique value so we are creating a new columns for  0-to-C transformation
# Then we are converting the original column to 0-to-C transformation and replacing the original column with null value 

sum(is.na(Train_data$Insurance_History_3))
unique(Train_data$Insurance_History_3)
Train_data$Insurance_History_3.1 <- 0
Train_data$Insurance_History_3.2 <- 0
Train_data$Insurance_History_3.3 <- 0
Train_data$Insurance_History_3.1[Train_data$Insurance_History_3==1]=1
Train_data$Insurance_History_3.2[Train_data$Insurance_History_3==2]=1
Train_data$Insurance_History_3.3[Train_data$Insurance_History_3==3]=1
Train_data$Insurance_History_3=NULL



# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < Insurance_History_4 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# We are finding if there is any empty value in the column 
# We are finding the unique value of the column 
# we have more than 2 unique value so we are creating a new columns for  0-to-C transformation
# Then we are converting the original column to 0-to-C transformation and replacing the original column with null value 
unique(Train_data$Insurance_History_4)
sum(is.na(Train_data$Insurance_History_4))
Train_data$Insurance_History_4.1 <- 0
Train_data$Insurance_History_4.2 <- 0
Train_data$Insurance_History_4.3 <- 0
Train_data$Insurance_History_4.1[Train_data$Insurance_History_4==1]=1
Train_data$Insurance_History_4.2[Train_data$Insurance_History_4==2]=1
Train_data$Insurance_History_4.3[Train_data$Insurance_History_4==3]=1
Train_data$Insurance_History_4=NULL

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < Insurance_History_5 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# It is having more than 10 categories
# Hence We are removing the column to avoid the overfiting of data 

unique(Train_data$Insurance_History_5)
Train_data$Insurance_History_5=NULL




# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < Insurance_History_7 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# We are finding if there is any empty value in the column 
# We are finding the unique value of the column 
# we have more than 2 unique value so we are creating a new columns for  0-to-C transformation
# Then we are converting the original column to 0-to-C transformation and replacing the original column with null value 
unique(Train_data$Insurance_History_7)
sum(is.na(Train_data$Insurance_History_7))
Train_data$Insurance_History_7.1 <- 0
Train_data$Insurance_History_7.2 <- 0
Train_data$Insurance_History_7.3 <- 0
Train_data$Insurance_History_7.1[Train_data$Insurance_History_7==1]=1
Train_data$Insurance_History_7.2[Train_data$Insurance_History_7==2]=1
Train_data$Insurance_History_7.3[Train_data$Insurance_History_7==3]=1
Train_data$Insurance_History_7=NULL




# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < Insurance_History_8 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# We are finding if there is any empty value in the column 
# We are finding the unique value of the column 
# we have more than 2 unique value so we are creating a new columns for  0-to-C transformation
# Then we are converting the original column to 0-to-C transformation and replacing the original column with null value 
unique(Train_data$Insurance_History_8)
sum(is.na(Train_data$Insurance_History_8))
Train_data$Insurance_History_8.1 <- 0
Train_data$Insurance_History_8.2 <- 0
Train_data$Insurance_History_8.3 <- 0
Train_data$Insurance_History_8.1[Train_data$Insurance_History_8==1]=1
Train_data$Insurance_History_8.2[Train_data$Insurance_History_8==2]=1
Train_data$Insurance_History_8.3[Train_data$Insurance_History_8==3]=1
Train_data$Insurance_History_8=NULL



# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < Insurance_History_9 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# We are finding if there is any empty value in the column 
# We are finding the unique value of the column 
# we have more than 2 unique value so we are creating a new columns for  0-to-C transformation
# Then we are converting the original column to 0-to-C transformation and replacing the original column with null value 
sum(is.na(Train_data$Insurance_History_9))
unique(Train_data$Insurance_History_9)
Train_data$Insurance_History_9.1 <- 0
Train_data$Insurance_History_9.2 <- 0
Train_data$Insurance_History_9.3 <- 0
Train_data$Insurance_History_9.1[Train_data$Insurance_History_9==1]=1
Train_data$Insurance_History_9.2[Train_data$Insurance_History_9==2]=1
Train_data$Insurance_History_9.3[Train_data$Insurance_History_9==3]=1
Train_data$Insurance_History_9=NULL


# ================================================================= < Family_Hist > ================================================================ 

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < Family_Hist_1 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



# We are finding if there is any empty value in the column 
# We are finding the unique value of the column 
# we have more than 2 unique value so we are creating a new columns for  0-to-C transformation
# Then we are converting the original column to 0-to-C transformation and replacing the original column with null value 

unique(Train_data$Family_Hist_1)
sum(is.na(Train_data$Family_Hist_1))
Train_data$Family_Hist_1.1 <- 0
Train_data$Family_Hist_1.2 <- 0
Train_data$Family_Hist_1.3 <- 0
Train_data$Family_Hist_1.1[Train_data$Family_Hist_1==1]=1
Train_data$Family_Hist_1.2[Train_data$Family_Hist_1==2]=1
Train_data$Family_Hist_1.3[Train_data$Family_Hist_1==3]=1
Train_data$Family_Hist_1=NULL

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < Family_Hist_2 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#We are check if there is any missing value in the column
# we are finding the mean of the column 
# we are replace the missing value with mean

unique(Train_data$Family_Hist_2)
sum(is.na(Train_data$Family_Hist_2))
MeanF_Info_2 <- mean(Train_data$Family_Hist_2[!is.na(Train_data$Family_Hist_2)])
Train_data$Family_Hist_2[is.na(Train_data$Family_Hist_2)] <- MeanF_Info_2
sum(is.na(Train_data$Family_Hist_2))

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < Family_Hist_3 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#We are check if there is any missing value in the column
# we are finding the mean of the column 
# we are replace the missing value with mean

unique(Train_data$Family_Hist_3)
sum(is.na(Train_data$Family_Hist_3))
MeanF_Info_3 <- mean(Train_data$Family_Hist_3[!is.na(Train_data$Family_Hist_3)])
Train_data$Family_Hist_3[is.na(Train_data$Family_Hist_3)] <- MeanF_Info_3
sum(is.na(Train_data$Family_Hist_3))

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < Family_Hist_4 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are check if there is any missing value in the column
# we are finding the mean of the column 
# we are replace the missing value with mean

unique(Train_data$Family_Hist_4)
sum(is.na(Train_data$Family_Hist_4))
MeanF_Info_4 <- mean(Train_data$Family_Hist_4[!is.na(Train_data$Family_Hist_4)])
Train_data$Family_Hist_4[is.na(Train_data$Family_Hist_4)] <- MeanF_Info_4

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < Family_Hist_5 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# It is having more than 70% of data as empty 
# Hence We are removing the column  

unique(Train_data$Family_Hist_5)
Train_data$Family_Hist_5=NULL




# ================================================================= < Medical_History > ================================================================ 

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_1 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are check if there is any missing value in the column
# we are finding the mean of the column 
# we are replace the missing value with mean
Train_data$Medical_History_1
unique(Train_data$Medical_History_1)
summary(Train_data$Medical_History_1)
MeanM_Info_3 <- mean(Train_data$Medical_History_1[!is.na(Train_data$Medical_History_1)])
Train_data$Medical_History_1[is.na(Train_data$Medical_History_1)] <- MeanM_Info_3

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_2 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# It is having more than 10 categories
# Hence We are removing the column to avoid the overfiting of data 
unique(Train_data$Medical_History_2)
Train_data$Medical_History_2 = NULL

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_3 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# we have more than 2 unique value so we are creating a new columns for  0-to-C transformation
# Then we are converting the original column to 0-to-C transformation and replacing the original column with null value 

unique(Train_data$Medical_History_3)
Train_data$Medical_History_3 = factor(Train_data$Medical_History_3,labels = c(0,1,2))
Train_data$Medical_History_3.1 = 0
Train_data$Medical_History_3.2 = 0
Train_data$Medical_History_3.3 = 0
Train_data$Medical_History_3.1[Train_data$Medical_History_3==0] = 1
Train_data$Medical_History_3.2[Train_data$Medical_History_3==1] = 1
Train_data$Medical_History_3.3[Train_data$Medical_History_3==2] = 1
Train_data$Medical_History_3=NULL


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_4 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# Then we are converting it to 0-to-C transformation

unique(Train_data$Medical_History_4)
Train_data$Medical_History_4.1 = 0
Train_data$Medical_History_4.2 = 0
Train_data$Medical_History_4.1[Train_data$Medical_History_4==1] = 1
Train_data$Medical_History_4.2[Train_data$Medical_History_4==2] = 1
Train_data$Medical_History_4=NULL


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_5 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# we have more than 2 unique value so we are creating a new columns for  0-to-C transformation
# Then we are converting the original column to 0-to-C transformation and replacing the original column with null value 

unique(Train_data$Medical_History_5)
Train_data$Medical_History_5 = factor(Train_data$Medical_History_5,labels = c(0,1,2))
Train_data$Medical_History_5.1 = 0
Train_data$Medical_History_5.2 = 0
Train_data$Medical_History_5.3 = 0
Train_data$Medical_History_5.1[Train_data$Medical_History_5==0] = 1
Train_data$Medical_History_5.2[Train_data$Medical_History_5==1] = 1
Train_data$Medical_History_5.3[Train_data$Medical_History_5==2] = 1
Train_data$Medical_History_5=NULL

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_6 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# we have more than 2 unique value so we are creating a new columns for  0-to-C transformation
# Then we are converting the original column to 0-to-C transformation and replacing the original column with null value 

unique(Train_data$Medical_History_6)
Train_data$Medical_History_6 = factor(Train_data$Medical_History_6,labels = c(0,1,2))
Train_data$Medical_History_6.1 = 0
Train_data$Medical_History_6.2 = 0
Train_data$Medical_History_6.3 = 0
Train_data$Medical_History_6.1[Train_data$Medical_History_6==0] = 1
Train_data$Medical_History_6.2[Train_data$Medical_History_6==1] = 1
Train_data$Medical_History_6.3[Train_data$Medical_History_6==2] = 1
Train_data$Medical_History_6=NULL

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_7 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# we have more than 2 unique value so we are creating a new columns for  0-to-C transformation
# Then we are converting the original column to 0-to-C transformation and replacing the original column with null value 

unique(Train_data$Medical_History_7)
Train_data$Medical_History_7 = factor(Train_data$Medical_History_7,labels = c(0,1,2))
Train_data$Medical_History_7.1 = 0
Train_data$Medical_History_7.2 = 0
Train_data$Medical_History_7.3 = 0
Train_data$Medical_History_7.1[Train_data$Medical_History_7==0] = 1
Train_data$Medical_History_7.2[Train_data$Medical_History_7==1] = 1
Train_data$Medical_History_7.3[Train_data$Medical_History_7==2] = 1
Train_data$Medical_History_7=NULL

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_8 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# we have more than 2 unique value so we are creating a new columns for  0-to-C transformation
# Then we are converting the original column to 0-to-C transformation and replacing the original column with null value 

unique(Train_data$Medical_History_8)
Train_data$Medical_History_8 = factor(Train_data$Medical_History_8,labels = c(0,1,2))
Train_data$Medical_History_8.1 = 0
Train_data$Medical_History_8.2 = 0
Train_data$Medical_History_8.3 = 0
Train_data$Medical_History_8.1[Train_data$Medical_History_8==0] = 1
Train_data$Medical_History_8.2[Train_data$Medical_History_8==1] = 1
Train_data$Medical_History_8.3[Train_data$Medical_History_8==2] = 1
Train_data$Medical_History_8=NULL


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_9 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# we have more than 2 unique value so we are creating a new columns for  0-to-C transformation
# Then we are converting the original column to 0-to-C transformation and replacing the original column with null value 

unique(Train_data$Medical_History_9)
Train_data$Medical_History_9 = factor(Train_data$Medical_History_9,labels = c(0,1,2))
Train_data$Medical_History_9.1 = 0
Train_data$Medical_History_9.2 = 0
Train_data$Medical_History_9.3 = 0
Train_data$Medical_History_9.1[Train_data$Medical_History_9==0] = 1
Train_data$Medical_History_9.2[Train_data$Medical_History_9==1] = 1
Train_data$Medical_History_9.3[Train_data$Medical_History_9==2] = 1
Train_data$Medical_History_9=NULL
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_10 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# It is having more than 70% of data as empty 
# Hence We are removing the column  

summary(Train_data$Medical_History_10)
Train_data$Medical_History_10=NULL



# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_11 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# we have more than 2 unique value so we are creating a new columns for  0-to-C transformation
# Then we are converting the original column to 0-to-C transformation and replacing the original column with null value 

unique(Train_data$Medical_History_11)
Train_data$Medical_History_11 = factor(Train_data$Medical_History_11,labels = c(0,1,2))
Train_data$Medical_History_11.1 = 0
Train_data$Medical_History_11.2 = 0
Train_data$Medical_History_11.3 = 0
Train_data$Medical_History_11.1[Train_data$Medical_History_11==0] = 1
Train_data$Medical_History_11.2[Train_data$Medical_History_11==1] = 1
Train_data$Medical_History_11.3[Train_data$Medical_History_11==2] = 1
Train_data$Medical_History_11=NULL

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_12 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# we have more than 2 unique value so we are creating a new columns for  0-to-C transformation
# Then we are converting the original column to 0-to-C transformation and replacing the original column with null value 

unique(Train_data$Medical_History_12)
Train_data$Medical_History_12 = factor(Train_data$Medical_History_12,labels = c(0,1,2))
Train_data$Medical_History_12.1 = 0
Train_data$Medical_History_12.2 = 0
Train_data$Medical_History_12.3 = 0
Train_data$Medical_History_12.1[Train_data$Medical_History_12==0] = 1
Train_data$Medical_History_12.2[Train_data$Medical_History_12==1] = 1
Train_data$Medical_History_12.3[Train_data$Medical_History_12==2] = 1
Train_data$Medical_History_12=NULL

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_13 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# we have more than 2 unique value so we are creating a new columns for  0-to-C transformation
# Then we are converting the original column to 0-to-C transformation and replacing the original column with null value 

unique(Train_data$Medical_History_13)
Train_data$Medical_History_13 = factor(Train_data$Medical_History_13,labels = c(0,1,2))
Train_data$Medical_History_13.1 = 0
Train_data$Medical_History_13.2 = 0
Train_data$Medical_History_13.3 = 0
Train_data$Medical_History_13.1[Train_data$Medical_History_13==0] = 1
Train_data$Medical_History_13.2[Train_data$Medical_History_13==1] = 1
Train_data$Medical_History_13.3[Train_data$Medical_History_13==2] = 1
Train_data$Medical_History_13=NULL

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_14 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# we have more than 2 unique value so we are creating a new columns for  0-to-C transformation
# Then we are converting the original column to 0-to-C transformation and replacing the original column with null value 
unique(Train_data$Medical_History_14)
Train_data$Medical_History_14 = factor(Train_data$Medical_History_14,labels = c(0,1,2))
Train_data$Medical_History_14.1 = 0
Train_data$Medical_History_14.2 = 0
Train_data$Medical_History_14.3 = 0
Train_data$Medical_History_14.1[Train_data$Medical_History_14==0] = 1
Train_data$Medical_History_14.2[Train_data$Medical_History_14==1] = 1
Train_data$Medical_History_14.3[Train_data$Medical_History_14==2] = 1
Train_data$Medical_History_14=NULL


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_15 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# It is having more than 70% of data as empty 
# Hence We are removing the column  

summary(Train_data$Medical_History_15)
Train_data$Medical_History_15=NULL


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_16 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# we have more than 2 unique value so we are creating a new columns for  0-to-C transformation
# Then we are converting the original column to 0-to-C transformation and replacing the original column with null value 
unique(Train_data$Medical_History_16)
Train_data$Medical_History_16 = factor(Train_data$Medical_History_16,labels = c(0,1,2))
Train_data$Medical_History_16.1 = 0
Train_data$Medical_History_16.2 = 0
Train_data$Medical_History_16.3 = 0
Train_data$Medical_History_16.1[Train_data$Medical_History_16==0] = 1
Train_data$Medical_History_16.2[Train_data$Medical_History_16==1] = 1
Train_data$Medical_History_16.3[Train_data$Medical_History_16==2] = 1
Train_data$Medical_History_16=NULL


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_17 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# we have more than 2 unique value so we are creating a new columns for  0-to-C transformation
# Then we are converting the original column to 0-to-C transformation and replacing the original column with null value 
unique(Train_data$Medical_History_17)
Train_data$Medical_History_17 = factor(Train_data$Medical_History_17,labels = c(0,1,2))
Train_data$Medical_History_17.1 = 0
Train_data$Medical_History_17.2 = 0
Train_data$Medical_History_17.3 = 0
Train_data$Medical_History_17.1[Train_data$Medical_History_17==0] = 1
Train_data$Medical_History_17.2[Train_data$Medical_History_17==1] = 1
Train_data$Medical_History_17.3[Train_data$Medical_History_17==2] = 1
Train_data$Medical_History_17=NULL

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_18 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# we have more than 2 unique value so we are creating a new columns for  0-to-C transformation
# Then we are converting the original column to 0-to-C transformation and replacing the original column with null value 
unique(Train_data$Medical_History_18)
Train_data$Medical_History_18 = factor(Train_data$Medical_History_18,labels = c(0,1,2))
Train_data$Medical_History_18.1 = 0
Train_data$Medical_History_18.2 = 0
Train_data$Medical_History_18.3 = 0
Train_data$Medical_History_18.1[Train_data$Medical_History_18==0] = 1
Train_data$Medical_History_18.2[Train_data$Medical_History_18==1] = 1
Train_data$Medical_History_18.3[Train_data$Medical_History_18==2] = 1
Train_data$Medical_History_18=NULL


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_19 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# we have more than 2 unique value so we are creating a new columns for  0-to-C transformation
# Then we are converting the original column to 0-to-C transformation and replacing the original column with null value 

unique(Train_data$Medical_History_19)
Train_data$Medical_History_19 = factor(Train_data$Medical_History_19,labels = c(0,1,2))
Train_data$Medical_History_19.1 = 0
Train_data$Medical_History_19.2 = 0
Train_data$Medical_History_19.3 = 0
Train_data$Medical_History_19.1[Train_data$Medical_History_19==0] = 1
Train_data$Medical_History_19.2[Train_data$Medical_History_19==1] = 1
Train_data$Medical_History_19.3[Train_data$Medical_History_19==2] = 1
Train_data$Medical_History_19=NULL

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_20 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# we have more than 2 unique value so we are creating a new columns for  0-to-C transformation
# Then we are converting the original column to 0-to-C transformation and replacing the original column with null value 

unique(Train_data$Medical_History_20)
Train_data$Medical_History_20 = factor(Train_data$Medical_History_20,labels = c(0,1,2))
Train_data$Medical_History_20.1 = 0
Train_data$Medical_History_20.2 = 0
Train_data$Medical_History_20.3 = 0
Train_data$Medical_History_20.1[Train_data$Medical_History_20==0] = 1
Train_data$Medical_History_20.2[Train_data$Medical_History_20==1] = 1
Train_data$Medical_History_20.3[Train_data$Medical_History_20==2] = 1
Train_data$Medical_History_20=NULL

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_21 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# we have more than 2 unique value so we are creating a new columns for  0-to-C transformation
# Then we are converting the original column to 0-to-C transformation and replacing the original column with null value 

unique(Train_data$Medical_History_21)
Train_data$Medical_History_21 = factor(Train_data$Medical_History_21,labels = c(0,1,2))
Train_data$Medical_History_21.1 = 0
Train_data$Medical_History_21.2 = 0
Train_data$Medical_History_21.3 = 0
Train_data$Medical_History_21.1[Train_data$Medical_History_21==0] = 1
Train_data$Medical_History_21.2[Train_data$Medical_History_21==1] = 1
Train_data$Medical_History_21.3[Train_data$Medical_History_21==2] = 1
Train_data$Medical_History_21=NULL


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_22 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# Then we are converting it to 0-to-C transformation

unique(Train_data$Medical_History_22)

Train_data$Medical_History_22.1 <- 0
Train_data$Medical_History_22.2 <- 0
Train_data$Medical_History_22.1[Train_data$Medical_History_22 == 1] <- 1
Train_data$Medical_History_22.2[Train_data$Medical_History_22 == 2] <- 1
Train_data$Medical_History_22 = NULL





# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_23 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# we have more than 2 unique value so we are creating a new columns for  0-to-C transformation
# Then we are converting the original column to 0-to-C transformation and replacing the original column with null value 

unique(Train_data$Medical_History_23)
Train_data$Medical_History_23.1 <- 0
Train_data$Medical_History_23.2 <- 0
Train_data$Medical_History_23.3 <- 0
Train_data$Medical_History_23.1[Train_data$Medical_History_23 == 1] <- 1
Train_data$Medical_History_23.2[Train_data$Medical_History_23 == 2] <- 1
Train_data$Medical_History_23.3[Train_data$Medical_History_23 == 3] <- 1
Train_data$Medical_History_23 <- NULL


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_24 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# It is having more than 70% of data as empty 
# Hence We are removing the column  

sum(is.na(Train_data$Medical_History_24))
Train_data$Medical_History_24 = NULL


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_25 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# we have more than 2 unique value so we are creating a new columns for  0-to-C transformation
# Then we are converting the original column to 0-to-C transformation and replacing the original column with null value 

unique(Train_data$Medical_History_25)
Train_data$Medical_History_25.1 <- 0
Train_data$Medical_History_25.2 <- 0
Train_data$Medical_History_25.3 <- 0
Train_data$Medical_History_25.1[Train_data$Medical_History_25 == 1] <- 1
Train_data$Medical_History_25.2[Train_data$Medical_History_25 == 2] <- 1
Train_data$Medical_History_25.3[Train_data$Medical_History_25 == 3] <- 1
Train_data$Medical_History_25 <- NULL


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_26 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# we have more than 2 unique value so we are creating a new columns for  0-to-C transformation
# Then we are converting the original column to 0-to-C transformation and replacing the original column with null value 

unique(Train_data$Medical_History_26)
Train_data$Medical_History_26.1 <- 0
Train_data$Medical_History_26.2 <- 0
Train_data$Medical_History_26.3 <- 0
Train_data$Medical_History_26.1[Train_data$Medical_History_26 == 1] <- 1
Train_data$Medical_History_26.2[Train_data$Medical_History_26 == 2] <- 1
Train_data$Medical_History_26.3[Train_data$Medical_History_26 == 3] <- 1
Train_data$Medical_History_26 <- NULL


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_27 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# we have more than 2 unique value so we are creating a new columns for  0-to-C transformation
# Then we are converting the original column to 0-to-C transformation and replacing the original column with null value 

unique(Train_data$Medical_History_27)
Train_data$Medical_History_27.1 <- 0
Train_data$Medical_History_27.2 <- 0
Train_data$Medical_History_27.3 <- 0
Train_data$Medical_History_27.1[Train_data$Medical_History_27 == 1] <- 1
Train_data$Medical_History_27.2[Train_data$Medical_History_27 == 2] <- 1
Train_data$Medical_History_27.3[Train_data$Medical_History_27 == 3] <- 1
Train_data$Medical_History_27 <- NULL


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_28 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# we have more than 2 unique value so we are creating a new columns for  0-to-C transformation
# Then we are converting the original column to 0-to-C transformation and replacing the original column with null value 
unique(Train_data$Medical_History_28)
Train_data$Medical_History_28.1 <- 0
Train_data$Medical_History_28.2 <- 0
Train_data$Medical_History_28.3 <- 0
Train_data$Medical_History_28.1[Train_data$Medical_History_28 == 1] <- 1
Train_data$Medical_History_28.2[Train_data$Medical_History_28 == 2] <- 1
Train_data$Medical_History_28.3[Train_data$Medical_History_28 == 3] <- 1
Train_data$Medical_History_28 <- NULL


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_29 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# we have more than 2 unique value so we are creating a new columns for  0-to-C transformation
# Then we are converting the original column to 0-to-C transformation and replacing the original column with null value 
unique(Train_data$Medical_History_29)
Train_data$Medical_History_29.1 <- 0
Train_data$Medical_History_29.2 <- 0
Train_data$Medical_History_29.3 <- 0
Train_data$Medical_History_29.1[Train_data$Medical_History_29 == 1] <- 1
Train_data$Medical_History_29.2[Train_data$Medical_History_29 == 2] <- 1
Train_data$Medical_History_29.3[Train_data$Medical_History_29 == 3] <- 1
Train_data$Medical_History_29 <- NULL


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_30 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# we have more than 2 unique value so we are creating a new columns for  0-to-C transformation
# Then we are converting the original column to 0-to-C transformation and replacing the original column with null value 
unique(Train_data$Medical_History_30)
Train_data$Medical_History_30.1 <- 0
Train_data$Medical_History_30.2 <- 0
Train_data$Medical_History_30.3 <- 0
Train_data$Medical_History_30.1[Train_data$Medical_History_30 == 1] <- 1
Train_data$Medical_History_30.2[Train_data$Medical_History_30 == 2] <- 1
Train_data$Medical_History_30.3[Train_data$Medical_History_30 == 3] <- 1
Train_data$Medical_History_30 <- NULL


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_31 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# we have more than 2 unique value so we are creating a new columns for  0-to-C transformation
# Then we are converting the original column to 0-to-C transformation and replacing the original column with null value 
unique(Train_data$Medical_History_31)
Train_data$Medical_History_31.1 <- 0
Train_data$Medical_History_31.2 <- 0
Train_data$Medical_History_31.3 <- 0
Train_data$Medical_History_31.1[Train_data$Medical_History_31 == 1] <- 1
Train_data$Medical_History_31.2[Train_data$Medical_History_31 == 2] <- 1
Train_data$Medical_History_31.3[Train_data$Medical_History_31 == 3] <- 1
Train_data$Medical_History_31 <- NULL


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_32 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# It is having more than 70% of data as empty 
# Hence We are removing the column  

sum(is.na(Train_data$Medical_History_32))
Train_data$Medical_History_32 = NULL

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_33 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# Then we are converting it to 0-to-C transformation
unique(Train_data$Medical_History_33)
Train_data$Medical_History_33.1 = 0
Train_data$Medical_History_33.2 = 0
Train_data$Medical_History_33.1[Train_data$Medical_History_33==1] = 1
Train_data$Medical_History_33.2[Train_data$Medical_History_33==3] = 1
Train_data$Medical_History_33=NULL


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_34 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# we have more than 2 unique value so we are creating a new columns for  0-to-C transformation
# Then we are converting the original column to 0-to-C transformation and replacing the original column with null value 
unique(Train_data$Medical_History_34)
Train_data$Medical_History_34.1 <- 0
Train_data$Medical_History_34.2 <- 0
Train_data$Medical_History_34.3 <- 0
Train_data$Medical_History_34.1[Train_data$Medical_History_34 == 1] <- 1
Train_data$Medical_History_34.2[Train_data$Medical_History_34 == 2] <- 1
Train_data$Medical_History_34.3[Train_data$Medical_History_34 == 3] <- 1
Train_data$Medical_History_34 <- NULL

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_35 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# we have more than 2 unique value so we are creating a new columns for  0-to-C transformation
# Then we are converting the original column to 0-to-C transformation and replacing the original column with null value 
unique(Train_data$Medical_History_35)
Train_data$Medical_History_35.1 <- 0
Train_data$Medical_History_35.2 <- 0
Train_data$Medical_History_35.3 <- 0
Train_data$Medical_History_35.1[Train_data$Medical_History_35 == 1] <- 1
Train_data$Medical_History_35.2[Train_data$Medical_History_35 == 2] <- 1
Train_data$Medical_History_35.3[Train_data$Medical_History_35 == 3] <- 1
Train_data$Medical_History_35 <- NULL

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_36 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# we have more than 2 unique value so we are creating a new columns for  0-to-C transformation
# Then we are converting the original column to 0-to-C transformation and replacing the original column with null value 
unique(Train_data$Medical_History_36)
Train_data$Medical_History_36.1 <- 0
Train_data$Medical_History_36.2 <- 0
Train_data$Medical_History_36.3 <- 0
Train_data$Medical_History_36.1[Train_data$Medical_History_36 == 1] <- 1
Train_data$Medical_History_36.2[Train_data$Medical_History_36 == 2] <- 1
Train_data$Medical_History_36.3[Train_data$Medical_History_36 == 3] <- 1
Train_data$Medical_History_36 <- NULL

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_37 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# we have more than 2 unique value so we are creating a new columns for  0-to-C transformation
# Then we are converting the original column to 0-to-C transformation and replacing the original column with null value 
unique(Train_data$Medical_History_37)
Train_data$Medical_History_37.1 <- 0
Train_data$Medical_History_37.2 <- 0
Train_data$Medical_History_37.3 <- 0
Train_data$Medical_History_37.1[Train_data$Medical_History_37 == 1] <- 1
Train_data$Medical_History_37.2[Train_data$Medical_History_37 == 2] <- 1
Train_data$Medical_History_37.3[Train_data$Medical_History_37 == 3] <- 1
Train_data$Medical_History_37 <- NULL

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_38 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# Then we are converting it to 0-to-C transformation
unique(Train_data$Medical_History_38)
Train_data$Medical_History_38.1 <- 0
Train_data$Medical_History_38.2 <- 0
Train_data$Medical_History_38.1[Train_data$Medical_History_38 == 1] <- 1
Train_data$Medical_History_38.2[Train_data$Medical_History_38 == 2] <- 1
Train_data$Medical_History_38 <- NULL


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_39 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# we have more than 2 unique value so we are creating a new columns for  0-to-C transformation
# Then we are converting the original column to 0-to-C transformation and replacing the original column with null value 
unique(Train_data$Medical_History_39)
Train_data$Medical_History_39.1 <- 0
Train_data$Medical_History_39.2 <- 0
Train_data$Medical_History_39.3 <- 0
Train_data$Medical_History_39.1[Train_data$Medical_History_39 == 1] <- 1
Train_data$Medical_History_39.2[Train_data$Medical_History_39 == 2] <- 1
Train_data$Medical_History_39.3[Train_data$Medical_History_39 == 3] <- 1
Train_data$Medical_History_39 <- NULL

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_40 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# we have more than 2 unique value so we are creating a new columns for  0-to-C transformation
# Then we are converting the original column to 0-to-C transformation and replacing the original column with null value 
unique(Train_data$Medical_History_40)
Train_data$Medical_History_40.1 <- 0
Train_data$Medical_History_40.2 <- 0
Train_data$Medical_History_40.3 <- 0
Train_data$Medical_History_40.1[Train_data$Medical_History_40 == 1] <- 1
Train_data$Medical_History_40.2[Train_data$Medical_History_40 == 2] <- 1
Train_data$Medical_History_40.3[Train_data$Medical_History_40 == 3] <- 1
Train_data$Medical_History_40 <- NULL

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_41 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are finding the unique value of the column 
# we have more than 2 unique value so we are creating a new columns for  0-to-C transformation
# Then we are converting the original column to 0-to-C transformation and replacing the original column with null value 
unique(Train_data$Medical_History_41)
Train_data$Medical_History_41.1 <- 0
Train_data$Medical_History_41.2 <- 0
Train_data$Medical_History_41.3 <- 0
Train_data$Medical_History_41.1[Train_data$Medical_History_41 == 1] <- 1
Train_data$Medical_History_41.2[Train_data$Medical_History_41 == 2] <- 1
Train_data$Medical_History_41.3[Train_data$Medical_History_41 == 3] <- 1
Train_data$Medical_History_41 <- NULL                        




#Dividing the given train data to a training and testing subsets(80% and 20% respectively)
s <- sample(2,nrow(Train_data), replace = TRUE, prob = c(0.8,0.2))
train <- Train_data[s==1,]
test <- Train_data[s==2,]

#Come up with a Tree Model based on the TRAINING DATASET using TREE library

install.packages("tree")  
library(tree)
tree_model <- tree(Response~.,data=train)
plot(tree_model)
text(tree_model,pretty= 0)

summary(tree_model)





#Test the Tree Model against the TEST DATASET
test_prediction <- predict(tree_model,test)

#Rounding off the predicted values
round(test_prediction)

MSR_tree = sqrt(mean((test_prediction - test$Response)^2))
MSR_tree

accuracy(test_prediction,test$Response)



#Prune model to check if it helps predictive performance
prune_model <- prune.tree(tree_model, best = 7)
plot(prune_model)
text(prune_model,pretty=0)
summary(prune_model)


#testing pruned model
pruned_tree_prediction <- predict(prune_model,test)
pruned_tree_MSR= sqrt(mean((pruned_tree_prediction - test$Response)^2))
pruned_tree_MSR


accuracy(pruned_tree_prediction,test$Response)


#Come up with a Tree Model based on the TRAINING DATASET using RPART library

library(rpart)
library(rpart.plot)
tree_rpart_model <- rpart(Response~.,data=train)
rpart.plot(tree_rpart_model)


summary(tree_rpart_model)


#Test the Tree Model against the TEST DATASET
test_prediction_Rpart <- predict(tree_rpart_model,test)

#Rounding off the predicted values
round(test_prediction_Rpart)

MSR_Rpart = sqrt(mean((test_prediction_Rpart - test$Response)^2))
MSR_Rpart

accuracy(test_prediction_Rpart,test$Response)
