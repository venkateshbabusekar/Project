# We are installing package  
#install.packages("XLConnect")
library(XLConnect)
library(forecast)
library(caret)
library(e1071)

# We are setting the path for the directory 
setwd("E:\\NEU_MIS\\Spring_2016\\INFO_7390_Advance_Data_Science\\final_project\\Sentiment_Analysis\\Final Project")

# we are loading the data into a dataframe 
sparse_representation <-read.csv("a-sparseMatrix.csv")

#label_reviews <-read.csv("a-sentiment_label_reviews.csv")

data = data.frame(sparse_representation)
data$X <- NULL
sample_index = sample(3500, 3000)
test_dateset = data[sample_index,]
train_dateset = data[-sample_index,]
x <- subset(train_dateset, select=-decision)
y <- train_dateset$decision 






#We are building a simple model 
#We are taking upo the sample data and buing the model so that we can use it for tuning the cost , gamma and kernel 
model = svm(decision  ~ ., kernel ="linear",data = train_dateset, scale = F)

#We are predicting our testdata set using the  simple model (Which is not tuned )
predictionslinear <-  predict(model, test_dateset)

#We are plotting a confusion matrix of the predicted table . 
table(test_dateset$decision, predictionslinear)


#predictionslinear
#           negative netural positive
#negative      953     143      234
#netural       123      93      150
#positive      270     100      934




svm_tune <- tune(svm, train.x=x, train.y=y, 
                 kernel="linear", ranges=list(cost=2^(-15:3)))

# we can see the tune value using the summary function  
summary(svm_tune)

#----------------------OUT PUT -----------------------------------------------          

# summary(svm_tune)
#Parameter tuning of 'svm':
#sampling method: 10-fold cross validation 

#best parameters:
#cost .05
#best performance: .35


#We are tuning the model with the training data for kernel="radial"
svm_tune2 <- tune(svm, train.x=x, train.y=y, 
                  kernel="radial", ranges=list(cost=2^(-15:3), gamma=2^(-5:15)))
# we can see the tune value using the summary function  
summary(svm_tune2)

#----------------------OUT PUT -----------------------------------------------          

# summary(svm_tune)
#Parameter tuning of 'svm':
#sampling method: 10-fold cross validation 

#best parameters:
#cost  gamma
#8 0.0625

# best performance: 0.324 


#We are tuning the model with the training data for kernel="polynomial"

svm_tune3 <- tune(svm, train.x=x, train.y=y, 
                  kernel="polynomial", ranges=list(cost=2^(-15:3), gamma=2^(-5:15)))
# we can see the tune value using the summary function  

summary(svm_tune3)

#----------------------OUT PUT -----------------------------------------------          

# summary(svm_tune)
#Parameter tuning of 'svm':
#sampling method: 10-fold cross validation 

#best parameters:
#cost  gamma

#    8 16384
# best performance: 0.376 

#We are tuning the model with the training data for kernel="sigmoid"
svm_tune4 <- tune(svm, train.x=x, train.y=y, 
                  kernel="sigmoid", ranges=list(cost=2^(-15:3), gamma=2^(-5:15)))
# we can see the tune value using the summary function  

summary(svm_tune4)


#----------------------OUT PUT -----------------------------------------------          

# summary(svm_tune)
#Parameter tuning of 'svm':
#sampling method: 10-fold cross validation 

#best parameters:
#cost  gamma
# 0.25 0.125
#best performance:  0.354 




############################################################################3
############################################################################3
############################################################################3
############################################################################3
############################################################################3

# we have used the kernal has radial and cost as 8 and gamma as .06 for which we are geting 70 percent accuracy 


model_tuned_radial = svm(decision  ~ ., kernel ="radial",data = train_dateset, cost=8,gamma=0.06)

predictions_tuned_radial <-  predict(model_tuned_radial, test_dateset)

#We are plotting a confusion matrix of the predicted table . 
table(test_dateset$decision, predictions_tuned_radial)



##########################----------Out put----------###################################3

#predictions_tuned_radial
#           negative netural positive
#negative      991       7      324
#netural       211      15      151
#positive      279      10     1012


