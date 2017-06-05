
library("plyr")
library("stringr")
#load data
data<-read.csv("userreview.csv")

#get the rating score
rates<-data$Star_Rating
rate<-as.numeric(sub("\\D*(\\d+).*", "\\1", rates))
rate_score<-rate
rate_score

#get reviews
reviews<-data$Body
#function for sentiment analysis
sentiment <- function(sentences, positive_word, negative_word, .progress='none')
{

  portions <- laply(sentences, function(sentences, positive_word, negative_word){
    #clean up sentences with R's regex-driven global substitute, gsub()
    #remove punctuation characters
    sentences <- gsub('[[:punct:]]', "", sentences)
    #remove control characters
    sentences <- gsub('[[:cntrl:]]', "", sentences)
    #remove digits
    sentences <- gsub('\\d+', "", sentences)
    #make lower letter
    sentences <- tolower(sentences)
    #split into words
    word_list <- str_split(sentences, '\\s+')
    words <- unlist(word_list)
    #compare sentences to the dictionaries of positive & negative words
    pos <- match(words, positive_word)
    neg <- match(words, negative_word)
    #convert to TRUE or FALSE to and get the portion
    pos <- !is.na(pos)
    neg <- !is.na(neg)
    portion <- sum(pos)/(sum(pos)+ sum(neg))
  }, positive_word, negative_word, .progress=.progress)
  return(portions)
}
#load dictionaries of positive and negative words
positive_word<-readLines("positive-words.txt")
negative_word<-readLines("negative-words.txt")

#get the portion of sentiment analysis
portions <- sentiment(reviews, positive_word, negative_word, .progress='text')

user_name<-data$User
original_review<-data$Body
date<-data$Date

result<-data.frame(rate_score, user_name,date,original_review,portions)

#Omit row containing scores of NA
complete_function<-function(result, portion_column){
  complete_vector<-complete.cases(result[,portion_column])
  return(result[complete_vector,])
}
complete_result<-complete_function(result,"portions")

#get the positive, netural and negative
portion<-complete_result$portions
decision<-laply(score,function(x){
  if(x>0.5){return(portion<-'positive')}
  else if(x==0.5){return(portion<-'netural')}
  else return(x<-'negative')
})

#get the fina data frame
final_rate<-complete_result$rate_score
final_name<-complete_result$user_name
final_date<-complete_result$date
final_reviews<-complete_result$original_review
final_portion<-complete_result$portions
final_decision<-decision

final_result<-data.frame(final_rate,final_name, final_date, final_reviews,final_portion,final_decision)
write.csv(final_result, "label_reviews.csv",row.names = FALSE)

#length(grep("positive", final_decision))
#length(grep("netural", final_decision))
#length(grep("negative",final_decision))

