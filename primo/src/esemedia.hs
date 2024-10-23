encode :: Eq a => [a] -> [(a, Int)]
encode [] = []
encode (x:xs) = (x, length (takeWhile(== x) (x:xs))) : encode (dropWhile(== x) xs)

encode1:: Eq a => [a] -> [(a, Int)]
encode1 = map (\xs-> (head xs, length xs)) . group

group :: Eq a => [a] -> [[a]]
group [] = []
group (x:xs) =  let (first, rest) = span (== x) xs
                in (x:first) : group rest


ff :: (Eq a, Num b) => a -> [(a, b)] -> [(a, b)]
ff x [ ] = [(x,1)]
ff x ((y,n):ys) 
    | x==y = ((y,n+1):ys)
    | otherwise = (x,1):((y,n):ys)

encode3 :: Eq a => [a] -> [(a, Integer)]
encode3 = foldr ff []

data Tree a = Empty | Node a (Tree a) (Tree a)
    deriving Show

isBalanced:: Tree a -> Bool
isBalanced Empty = True
isBalanced (Node _ left right) = abs (height left -height right) <= 1 && isBalanced left && isBalanced right

height :: Tree a -> Int
height Empty = 0
height (Node _ left right) = 1 + max (height left) (height right)

data Zipper a = Zipper [a] a [a] deriving Show

tozipper :: [a] -> Zipper a
tozipper (x:xs) = Zipper [] x xs

moveLeft :: Zipper a -> Maybe (Zipper a)
moveLeft (Zipper (l:ls) focus rs) = Just (Zipper ls l (focus:rs))
moveLeft (Zipper [] _ _) = Nothing

moveRight :: Zipper a -> Maybe (Zipper a)
moveRight (Zipper ls focus (r:rs)) = Just (Zipper (focus:ls) r rs)
moveRight (Zipper _ _ []) = Nothing


insert :: a -> Zipper a -> Zipper a
insert newElement (Zipper ls focus rs) = Zipper ls newElement (focus:rs)

delete :: Zipper a -> Maybe (Zipper a)
delete (Zipper ls _ (r:rs)) = Just (Zipper ls r rs)
delete (Zipper (l:ls) _ []) = Just (Zipper ls l [])
delete (Zipper [] _ []) = Nothing