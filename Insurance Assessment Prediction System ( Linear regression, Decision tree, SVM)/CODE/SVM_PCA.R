install.packages("ade4")


library(e1071)
library(ade4)
library(forecast)

Train_data <- read.csv("E:/NEU_MIS/Spring_2016/INFO_7390_Advance_Data_Science/Mid Term Project/train/train.csv")

data_categorical <- Train_data[c("Product_Info_1", "Product_Info_2", "Product_Info_3","Product_Info_5", "Product_Info_6", "Product_Info_7", "Employment_Info_2", "Employment_Info_3", "Employment_Info_5"
                                     ,"InsuredInfo_1", "Medical_History_2", "Employment_Info_2", "Employment_Info_3", 
                                     "Employment_Info_5","InsuredInfo_2", "InsuredInfo_3", "InsuredInfo_4", "InsuredInfo_5", "InsuredInfo_6", "InsuredInfo_7",
                                     "Insurance_History_1", "Insurance_History_2", "Insurance_History_3", "Insurance_History_4", "Insurance_History_7", "Insurance_History_8", "Insurance_History_9",
                                     "Family_Hist_1","Medical_History_3", "Medical_History_4", "Medical_History_5", "Medical_History_6", "Medical_History_7", "Medical_History_8", "Medical_History_9",
                                     "Medical_History_11", "Medical_History_12", "Medical_History_13", "Medical_History_14", "Medical_History_16", "Medical_History_17", "Medical_History_18", "Medical_History_19", "Medical_History_20",
                                     "Medical_History_21", "Medical_History_22", "Medical_History_23", "Medical_History_25", "Medical_History_26", "Medical_History_27", "Medical_History_28", "Medical_History_29", "Medical_History_30", 
                                     "Medical_History_31", "Medical_History_33", "Medical_History_34", "Medical_History_35", "Medical_History_36", "Medical_History_37", "Medical_History_38", "Medical_History_39", "Medical_History_40", "Medical_History_41")]


OneToCValue <- acm.disjonctif(data_categorical)


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < Employment_Info_1 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#We are check if there is any missing value in the column
# we are finding the mean of the column 
# we are replace the missing value with mean

sum(is.na(Train_data$Employment_Info_1))
MeanE_Info_1 <- mean(Train_data$Employment_Info_1[!is.na(Train_data$Employment_Info_1)])
Train_data$Employment_Info_1[is.na(Train_data$Employment_Info_1)] <- MeanE_Info_1
sum(is.na(Train_data$Employment_Info_1))


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < Employment_Info_4 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#We are check if there is any missing value in the column
# we are finding the mean of the column 
# we are replace the missing value with mean

sum(is.na(Train_data$Employment_Info_4))
MeanE_Info_4 <- mean(Train_data$Employment_Info_4[!is.na(Train_data$Employment_Info_4)])
Train_data$Employment_Info_4[is.na(Train_data$Employment_Info_4)] <- MeanE_Info_4
sum(is.na(Train_data$Employment_Info_4))
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < Employment_Info_6 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#We are check if there is any missing value in the column
# we are finding the mean of the column 
# we are replace the missing value with mean

sum(is.na(Train_data$Employment_Info_6))
MeanE_Info_6 <- mean(Train_data$Employment_Info_6[!is.na(Train_data$Employment_Info_6)])
Train_data$Employment_Info_6[is.na(Train_data$Employment_Info_6)] <- MeanE_Info_6
sum(is.na(Train_data$Employment_Info_6))

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < Insurance_History_5 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

sum(is.na(Train_data$Insurance_History_5))

MeanM_Info_3 <- mean(Train_data$Insurance_History_5[!is.na(Train_data$Insurance_History_5)])
Train_data$Insurance_History_5[is.na(Train_data$Insurance_History_5)] <- MeanM_Info_3

sum(is.na(Train_data$Insurance_History_5))




# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < Family_Hist_2 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#We are check if there is any missing value in the column
# we are finding the mean of the column 
# we are replace the missing value with mean

sum(is.na(Train_data$Family_Hist_2))
MeanF_Info_2 <- mean(Train_data$Family_Hist_2[!is.na(Train_data$Family_Hist_2)])
Train_data$Family_Hist_2[is.na(Train_data$Family_Hist_2)] <- MeanF_Info_2
sum(is.na(Train_data$Family_Hist_2))


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < Family_Hist_4 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are check if there is any missing value in the column
# we are finding the mean of the column 
# we are replace the missing value with mean

sum(is.na(Train_data$Family_Hist_4))
MeanF_Info_4 <- mean(Train_data$Family_Hist_4[!is.na(Train_data$Family_Hist_4)])
Train_data$Family_Hist_4[is.na(Train_data$Family_Hist_4)] <- MeanF_Info_4
sum(is.na(Train_data$Family_Hist_4))



# ================================================================= < Medical_History > ================================================================ 

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ < medical_History_1 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# We are check if there is any missing value in the column
# we are finding the mean of the column 
# we are replace the missing value with mean
sum(is.na(Train_data$Medical_History_1))

MeanM_Info_3 <- mean(Train_data$Medical_History_1[!is.na(Train_data$Medical_History_1)])
Train_data$Medical_History_1[is.na(Train_data$Medical_History_1)] <- MeanM_Info_3

sum(is.na(Train_data$Medical_History_1))



data_continuous <- Train_data[c("Product_Info_4", "Ins_Age", "Ht", "Wt", "BMI",
                                    "Employment_Info_1", "Employment_Info_4", "Employment_Info_6",
                                    "Insurance_History_5", "Family_Hist_2", "Family_Hist_4","Medical_History_1",
                                "Medical_Keyword_1",	"Medical_Keyword_2",	"Medical_Keyword_3",	"Medical_Keyword_4",
                                "Medical_Keyword_5",	"Medical_Keyword_6",	"Medical_Keyword_7",	"Medical_Keyword_8",
                                "Medical_Keyword_9",	"Medical_Keyword_10",	"Medical_Keyword_11",	"Medical_Keyword_12",
                                "Medical_Keyword_13",	"Medical_Keyword_14",	"Medical_Keyword_15",	"Medical_Keyword_16",
                                "Medical_Keyword_17",	"Medical_Keyword_18",	"Medical_Keyword_19",	"Medical_Keyword_20",
                                "Medical_Keyword_21",	"Medical_Keyword_22",	"Medical_Keyword_23",	"Medical_Keyword_24",
                                "Medical_Keyword_25",	"Medical_Keyword_26",	"Medical_Keyword_27",	"Medical_Keyword_28",
                                "Medical_Keyword_29",	"Medical_Keyword_30",	"Medical_Keyword_31",	"Medical_Keyword_32",
                                "Medical_Keyword_33",	"Medical_Keyword_34",	"Medical_Keyword_35",	"Medical_Keyword_36",
                                "Medical_Keyword_37",	"Medical_Keyword_38",	"Medical_Keyword_39",	"Medical_Keyword_40",
                                "Medical_Keyword_41",	"Medical_Keyword_42",	"Medical_Keyword_43",	"Medical_Keyword_44",
                                "Medical_Keyword_45",	"Medical_Keyword_46",	"Medical_Keyword_47",	"Medical_Keyword_48")]
data_Combined <- data.frame(c(OneToCValue, data_continuous))
finDal <- na.omit(data_Combined)
pca_data <- prcomp(finDal)
plot(pca_data)
summary(pca_data)
pca_selected_components <- data.frame(pca_data$x[,1:14])

#Adding dependent variable to the PCA data
pcaYVariable <- data.frame(c(pca_selected_components, Train_data[c("Response")]))
pcaYVariable$Response<-as.factor(pcaYVariable$Response)

#Index to get sample for training and test data
i_train<-sample(1:nrow(pcaYVariable), nrow(pcaYVariable)*0.7)

train<-pcaYVariable[i_train,]
test<-pcaYVariable[-i_train,]


# svm_model_improve <- svm(Response ~.,data = pcaYVariable, 
#                          cost= 10, epsilon = 0.3, type = "eps-regression")

svm_model<-svm(Response ~., data = train)

predictResponseSVM <- predict(svm_model,test)
accuracy(as.numeric(predictResponseSVM),as.numeric(test$Response))
