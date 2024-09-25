subsequences :: [a] -> [[a]]
subsequences []     = [[]]
subsequences (x:xs) = subsequences xs ++ map (x:) (subsequences xs)

subsetsum :: Int -> [Int] -> [[Int]]
subsetsum x s = filter (\sub -> sum sub == x) (subsequences s)