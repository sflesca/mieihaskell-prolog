myLast1 :: [a] -> a
myLast1 [] = error "La lista è vuota"
myLast1 [x] = x
myLast1 (_:xs) = myLast1 xs

myLast2 :: [a] -> a
myLast2 [] = error "La lista è vuota"
myLast2 xs = xs !! (length xs - 1)

myLast3 :: [a] -> a
myLast3 [] = error "La lista è vuota"
myLast3 xs = head (reverse xs)

init1 :: [a] -> [a]
init1 [] = error "La lista è vuota"
init1 [x] = []
init1 (x:xs) = x : init1 xs


init2 :: [a] -> [a]
init2 [] = error "init': empty list"
init2 xs = reverse (tail (reverse xs))



init3 :: [a] -> [a]
init3 [] = error "init': empty list"
init3 xs = take (length xs - 1) xs




incremento :: Num a => a -> a
incremento x = x + 1

sommamia :: Num a => a -> a -> a
sommamia x y = x + y
