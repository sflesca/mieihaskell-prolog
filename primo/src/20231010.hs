
pyths :: (Integral c) => c -> [(c, c, c)]
pyths n = [(x,y, z) | x <- [1..n], y<-[1..n], z<-[1..n], x^2+y^2 == z^2]

factors :: Integral a => a -> [a]
factors n = [x | x <-[1..n], n `mod` x == 0]

perfects :: Integral a => a -> [a]
perfects n = [x | x <- [1..n], sum (init (factors x)) == x]

prodscalare :: Num a => [a] -> [a] -> a
prodscalare xs ys = sum ([x * y | (x, y) <- zip xs ys])

safetail :: Eq a => [a] -> [a]
safetail xs = if null xs then [] else tail xs

safetail1 :: [a] -> [a]
safetail1 [] = []
safetail1 (x:xs) = xs

safetail2 :: Eq a1 => [a1] -> [a1]
safetail2 xs | null xs = []
             | otherwise = tail xs

