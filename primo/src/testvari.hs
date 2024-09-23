combinations :: Int -> [a] -> [[a]]
combinations _ [] =  []
combinations k (x:xs)  = crealiste k x (x:xs) ++ combinations k xs



crealiste :: Int -> a -> [a] -> [[a]]
crealiste _ _ [] = []
crealiste k x (y:ys) = creasottolista k (x:ys) : crealiste k x ys



creasottolista :: Int -> [a] -> [a]
creasottolista k xs = if length xs >= k  then take k xs else []