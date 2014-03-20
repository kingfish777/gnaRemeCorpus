library(tm)
library(foreign)
library(tau)
#setwd("C:/tales")
setwd("/home/kingfish/tales")
text <- system.file("texts", "txt", package="tm")
# read in corpus
corpus <- Corpus(DirSource())
print(corpus[[13]])
###############################################
# use these to remove fine grained distinctions
###############################################
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, tolower)
#corpus <- tm_map(corpus, stripWhitespace)
corpus <- tm_map(corpus, stemDocument)
tokenize_ngrams <- function(x, n=3) return(rownames(as.data.frame(unclass(textcnt(x,method="string",n=n)))))
print(corpus[[13]])
#tokenize_ngrams <- function(x, n=3) return(rownames(as.data.frame(unclass(textcnt(x,method="string",n=n)))))
#DocumentTermMatrix(x=corpus, control=())
tdm <- DocumentTermMatrix(corpus,
                          control=list(weighting = weightBin,
                                       tokenize=tokenize_ngrams,
                                       stopwords = TRUE))
#inspect
tdm$dimnames
# create more dense matrix
tdm.dense <- removeSparseTerms(tdm, .2)
# write to arff
write.arff(as.matrix(tdm), file="/home/kingfish/Desktop/term_document_matrix.arff", relation=tdm.dense$dimnames$Docs) # where file is your destination
#write.arff(as.matrix(tdm), file="C:/term_document_matrix.arff", relation=tdm.dense$dimnames$Docs) # where file is your destination
# or
###
#Once you get to this point, you can browse through my code samples and plug in the dtm
#recommended libraries:
library(topicmodels)
library(lsa)
library(RTextTools)
#########
require("NLP")
## Some text.
s <- paste(c("Pierre Vinken, 61 years old, will join the board as a ",
             "nonexecutive director Nov. 29.\n",
             "Mr. Vinken is chairman of Elsevier N.V., ",
             "the Dutch publishing group."),
           collapse = "")
s <- as.String(s)

sent_token_annotator <- Maxent_Sent_Token_Annotator()
sent_token_annotator
a1 <- annotate(s, sent_token_annotator)
a1
## Extract sentences.
s[a1]
## Variant with sentence probabilities as features.
annotate(s, Maxent_Sent_Token_Annotator(probs = TRUE))
##
http://stackoverflow.com/questions/18712878/r-break-corpus-into-sentences
#
writeLines(as.character(corpus), con="mycorpus.txt")
