import Data.Bits (Bits (xor))

double :: Num a => a -> a
double x = x + x

quadr :: Num a => a -> a
quadr x = double (double x)

fattoriale :: (Num a, Enum a) => a -> a
fattoriale n = product [1 .. n]

average :: Foldable t => t Int -> Int
average ns = sum ns `div` length ns

last1 :: [a] -> a
last1 xs = head (reverse xs)

last2 :: [a] -> a
last2 xs = xs !! (length xs - 1)

last3 xs = head (drop (length xs - 1) xs)

last4 :: Num p => [p] -> p
last4 [] = 0
last4 [x] = x
last4 (x : xs) = last4 xs

reverse2 :: [p] -> [p]
reverse2 [] = []
reverse2 (x : xs) = (reverse2 xs) ++ [x]

pyths :: Int -> [(Int, Int, Int)]
pyths n = [(x, y, z) | x <- [1 .. n], y <- [1 .. n], z <- [1 .. n], x ^ 2 + y ^ 2 == z ^ 2]

factors :: Int -> [Int]
factors n = [x | x <- [1 .. n], n `mod` x == 0]

perfects :: Int -> [Int]
perfects n = [x | x <- [1 .. n], sum (init (factors x)) == x]

prodscalare :: Num a => [a] -> [a] -> a
prodscalare xs ys = sum ([x * y | (x, y) <- zip xs ys])

zipWithMia :: (t1 -> t2 -> a) -> [t1] -> [t2] -> [a]
zipWithMia f xs ys = [f x y | (x, y) <- zip xs ys]

zipMia :: [a] -> [b] -> [(a, b)]
zipMia [] _ = []
zipMia _ [] = []
zipMia (x : xs) (y : ys) = (x, y) : zipMia xs ys

mult :: Num a => a -> a -> a -> a
mult x y z = x * y * z

twice :: (t -> t) -> t -> t
twice f x = f (f x)

andMia :: [Bool] -> Bool
andMia [] = True
andMia (False : _) = False
andMia (_ : xs) = andMia xs

concatMia :: [[a]] -> [a]
concatMia [] = []
concatMia ([] : xss) = concatMia xss
concatMia ((x : xs) : xss) = x : (concatMia (xs : xss))

replicateMia :: Int -> a -> [a]
replicateMia 0 _ = []
replicateMia n x = x : replicateMia (n - 1) x

elemAtMia :: [a] -> Int -> a
elemAtMia [] _ = error "out of range error:empty list"
elemAtMia (x : _) 0 = x
elemAtMia (_ : xs) n = elemAtMia xs (n - 1)

elemFindMia :: Eq a => a -> [a] -> Bool
elemFindMia _ [] = False
elemFindMia x (y:ys)  | x==y = True
                      | otherwise = elemFindMia x ys
