
fusion :: (a1 -> Bool) -> (a2 -> a1) -> [a2] -> [a1]
fusion p f xs = filter p (map f xs)

fusion1 :: (a1 -> Bool) -> (a2 -> a1) -> [a2] -> [a1]
fusion1 p f = foldr (\x xs -> if p (f x) then f x : xs else xs) []