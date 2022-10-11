
safetail :: Eq a => [a] -> [a]
safetail xs = if xs == [] then [] else tail xs

safetail1 :: [a] -> [a]
safetail1 [] = []
safetail1 (x:xs) = xs

safetail2 :: Eq a1 => [a1] -> [a1]
safetail2 xs | xs == [] = []
             | otherwise = tail xs
