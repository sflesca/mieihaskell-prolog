coppie :: [Int] -> [(Int, Int)]
coppie lista = coppieAux 0 (sum lista) lista
  where
    coppieAux _ _ [] = []
    coppieAux precSum succSum (x:xs) =
      let nuovoPrecSum = precSum + x
          nuovoSuccSum = succSum - x
      in (precSum, nuovoSuccSum) : coppieAux nuovoPrecSum nuovoSuccSum xs


scalare :: [Int] -> [Int] -> Int
scalare [] [] = 0
scalare (x:xs) (y:ys) = x*y+ scalare xs ys
scalare xs ys = error "liste di lunghezza diversa: non deve succedere"


selectElementsByIndices :: [Int] -> [a] -> [a]
selectElementsByIndices indices list = map (\i -> list !! i) (filter (<length(list)) indices)

combinations :: Int -> [a] -> [[a]]
combinations 0 _ = [[]]  -- Combinazione di lunghezza 0 è una lista vuota
combinations _ [] = []    -- Combinazione con una lista vuota è sempre vuota
combinations k (x:xs) = combinations k xs ++ map (x:) (combinations (k-1) xs)

combinationNoDup :: Eq a => Int -> [a] -> [[a]]
combinationNoDup k xs = combinations k (removedups xs)


removedups :: Eq a=> [a] -> [a]
removedups [] = []
removedups (x:xs) = x:removedups (removeall x xs)

removeall :: Eq t=> t -> [t] -> [t]
removeall x [] = []
removeall x (y:xs) | x==y = removeall x xs
                   | otherwise = y:removeall x xs
