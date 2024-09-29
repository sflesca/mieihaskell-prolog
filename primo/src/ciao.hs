{-# OPTIONS_GHC -Wno-overlapping-patterns #-}
import qualified Data.List
sommeCoppie :: [Int] -> [(Int, Int)]
sommeCoppie lista = sommeCoppieAux 0 (sum lista) lista
  where
    coppieAux _ _ [] = []
    coppieAux precSum succSum (x:xs) =
      let nuovoPrecSum = precSum + x
          nuovoSuccSum = succSum - x
      in (precSum, nuovoSuccSum) : coppieAux nuovoPrecSum nuovoSuccSum xs

scalare :: Num p => [p] -> [p] -> p
scalare [] [] = 0
scalare (x:xs) (y:ys) = x*y+ scalare xs ys
scalare xs ys = error "liste di lunghezza diversa: non deve succedere"

pippo :: [a] -> [a]
pippo = take 3


combinations :: Int->[a]->[[a]]
combinations _ [] = []
combinations 0 _ = []
combinations n (x:xs) = (getAllCombinations n x xs ) ++ (combinations n xs)
      where
            getAllCombinations :: Int->a->[a]->[[a]]
            getAllCombinations n k (y:ys)
                  | length (y:ys)<(n-1) = []
                  | otherwise =  (k: (take (n-1) (y:ys))) :  getAllCombinations n k ys

selectElementByIndices :: Eq a => [Maybe Int] -> [a] -> [a]
selectElementByIndices [] []=[]
selectElementByIndices n l= helper (Data.List.sort n) l []
                                              where helper n l acc=acc
                                                    helper (n:ns) (x:xs) acc
                                                          | n == Data.List.elemIndex x l = acc++[x]
                                                          | otherwise = helper ns xs acc
