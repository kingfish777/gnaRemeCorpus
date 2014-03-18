# Load Packages
library(infotheo)
library(entropy)
require(tm)
require(NLP)
require(openNLP)
library(foreign)
library(tau)
#split training and testing ===>
#http://stackoverflow.com/questions/14822333/split-sample-of-r-tm-corpus-objects?rq=1
#setwd("C:/tales")
#calculate mutual information with sklearn and numpy
#http://stackoverflow.com/questions/20491028/optimal-way-for-calculating-columnwise-mutual-information-using-numpy
#######
#entropy package
# http://cran.r-project.org/web/packages/entropy/entropy.pdf
#
#############################
# http://kris.kalish.net/2013/11/mutual-information-in-r/
#############################
setwd("/home/kingfish/tales")
text <- system.file("texts", "txt", package="tm")
# read in corpus
corpus <- Corpus(DirSource())
print(corpus[[13]])

convert_text_to_sentences <- function(text, lang = "en") {
  # Function to compute sentence annotations using the Apache OpenNLP Maxent sentence
  # detector employing the default model for language 'en'.
  sentence_token_annotator <- Maxent_Sent_Token_Annotator(language = lang)
  # Convert text to class String from package NLP
  text <- as.String(text)
  # Sentence boundaries in text
  sentence.boundaries <- annotate(text, sentence_token_annotator)
  # Extract sentences
  sentences <- text[sentence.boundaries]
  # return sentences
  return(sentences)
}

sentences <- lapply(corpus[[13]], convert_text_to_sentences)

reshape_corpus <- function(corpus, FUN, ...) {
  # Extract the text from each document in the corpus and put into a list
  text <- lapply(corpus, Content)
  # Basically convert the text
  docs <- lapply(text, FUN, ...)
  docs <- as.vector(unlist(docs))
  # Create a new corpus structure and return it
  new.corpus <- Corpus(VectorSource(docs))
  return(new.corpus)
}

new.corpus <- reshape_corpus(corpus, convert_text_to_sentences)

## create a corpus
dat <- data.frame(doc1 = "Doctor Who is a British science fiction television programme produced by the BBC. The programme depicts the adventures of a Time Lord—a time travelling, humanoid alien known as the Doctor. He explores the universe in his TARDIS (acronym: Time and Relative Dimension in Space), a sentient time-travelling space ship. Its exterior appears as a blue British police box, a common sight in Britain in 1963, when the series first aired. Along with a succession of companions, the Doctor faces a variety of foes while working to save civilisations, help ordinary people, and right wrongs.",
                  doc2 = "The show has received recognition from critics and the public as one of the finest British television programmes, winning the 2006 British Academy Television Award for Best Drama Series and five consecutive (2005–10) awards at the National Television Awards during Russell T Davies's tenure as Executive Producer.[3][4] In 2011, Matt Smith became the first Doctor to be nominated for a BAFTA Television Award for Best Actor. In 2013, the Peabody Awards honoured Doctor Who with an Institutional Peabody \"for evolving with technology and the times like nothing else in the known television universe.\"[5]",
                  doc3 = "The programme is listed in Guinness World Records as the longest-running science fiction television show in the world[6] and as the \"most successful\" science fiction series of all time—based on its over-all broadcast ratings, DVD and book sales, and iTunes traffic.[7] During its original run, it was recognised for its imaginative stories, creative low-budget special effects, and pioneering use of electronic music (originally produced by the BBC Radiophonic Workshop).",
                  stringsAsFactors = FALSE)

current.corpus <- Corpus(VectorSource(dat))
# A corpus with 3 text documents

## reshape the corpus into sentences (modify this function if you want to keep meta data)
reshape_corpus(current.corpus, convert_text_to_sentences)
# A corpus with 10 text documents

library(qdap)
with(sentSplit(tm_corpus2df(current.corpus), "text"), df2tm_corpus(tot, text))
##
tm_map(current.corpus, sent_detect)
####
mi_dtm <- infotheo::mutinformation(X=discretize(t(as.matrix(dtm))), method="sg" )
