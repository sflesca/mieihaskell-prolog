permutations :: [Int] -> [[Int]]
permutations [] = [[]]
permutations xs = [x : ys | x <- xs, ys <- permutations (remove x xs)]
  where
    -- Funzione ausiliaria per rimuovere un elemento dalla lista:
    remove _ [] = []
    remove y (z:zs)
      | y == z    = zs
      | otherwise = z : remove y zs

permutazioni :: [Int] -> [[Int]]
permutazioni [] = []
permutazioni xs = head xs : permutazioni xs ++ [permutazioni (swap xs 0 i) | i <- [1..length xs -1]]


swap :: [Int] -> Int -> Int -> [Int]
swap xs da a = [if i == da then xs !! a else (if i == a then xs !! da else xs !! i) | i <- [0..length xs -1] ]