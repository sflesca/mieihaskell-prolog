import Data.Bool (Bool)
import Data.Bits (Bits(xor))


and1 :: [Bool] ->Bool
and1 = foldr (&&) True

and2 :: [Bool] ->Bool
and2 [] = True
and2 (x:xs) = x && and2 xs

flatten1 :: [[a]] -> [a]
flatten1 = foldr (++) []

flatten :: [[a]] -> [a]
flatten [] = []
flatten (x:xs) = x ++ flatten xs

replicate1 :: Int -> a -> [a]
replicate1 0 _ = []
replicate1 n x = [x] ++ replicate1 (n-1) x

replicate2 :: Int -> a -> [a]
replicate2 n x = [x | y<-[1..n]]

(!!) :: [a] -> Int -> a
[] !! _ = error "e che cavolo"
(x:xs) !! 0 = x
(x:xs) !! n = xs Main.!! (n-1)

elem2 :: Eq a => a-> [a] -> Bool
elem2 _ [] = False
elem2 x (y:xs) = (x==y) || (elem2 x xs)

elem1 :: Eq a => a-> [a] -> Bool
elem1 _ [] = False
elem1 x (y:xs) 
        | x==y = True
        | otherwise elem1 x xs

