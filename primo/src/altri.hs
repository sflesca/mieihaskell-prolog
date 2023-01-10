data Person = Person String deriving Show
data Figlio = Figlio String String deriving Show

-- Esempio di uso -- nongenitore [Person "io", Person "tu"] [(Figlio "io" "tu")]
nongenitore :: [Person] -> [Figlio] -> [Person]
nongenitore [] fs = []
nongenitore (p:ps) fs
                    | not (presente p fs) = (p:(nongenitore ps fs))
                    | otherwise = nongenitore ps fs

presente :: Person -> [Figlio] -> Bool
presente p [] = False
presente (Person x) ((Figlio y z):fs)
                        | x==y = True
                        | otherwise = presente (Person x) fs

genitoriprolifici:: [Person] -> [Figlio] -> [Person]
genitoriprolifici [] fs = []
genitoriprolifici ps fs = map fst (filtraMinoriUguali ps fs)

filtraMinoriUguali :: [Person] -> [Figlio] -> [(Person, Int)]
filtraMinoriUguali [] fs = []
filtraMinoriUguali ((Person x):ps) fs = filter (\(Person p,y) -> not (esisteMaggiore (numfigli ((Person x):ps) fs) (Person p,y))) (numfigli ((Person x):ps) fs)

numfigli :: [Person] -> [Figlio] -> [(Person, Int)]
numfigli ps fs = map (\ p -> (p, countParent p fs)) ps

countParent :: Person -> [Figlio] -> Int
countParent (Person x) [] = 0
countParent (Person x) ((Figlio y _):fs)
                                | x==y = 1+countParent (Person x) fs
                                | otherwise = countParent (Person x) fs

esisteMaggiore ::  [(Person, Int)] -> (Person, Int) -> Bool
esisteMaggiore [] _ = False
esisteMaggiore (((Person x),i):xs) ((Person y),j)
                                        | x/=y && i>j = True
                                        | otherwise = esisteMaggiore xs ((Person y),j)

-- Node (Node (Leaf 1) (Leaf 2)) (Leaf 3)
data Tree a = Leaf a | Node (Tree a) (Tree a)

leaves :: Tree a -> [a]
leaves (Leaf a) = [a]
leaves (Node t1 t2) = leaves t1++ leaves t2

size :: Tree a -> Int
size t = length (leaves t)