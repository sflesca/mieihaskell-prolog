merge :: Ord a => [a] -> [a] -> [a]
merge [] ys = ys
merge xs [] = xs
merge (x : xs) (y : ys) =
  if x <= y
    then x : merge xs (y : ys)
    else y : merge (x : xs) ys

splitAt' :: Int -> [a] -> ([a], [a])
splitAt' 0 ys = ([], ys)
splitAt' _ [] = ([], [])
splitAt' n (y : ys)
  | n < 0 = ([], (y : ys))
  | otherwise = ((y : a), b)
  where
    (a, b) = splitAt' (n - 1) ys

halve :: [a] -> ([a], [a])
halve xs = splitAt (length xs `div` 2) xs

msort :: Ord a => [a] -> [a]
msort [] = []
msort [x] = [x]
msort xs = merge (msort ys) (msort zs)
  where
    (ys, zs) = halve xs
