

quadratipiccoli :: (Num a, Ord a) => [a] -> [a]
quadratipiccoli xs = filter (<1000) (map (^2) xs)





miaconcat :: [a] -> [a] -> [a]
miaconcat xs ys = foldr (:) ys xs



fusion :: (a1 -> Bool) -> (a2 -> a1) -> [a2] -> [a1]
fusion p f myxs = filter p (map f myxs)

fusion1 :: (a1 -> Bool) -> (a2 -> a1) -> [a2] -> [a1]
fusion1 p f = foldr (\x xs -> if p (f x) then f x : xs else xs) []