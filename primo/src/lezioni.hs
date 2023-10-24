
safetail :: Eq a => [a] -> [a]
safetail xs = if xs == [] then [] else tail xs

safetail1 :: [a] -> [a]
safetail1 [] = []
safetail1 (x:xs) = xs

safetail2 :: Eq a1 => [a1] -> [a1]
safetail2 xs | xs == [] = []
             | otherwise = tail xs

sumlength1 :: [Int] -> (Int,Int)
sumlength1 xs = (sum xs, length xs)

sumlength2 :: [Int] -> (Int,Int)
sumlength2 = foldr (\n (x, y) -> (n + x, 1 + y)) (0, 0)

map1 :: (a -> b) -> [a] -> [b]
map1 f = foldr (\x xs -> f x : xs) []

filter1 :: (a -> Bool) -> [a] -> [a]
filter1 p = foldr (\x xs -> if p x then x:xs else xs) []


primes :: [Int]
primes = sieve [2..]

sieve :: [Int] -> [Int]
sieve (p:xs) =
    p : sieve [x | x <- xs, mod x p /= 0]


twin :: (Int,Int) -> Bool
twin (x,y) = y == x+2

twins :: [(Int,Int)]
twins = filter twin (zip primes (tail primes))

