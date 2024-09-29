combinations :: (Eq a) => Int -> [a] -> [[a]]
combinations 0 _ = []
combinations k [] = []
combinations  k (x:xs) | k < (length (x:xs)) = helper k [] (x:xs) ++ filter (\= []) (combinations k xs)
                                    | otherwise        = error " k troppo grande"
                                    where 
                                         helper k [] (x:xs) = if last (insert k [] (x:xs)) \= last xs then insert k [] (x:xs) : insert k [] xs 
                                                                       else insert k [] (x:xs)



insert :: Int -> [a] -> [a] -> [a]
insert 0 curr _ = curr
insert k [] (y:ys) = insert (k-1) [y] ys 
insert k curr ys = insert (k-1) (curr ++ [c]) ys
                           where c = nextElemToAdd curr ys



nextElemToAdd :: [a] -> [a] -> a
nextElemToAdd [] (y:ys) = x
nextElemToAdd xs (y:ys) = if member y xs then nextElemToAdd  xs ys else y

