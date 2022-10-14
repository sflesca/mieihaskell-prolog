import Data.List

data Vote = Red | Blue | Green
    deriving (Eq, Ord, Show, Read)


data VotiPresi  = Esito Vote Int
    deriving (Eq, Show)

instance Ord VotiPresi where
    compare (Esito v1 n1) (Esito v2 n2) | n1>n2                 = LT
                                        | n1 == n2 && v1 > v2   = LT
                                        | otherwise             = GT


count :: Eq a => a -> [a] -> Int
count x []  = 0
count x (y:ys)  | x==y      = 1+ count x ys
                | otherwise = count x ys

removedup :: Eq a => [a] -> [a]
removedup []        = []
removedup (x:xs)    = x : filter (/=x) (removedup xs)

computepoll :: [Vote] -> [VotiPresi]
computepoll vs  = [Esito v (count v vs) | v <- removedup vs]


winner :: [Vote] -> Vote
winner vs = let Esito v n = minimum (computepoll vs)
            in v


votes :: [Vote]
votes = [Red, Blue, Green, Blue, Blue, Red]

votipresitotali :: [VotiPresi]
votipresitotali = [Esito Red 3, Esito Green 1, Esito Blue 3]