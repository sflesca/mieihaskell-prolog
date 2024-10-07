prefixes :: [a] -> [[a]]
prefixes []     = []
prefixes (x:xs) = [x] : map (x:) (prefixes xs)

prefixes1 :: [a] -> [[a]]
prefixes1 = foldr (\el acc -> [el] : map(el :) acc) []