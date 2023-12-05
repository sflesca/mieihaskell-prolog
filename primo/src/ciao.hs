sommeCoppie :: [Int] -> [(Int, Int)]
sommeCoppie lista = sommeCoppieAux 0 (sum lista) lista
  where
    sommeCoppieAux _ _ [] = []
    sommeCoppieAux precSum succSum (x:xs) =
      let nuovoPrecSum = precSum + x
          nuovoSuccSum = succSum - x
      in (precSum, nuovoSuccSum) : sommeCoppieAux nuovoPrecSum nuovoSuccSum xs

scalare [] [] = 0
scalare (x:xs) (y:ys) = x*y+ scalare xs ys
scalare xs ys = error "bho"
