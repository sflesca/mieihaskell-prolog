echoReverse :: IO ()
echoReverse = getLine >>= \aLine -> putStr (reverse aLine)

echoReverse1 = do
    aLine <- getLine
    putStrLn (reverse aLine)

