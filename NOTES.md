Course of action:


1.) take account of PftML tales, build corpus TO DO:
  
      Translate those to English [DONE]

      Drop translation text into PftML for existing 10 excellent, 10 so-so tales. [NOT YET]
                          PftMLicized tales (Russian 10 incomplete, 10 complete): https://github.com/kingfish777/gnaRemeCorpus     
                          Google English from FEB website (no markup): https://github.com/kingfish777/ProppModel

      Strategic markup of 60 more with these functions/content objects in evidence
      (based on Appendix III): [NOT YET]
     
          - cardinal function (a = lack/A = villainy) --- every tale will have one of these
            by definition, so would be interesting to be able to identify these and possibly
            categorize them, based on Machine Learning as applied to PftML training corpus
          - Donor functions (DEF)
          - Wedding (w/W)
          - H/I / M/N
          - etc.

2.) Source code TO DO:

      A.) SELECT and FILTER:
     
       Xpath query to query PftML corpus for particular function or set of functions and
       save in local folder [DONE]
      
       Filter out personal names of protagonists, donors, villains [will rite regular
       expression/grep to search and replace with null/"" any capitalized
       words in Corpus that appear in any location other than first word of a sentence] [NOT YET]
      
       Code to create chunks for testing [DONE]
      
       Code to transform "query chunk" into DocumentTermMatrix [DONE]
      
       Tokenize by sentences then put adjacent sentences back together again [DONE]
      
      B.) QUERY
     
       Create language model (weighted DocumentTermMatrix) from corpus/text collection
       from above resultant text snippets [DONE]
     
      C.) RETAIN AND ANALYZE RESULTS [NOT YET]
      
    
    
    
    
    
    
 random note (a biggie): 
 
 http://stackoverflow.com/questions/17703553/bigrams-instead-of-single-words-in-termdocument-matrix-using-r-and-rweka
