myLast1 :: [a] -> a
myLast1 [] = error "La lista è vuota"
myLast1 [x] = x
myLast1 (_:xs) = myLast1 xs

myLast2 :: [a] -> a
myLast2 [] = error "La lista è vuota"
myLast2 xs = xs !! (length xs - 1)

init1 :: [a] -> [a]
init1 [] = error "La lista è vuota"
init1 [x] = []
init1 (x:xs) = x : init1 xs

init2 :: [a] -> [a]
init2 [] = error "init': empty list"
init2 xs = reverse (tail (reverse xs))
