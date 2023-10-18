zipTutto :: [Int] -> [Int] -> [(Int,Int)]
zipTutto [] [] = []
zipTutto []     (y:ys)      = (0,y) : zipTutto [] ys
zipTutto (x:xs)      []     = (x,0) : zipTutto xs []
zipTutto (x:xs) (y:ys) = (x,y) : zipTutto xs ys


and1 :: [Bool] -> Bool
and1 [] = True
and1 (x:xs)  | x         = and1 xs
             | otherwise  = False

and2 :: [Bool] -> Bool
and2 [] = True
and2 (x:xs)  = x && and2 xs

replicate1 ::  Int -> a -> [a]
replicate1 0 _ = []
replicate1 n x = x: replicate1 (n-1) x

elem1 :: Eq t => t -> [t] -> Bool
elem1 x [] = False
elem1 x (y:ys) = x==y || elem1 x ys

merge :: Ord a => [a] -> [a] -> [a]
merge [] ys = ys
merge xs [] = xs
merge (x : xs) (y : ys) =
  if x <= y
    then x : merge xs (y : ys)
    else y : merge (x : xs) ys