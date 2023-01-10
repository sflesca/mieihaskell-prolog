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