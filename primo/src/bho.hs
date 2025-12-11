subsequences :: [a] -> [[a]]
subsequences []     = [[]]
subsequences (x:xs) = subsequences xs ++ map (x:) (subsequences xs)

subsetsum :: Int -> [Int] -> [[Int]]
subsetsum x s = filter (\sub -> sum sub == x) (subsequences s)

data AlberoBInt = Vuoto | Nodo Int AlberoBInt AlberoBInt
    deriving (Show, Eq)

sommalivello :: AlberoBInt -> Int -> Int
sommalivello Vuoto _ = 0
sommalivello (Nodo v sx dx) n 
        | n==0 = v
        | n<0 = 0
        | otherwise = sommalivello sx (n-1) + sommalivello dx (n-1)

pathtutto :: Int -> AlberoBInt -> Bool
pathtutto _ Vuoto = False
pathtutto x (Nodo v sx dx)
    | x/=v = False
    | x==v && sx==Vuoto && dx==Vuoto = True
    | otherwise = pathtutto x sx || pathtutto x dx