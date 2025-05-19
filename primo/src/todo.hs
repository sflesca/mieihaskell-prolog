permutazioni:: [Int] ->[[Int]]
permutazioni [] = []
permutazioni [a] = [[a]]
permutazioni (x : xs) = ( map (x: ) (permutazioni xs )) ++ (map (++ [x]) (permutazioni xs))