keepLast :: Eq a => a -> [a] -> [a]
keepLast x xs = removeAllButLast x xs
  where
    removeAllButLast y ys =
      let rev = reverse ys
          (before, after) = break (== y) rev
      in reverse (y : filter (/= y) (reverse (tail after ++ before)))