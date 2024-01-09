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
