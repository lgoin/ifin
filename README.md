# ifin
ifin is a stata program that checks to see if one macro is contained in another, and then returns r(matches) with the matches

## syntax

`ifin `local_contains' = ``local_contained' 



## example

    loc alpha a b c d e f g h i 
  
    loc beta j a k b l c 2 a d 9
    
    ifin `alpha' = `beta'
    
    di "`r(matches)'"
    a a b c d
    
    
