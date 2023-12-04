sommeCoppie :: [Int] -> [(Int, Int)]
sommeCoppie lista = sommeCoppieAux 0 (sum lista) lista
  where
    sommeCoppieAux _ _ [] = []
    sommeCoppieAux precSum succSum (x:xs) =
      let nuovoPrecSum = precSum + x
          nuovoSuccSum = succSum - x
      in (precSum, nuovoSuccSum) : sommeCoppieAux nuovoPrecSum nuovoSuccSum xs


