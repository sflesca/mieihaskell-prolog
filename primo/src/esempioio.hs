import Data.Char ( toUpper )
import Data.List ( intersperse )
import Control.Monad (liftM, ap)

fmaptest :: IO ()
fmaptest = do
    line <- fmap (intersperse '-' . reverse . map toUpper) getLine
    putStrLn line


echoReverse :: IO ()
echoReverse =
    getLine >>= \aLine -> putStrLn (reverse aLine)

g :: Integer -> (Float, Integer)
g seed = (fromInteger(newSeed)/fromInteger(m), newSeed)
    where
        newSeed = (seed*a) `mod` m
        a = 1812433253
        m = 2^32

initialSeed :: Integer
initialSeed = 3121281023


newtype RandomGenerator a = Ran (Integer -> (a, Integer))
random :: RandomGenerator Float
random = Ran g
generate :: RandomGenerator c -> c
generate (Ran f) = (fst.f) initialSeed

type R = RandomGenerator

instance Functor RandomGenerator where
  fmap = liftM

instance Applicative RandomGenerator where
  pure  = return
  (<*>) = ap

instance Monad RandomGenerator where
    return x = Ran (\seed -> (x, seed))
    (Ran g0) >>= f = Ran (\seed ->
        let (y, seed1) = g0 seed
            (Ran g1) = f y
        in g1 seed1)

randoms3 :: RandomGenerator (Float, Float, Float)
randoms3 = do
    a <- random
    b <- random
    c <- random
    return (a,b,c)

result3 :: (Float, Float, Float)
result3 = generate randoms3

randomList 0 = return []
randomList n = do
    x <- random
    xs <- randomList (n-1)
    return (x:xs)

resultList :: [Float]
resultList = generate (randomList 17)