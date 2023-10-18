minOdd :: [Int] -> (Int, Int)
minOdd [] = (maxBound::Int,maxBound::Int)
minOdd (x : xs) | mod x 2 == 1 = let (y,z) = minOdd xs in
                        if x<y then (x,y)
                        else if x<z
                        then (y,x) else (y,z)
                | otherwise    = minOdd xs

partialSums :: Num a => [a] -> [a]
partialSums (x:xs) = x : map (+ x) (partialSums xs)
partialSums []     = []

partialSums1 :: Num a => [a] -> [a]
partialSums1 (x:xs) = x : map (+ x) (xs)
partialSums1 []     = []

listWithPartialSums :: Num b => [b] -> [(b, b)]
listWithPartialSums xs = zip xs (partialSums xs)

shiftToZero :: (Num a, Ord a) => [a] -> [a]
shiftToZero [] = []
shiftToZero xs = map ((-minimum xs)+ ) xs


data  BST a = Void | Node a (BST a ) (BST a ) deriving (Eq, Ord, Read, Show)

somma :: (Num a) => BST a -> a
somma Void = 0
somma (Node x sn ds) = x + somma sn + somma ds

samesums :: (Num a, Eq a) => [BST a] -> Bool
samesums [] = True
samesums xs = allequals (map somma xs)

allequals :: (Num a, Eq a) => [a] -> Bool
allequals [] = True
allequals (x:xs) =  all (==x) xs


bstElem :: (Eq t, Ord t) => t -> BST t -> Bool
bstElem x Void = False
bstElem x (Node y sn ds)
            | x==y       = True
            | x < y      = bstElem x sn
            | otherwise  = bstElem x ds

bst1 = Node 1
        Void
        (Node 2
                (Node (4)
                        Void
                        (Node 6 Void Void) )
                (Node (10) Void Void))
