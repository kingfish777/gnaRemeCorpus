Course of action: 


1.) take account of PftML tales, build corpus TO DO:

      finish Russian on 20 tales
      translate those to English
      strategic markup of 60 more with these functions/content objects in evidence 
      (based on Appendix III):
          cardinal function (a = lack/A = villainy) --- every tale will have one of these 
          by definition, so would be interesting to be able to identify these and possibly 
          categorize them, based on Machine Learning as applied to PftML training corpus
          Donor functions (DEF)
          Wedding (w/W)

2.) Source code TO DO:

      A.) SELECT and FILTER: 
      
       Xpath query to query PftML corpus for particular function or set of functions and 
       save in local folder
       
       Filter out personal names of protagonists, donors, villains [will rite regular 
       expression/grep to search and replace with null/"" any capitalized 
       words in Corpus that appear in any location other than first word of a sentence]
       
       Code to create chunks for testing [medium hard --- don’t have this]
       
       Code to transform "query chunk" into DocumentTermMatrix [medium easy]
       
       Tokenize by sentences then put adjacent sentences back together again
       
      B.) QUERY
      
       Create language model (weighted DocumentTermMatrix) from corpus/text collection
      from above resultant text snippets
      
      C.) RETAIN RESULTS IN PERSISTENCE MECHANISM FOR FURTHER ANALYSIS
      
       Write script to log results of above to text log or database
    
    
    
    
    
    
    
    
 random note (a biggie): 
 
 http://stackoverflow.com/questions/17703553/bigrams-instead-of-single-words-in-termdocument-matrix-using-r-and-rweka
