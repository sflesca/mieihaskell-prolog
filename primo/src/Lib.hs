module Lib
    ( someFunc,accumulate
    ) where

someFunc :: IO ()
someFunc = putStrLn "Ciao"

accumulate :: (t1 -> t1 -> t1) -> t1 -> [t1] -> t1
accumulate f i [] = i
accumulate f i (x:xs) = f x (accumulate f i xs)

factors :: Integral a => a -> [a]
factors n = [x | x <-[1..n], n `mod` x == 0]

perfects :: Integral a => a -> [a]
perfects n = [x | x <- [1..n], sum (init (factors x)) == x]

