mcm :: Int -> Int -> Int
mcm a b = mcmHelper (max a b)
  where
    mcmHelper x
      | x `mod` a == 0 && x `mod` b == 0 = x
      | otherwise                        = mcmHelper (x + 1)

mcd :: Int -> Int -> Int
mcd a 0 = abs a  
mcd a b = mcd b (a `mod` b)

mcm1 :: Int -> Int -> Int
mcm1 a b = abs (a * b) `div` gcd a b


numgz :: (Ord a1, Num a2, Num a1) => [a1] -> a2
numgz [] = 0
numgz (x:xs) = if x>0 then 1+ numgz xs else numgz xs


sumltx :: (Num t, Ord t) => t -> [t] -> t
sumltx _ [] = 0
sumltx y (x:xs)
    | x<y       = x + sumltx y xs
    | otherwise = sumltx y xs

prodscal :: Num a => [a] -> [a] -> a
prodscal [] _ = 0
prodscal _ [] = 0
prodscal (x:xs) (y:ys) = x*y + prodscal xs ys


isSublist :: Eq a => [a] -> [a] -> Bool
isSublist _ [] = True
isSublist [] _ = False
isSublist xs ys
  | take (length ys) xs == ys = True
  | otherwise = isSublist (tail xs) ys


countSublist :: Eq a => [a] -> [a] -> Int
countSublist [] _ = 0
countSublist xs ys
  | length ys > length xs = 0
  | take (length ys) xs == ys = 1 + countSublist (tail xs) ys
  | otherwise = countSublist (tail xs) ys

sublists :: [a] -> [[a]]
sublists [] = [[]]
sublists xs = []:[ take n (drop i xs) | i <- [0..length xs - 1], n <- [1..length xs - i]]


sublistsNonContigue :: [a] -> [[a]]
sublistsNonContigue [] = [[]]
sublistsNonContigue (x:xs) = (addinhead x (sublistsNonContigue xs)) ++ sublistsNonContigue xs

addinhead :: a -> [[a]] -> [[a]]
addinhead x [] = []
addinhead x (ys:yss) = (x:ys):addinhead x yss

sublistsNonContigue1 :: [a] -> [[a]]
sublistsNonContigue1 [] = [[]]
sublistsNonContigue1 (x:xs) = map (x:) (sublistsNonContigue xs) ++ sublistsNonContigue xs
