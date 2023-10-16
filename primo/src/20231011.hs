zipTutto :: [Int] -> [Int] -> [(Int,Int)]
zipTutto [] [] = []
zipTutto []     (y:ys)      = (0,y) : zipTutto [] ys
zipTutto (x:xs)      []     = (x,0) : zipTutto xs []
zipTutto (x:xs) (y:ys) = (x,y) : zipTutto xs ys
