
# install.packages('stringr')
# install.packages('tm')
# install.packages("rvest")
# install.packages('wordcloud')
# install.packages('SnowballC')
# install.packages('plyr')

library(stringr)
library(tm)
library(rvest)
library(wordcloud)
library(SnowballC)
library(plyr)

review_data<-NULL
for(i in 1:550){
  url=paste("https://www.amazon.com/Blue-Cache-Desktop-Drive-WD10EZEX/product-reviews/B0088PUEPK/ref=cm_cr_arp_d_paging_btm_2?ie=UTF8&pageNumber=",i,"&reviewerType=avp_only_reviews&sortBy=recent",i,sep="")
  echo_dot <- read_html(url)
  
  body <- echo_dot %>% 
    html_nodes("#cm_cr-review_list .review .review-data .review-text") %>%
    html_text() 
  
  review_data <- c(review_data,body)
  
}
raw_review_data <- review_data
raw_review_data <- matrix(raw_review_data)
raw_review_data[1]

review_data <- matrix(review_data)


#Clean the scraped data
review_data <- gsub("/", "", review_data) # replace '/' character  
review_data <- gsub("'\'", "", review_data) # replace '\' character
review_data <- gsub("u0096", "", review_data) # replace garbage
review_data <- gsub("[\r\n]", " ", review_data) # replace line breaks
review_data <- gsub('[[:cntrl:]]', '', review_data)
review_data <- gsub('[[:punct:]]', '', review_data)
review_data <- gsub('\\d+', '', review_data)
review_data <- gsub('\\p{So}|\\p{Cn}', '', review_data, perl = TRUE) #remove emojis



corpus_data=Corpus(VectorSource(review_data))

corpus_data <- tm_map(corpus_data,removeNumbers)
corpus_data <- tm_map(corpus_data,removeWords,stopwords("english"))
corpus_data <- tm_map(corpus_data,removePunctuation)
corpus_data <- tm_map(corpus_data,stripWhitespace)
corpus_data <- tm_map(corpus_data, PlainTextDocument)
corpus_data <- tm_map(corpus_data,content_transformer(tolower))

corpus_data[[1]]

#Stem the Corpus
corpus_data <- tm_map(corpus_data,stemDocument,language="english")
corpus_data[[1]]

#Transform Corpus to Document Term Matrix
corpus_dtm <- DocumentTermMatrix(corpus_data)


##########code to check reviews count
##########write.csv(review_data, "allReview.csv")

remove_sparse_corpus = removeSparseTerms(corpus_dtm,0.95)
dim(remove_sparse_corpus)


#Representation logic#####
# show the count of the top 30 words

mean_corpus <- sort(colSums(as.matrix(corpus_dtm)),decreasing = T)
mean_corpus[1:30]

#Barplot of the top 30 words vs count
barplot(mean_corpus[1:30],border = NA, las=3,xlab = "Top 30 words",ylab = "Count of occurance",ylim = c(0,5000), col = c("purple"))


#Compare count if zeros are excluded from the matrix
rmspa_corpus_nozero <- as.matrix(remove_sparse_corpus)
is.na(rmspa_corpus_nozero) <- rmspa_corpus_nozero==0
mean_corpus_nonzero = sort(colSums(rmspa_corpus_nozero,na.rm=TRUE),decreasing = T)
mean_corpus_nonzero[1:30]

barplot(mean_corpus_nonzero[1:30],border = NA, las=3,xlab = "top 20 words",ylab = "Frequency",ylim = c(0,5000), col = c("purple"))

#Removing non-interesting words

mystopwords <- c("one","two","just","usb","drive","window","first","use","instal", "this", "year", "need", "get", "product", "the", "replac","bought")
corpus_clean2 <- tm_map(corpus_data,removeWords,mystopwords)
corpus_clean2 <- tm_map(corpus_clean2, stemDocument)#PlainTextDocument

corpus_dtm2 <- DocumentTermMatrix(corpus_clean2)#,control=list(tolower=T,removeNumbers=T,removePunctuation=T,stopwords=T,stripWhitespace=T,stemDocument=T))
rmspa_corpus2 = removeSparseTerms(corpus_dtm2,0.95)
dim(rmspa_corpus2)


# show the count of the top 30 most useful and frequent words
mean_corpus2 <- sort(colSums(as.matrix(rmspa_corpus2)),decreasing = T)
mean_corpus2[1:30]

#Barplot of the top 30 words vs count
barplot(mean_corpus2[1:30],border = NA, las=3,xlab = "Top 30 words",ylab = "Count of occurance",ylim = c(0,2500), col = c("yellow"))

#wordcloud of the most frequent words
wordcloud(names(mean_corpus2[1:30]),mean_corpus2[1:30],scale = c(3,1),colors = brewer.pal(8,"Dark2"))

#load up word polarity list and format it
delim_list <- read.delim(file="E:/Documents/MS IS/ADS/Final Project/Final_Project_ADS/Final_Project/words.txt", header=FALSE, stringsAsFactors=FALSE)
names(delim_list) <- c('word', 'score')
delim_list$word <- tolower(delim_list$word)

#categorize words as very negative to very positive and add some review-specific words

negTerms <- c(delim_list$word[delim_list$score==-3 | delim_list$score==-2 | delim_list$score==-1 | delim_list$score==-5 | delim_list$score==-4], "second-rate", "moronic", "third-rate", "flawed", "juvenile", "boring", "distasteful", "ordinary", "disgusting", "senseless", "static", "brutal", "confused", "disappointing", "bloody", "silly", "tired", "predictable", "stupid", "uninteresting", "trite", "uneven", "outdated", "dreadful", "bland")
posTerms <- c(delim_list$word[delim_list$score==5 | delim_list$score==4 | delim_list$score==3 | delim_list$score==2 | delim_list$score==1], "first-rate", "insightful", "clever", "charming", "comical", "charismatic", "enjoyable", "absorbing", "sensitive", "intriguing", "powerful", "pleasant", "surprising", "thought-provoking", "imaginative", "unpretentious","uproarious", "riveting", "fascinating", "dazzling", "legendary")

#function to calculate number of words in each category within a sentence

calculateSentiment <- function(review_all, negTerms, posTerms){
  final_scores <- matrix('', 0, 4)
  scores <- laply(review_all, function(review_all, negTerms, posTerms){
    initial_sentence <- review_all
    
    #remove unnecessary characters and split up by word 
    
    wordList <- str_split(review_all, '\\s+')
    words <- unlist(wordList)
    
    #build vector with matches between sentence and each category
    posMatches <- match(words, posTerms)
    negMatches <- match(words, negTerms)
    
    
    #sum up number of words in each category
    
    posMatches <- sum(!is.na(posMatches))
    negMatches <- sum(!is.na(negMatches))
    
    total <- posMatches + negMatches
    
    negPercent <- (negMatches/total)*100
    posPercent <- (posMatches/total)*100
    
    score <- c(negPercent, posPercent, posPercent)
    
    #add row to scores table
    newrow <- c(initial_sentence, score)
    final_scores <- rbind(final_scores, newrow)
    return(final_scores)
  }, negTerms, posTerms)
  return(scores)
}    


#build tables of review with scores
posResult <- as.data.frame(calculateSentiment(review_data, negTerms, posTerms))
colnames(posResult) <- c('sentence', 'negative', 'positive', 'portion')

#posResult[,1] <- as.numeric(as.character( posResult[, 1] ))
posResult[,2] <- as.numeric(as.character( posResult[, 2] ))
posResult[,3] <- as.numeric(as.character( posResult[, 3] ))
posResult[,4] <- as.numeric(as.character( posResult[, 4] ))


#Omit row containing scores of NA
complete_function<-function(result, portion_column){
  complete_vector<-complete.cases(result[,portion_column])
  return(result[complete_vector,])
}
complete_result<-complete_function(posResult,"portion")

#get the positive, netural and negative
portionCal<-complete_result$portion
decision<-laply(posResult$portion,function(x){
  if(!is.na(x) && x>50){return(posResult$portion<-'positive')}
  else if(!is.na(x) && x==50){return(posResult$portion<-'netural')}
  else return(x<-'negative')
})

final_review <- posResult$sentence
review_posPer <- posResult$positive
review_decision <- decision

final_review_result <- data.frame(final_review,review_posPer,review_decision)
write.csv(final_review_result,"sentiment_label_reviews.csv",row.names = FALSE)


#Create sparse matrix with sentiment analysis
sparseMatrix <- cbind(as.matrix(corpus_dtm2), decision)
write.csv(sparseMatrix, "sparseMatrix.csv")

#save the percent weightage in the dataframe df 

negPercent <- (posResult$neg)
posPercent <- (posResult$pos)
y_name <- "Negative%"
x_name <- "Positive%"

df <- data.frame(posPercent,negPercent)
names(df) <- c(x_name,y_name)
print(df)

meanPercent <- lapply(df, median, na.rm = TRUE)
write.csv(df,file='df8.csv',row.names = FALSE)

postiveAvg <- mean(!is.na(posPercent))
negativeAvg <- mean(!is.na(negPercent))

posResult1 <- subset(posResult, select = -sentence)

#Average Sentiment on the Corpus Review 

barplot(c(meanPercent$`Positive%`,meanPercent$`Negative%`),beside = TRUE, col = c("purple","gray")
        ,legend.text = c("Positive","Negative"),  
        ylim = c(0,100), xlab = 'All Reviews',ylab = 'Percentage', sub = 'Overall Sentiment distribution')

#Sample Plot for Individual Review 1 and 2

barplot(c(df$`Positive%`[1],df$`Negative%`[1]),beside = TRUE, col = c("purple","gray")
        ,legend.text = c("Positive","Negative"),  
        ylim = c(0,100), xlab = 'Review 1',ylab = 'Percentage', sub = substr(review_data[1],1,60))

barplot(c(df$`Positive%`[2],df$`Negative%`[2]),beside = TRUE, col = c("purple","gray")
        ,legend.text = c("Positive","Negative"),  
        ylim = c(0,100), xlab = 'Review 2',ylab = 'Percentage', sub = substr(review_data[2],1,60))




