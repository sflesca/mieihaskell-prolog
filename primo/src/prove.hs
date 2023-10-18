delete :: Int -> [Int] -> [Int]
delete _ [] = []
delete x lista = takeWhile (\y -> y /= x) lista ++ [x] ++ resto x lista

resto:: Int -> [Int] -> [Int]
resto _ [] = []
resto x (y:ys) 
    | y == x = filter(\z -> z /=x) ys
    | otherwise = resto x ys