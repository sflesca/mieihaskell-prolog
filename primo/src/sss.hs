data BoolExpr = MioTrue | MioFalse | MioAnd BoolExpr BoolExpr  | MioOr BoolExpr BoolExpr | MioNot BoolExpr 
  deriving (Show, Eq)

evalBoolExpr :: BoolExpr -> Bool
evalBoolExpr MioTrue = True
evalBoolExpr MioFalse = False
evalBoolExpr (MioAnd e1 e2) = evalBoolExpr e1 && evalBoolExpr e2
evalBoolExpr (MioOr e1 e2) = evalBoolExpr e1 || evalBoolExpr e2
evalBoolExpr (MioNot e) = not (evalBoolExpr e)

-- Example usage:
main :: IO ()
main = do
  let expr1 = MioAnd MioTrue (MioOr MioFalse (MioNot MioTrue))
  let expr2 = MioOr (MioAnd MioTrue MioFalse) (MioNot MioFalse)
  
  putStrLn $ "Expression 1 evaluates to: " ++ show (evalBoolExpr expr1)
  putStrLn $ "Expression 2 evaluates to: " ++ show (evalBoolExpr expr2)
  
  -- Test with a more complex expression
  let complexExpr = MioAnd (MioOr MioTrue (MioNot MioFalse)) (MioAnd MioFalse (MioNot MioTrue))
  putStrLn $ "Complex expression evaluates to: " ++ show (evalBoolExpr complexExpr)