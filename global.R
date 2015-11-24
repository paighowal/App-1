library(tm)
library(wordcloud)
library(memoise)
#Cache the results of a function so that when you call it again 
#with the same arguments it returns the pre-computed value.

getTermMatrix<- memoise(function(){
text=read.csv("D:\\USF\\Sem 1\\Android Worshop\\MOCK_DATA.csv",stringsAsFactors = FALSE)
 
  
  myCorpus = Corpus(VectorSource(text$Note))
  myCorpus = tm_map(myCorpus, content_transformer(tolower))
  myCorpus = tm_map(myCorpus, removePunctuation)
  myCorpus = tm_map(myCorpus, removeNumbers)
  myCorpus = tm_map(myCorpus,removeWords, stopwords("english"))
  myCorpus = tm_map(myCorpus,removeWords, c(stopwords("english"),
                                            stopwords("SMART"),"also","like"))
  
  myDTM = TermDocumentMatrix(myCorpus,
                             control = list(minWordLength = 1))

  m = as.matrix(myDTM)
  
  sort(rowSums(m), decreasing = TRUE)
})

