prefixes :: [a] -> [[a]]
prefixes []     = []
prefixes (x:xs) = [] : map (x:) (prefixes xs)

prefixes1 :: [a] -> [[a]]
prefixes1 = foldr (\el acc -> [] : map(el :) acc) []