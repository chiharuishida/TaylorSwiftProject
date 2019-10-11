
install.packages("syuzhet") 
install.packages("lubridate") 
install.packages("ggplot2")
install.packages("scales")
install.packages("reshape2") 
install.packages("dplyr") 


library(syuzhet)
library(lubridate)
library(ggplot2)
library(scales)
library(reshape2)
library(dplyr)

getwd()
setwd("C:/Users/cishida/Documents")

data <- read.csv("Taylorswift_gorgeous2.csv")

text=readLines("Taylorswift_gorgeous2.csv")

sent.text<-get_nrc_sentiment(text)
head(sent.text)
sent.text
write.csv(sent.text, "Taylorswift_gorgeous3.csv")

text=readLines("Taylorswift_gorgeous3.csv")

#getting emotions using in-built function
mysentiment_lyric<-get_nrc_sentiment(text)

#calculationg total score for each sentiment
Sentimentscores_lyrics<-data.frame(colSums(mysentiment_lyric[,]))

names(Sentimentscores_lyrics)<-"Score"
Sentimentscores_lyrics<-cbind("sentiment"=rownames(Sentimentscores_lyrics),Sentimentscores_lyrics)
rownames(Sentimentscores_lyrics)<-NULL

#plotting the sentiments with scores
ggplot(data=Sentimentscores_lyrics,aes(x=sentiment,y=Score))+geom_bar(aes(fill=sentiment),stat = "identity")+
  theme(legend.position="none")+
  xlab("Sentiments")+ylab("scores")+ggtitle("Sentiments of this particular song")




