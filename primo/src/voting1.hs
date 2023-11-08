{-# LANGUAGE InstanceSigs #-}
import Data.List

data Vote = Red | Blue | Green
    deriving (Eq, Ord, Show, Read)


data VotiPresi  = Esito Vote Int
    deriving (Eq, Show)

toVote :: VotiPresi -> Vote
toVote (Esito v _ ) = v

instance Ord VotiPresi where
    compare :: VotiPresi -> VotiPresi -> Ordering
    compare (Esito v1 n1) (Esito v2 n2) | n1>n2                 = LT
                                        | n1 == n2 && v1 > v2   = LT
                                        | otherwise             = GT


count :: Eq a => a -> [a] -> Int
count x []  = 0
count x (y:ys)  | x==y      = 1+ count x ys
                | otherwise = count x ys


countwithfoldr :: (Foldable t, Eq a1, Num a2) => a1 -> t a1 -> a2
countwithfoldr x = foldr (\y c -> if x==y then c+1 else c) 0


removedup :: Eq a => [a] -> [a]
removedup []        = []
removedup (x:xs)    = x : filter (/=x) (removedup xs)

computepoll :: [Vote] -> [VotiPresi]
computepoll vs  = [Esito v (count v vs) | v <- removedup vs]


winner :: [Vote] -> Vote
winner vs = let Esito v n = minimum (computepoll vs)
            in v

looser :: [Vote] -> Vote
looser vs = let Esito v n = maximum (computepoll vs)
            in v


rmempty :: Eq a => [[a]] -> [[a]]
rmempty = filter (/= [])

elim :: Eq a => a -> [[a]] -> [[a]]
elim x = map (filter (/= x))


rank :: [[Vote]] -> [Vote]
rank = map toVote . reverse . sort . computepoll . map head

winner1 :: [[Vote]] -> Vote
winner1 bs =   case rank (rmempty bs) of
                [c]     -> c
                (c:cs) -> winner1 (elim c bs)
                []-> error "non deve succedere"

votes :: [Vote]
votes = [Red, Blue, Blue, Blue, Red, Red]

votipresitotali :: [VotiPresi]
votipresitotali = [Esito Red 3, Esito Green 1, Esito Blue 3]

ballots :: [[Vote]]
ballots = [[Red, Green],
           [Blue],
           [Green, Red, Blue],
           [Blue, Green, Red],
           [Green]]