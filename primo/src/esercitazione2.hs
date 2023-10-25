
seq1 :: (Ord a) => [a] -> [[a]]
seq1 [] = [[]]  -- La lista vuota ha una sottosequenza vuota
seq1 [x] = [[x]]  -- Una lista con un solo elemento ha solo una sottosequenza
seq1 (x:xs) = subseq [x] xs
    where
        subseq acc [] = [acc]  -- Fine della lista, nessuna nuova sottosequenza
        subseq acc (y:ys)
            | y >= last acc = subseq acc' ys  -- Aggiungi a sottosequenza corrente
            | otherwise = acc : subseq [y] ys  -- Avvia una nuova sottosequenza
            where
                acc' = acc ++ [y]  -- Aggiungi il nuovo elemento alla sottosequenza corrente


isEmpty :: [a] -> Bool
isEmpty [] = True
isEmpty _ = False

seq2 :: (Eq a, Ord a) => [a] -> [[a]]
seq2 = foldr (\x ~(y:r) -> if (not (isEmpty y) && x > head y) then ([x]:y:r) else ((x:y):r)) [[]]

maximumBy1 :: (a -> a -> Ordering) -> [a] -> a
maximumBy1 _ [] = error "Lista vuota"
maximumBy1 cmp (x:xs) = go x xs
  where
    go maxVal [] = maxVal
    go maxVal (y:ys)
      | cmp y maxVal == GT = go y ys
      | otherwise = go maxVal ys

compareOnLength :: [a] -> [a] -> Ordering
compareOnLength x y
  | length x < length y  = LT
  | length x == length y = EQ
  | otherwise            = GT

maxIncreasingSubsequence :: (Ord a) => [a] -> [a]
maxIncreasingSubsequence = maximumBy1 compareOnLength . seq1
