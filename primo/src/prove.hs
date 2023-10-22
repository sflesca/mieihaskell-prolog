{-# LANGUAGE InstanceSigs #-}
delete :: Int -> [Int] -> [Int]
delete _ [] = []
delete x lista = takeWhile (\y -> y /= x) lista ++ [x] ++ resto x lista

resto:: Int -> [Int] -> [Int]
resto _ [] = []
resto x (y:ys) 
    | y == x = filter(\z -> z /=x) ys
    | otherwise = resto x ys

data Maybe1 a = Nothing1 | Just1 a

instance Functor Maybe1 where
    fmap :: (a -> b) -> Maybe1 a -> Maybe1 b
    fmap f (Just1 x) = Just1 (f x)
    fmap f Nothing1 = Nothing1


instance Applicative Maybe1 where
    pure :: a -> Maybe1 a
    pure = Just1
    (<*>) :: Maybe1 (a -> b) -> Maybe1 a -> Maybe1 b
    Nothing1 <*> _ = Nothing1
    (Just1 f) <*> something = fmap f something
