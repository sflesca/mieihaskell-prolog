convertiLista:: Integral a => [[a]] -> [a]
convertiLista = map maximum

data BoolExpr = MioTrue | MioFalse | MioAnd BoolExpr BoolExpr  | MioOr BoolExpr BoolExpr | MioNot BoolExpr 
eval :: BoolExpr -> Bool
eval MioTrue = True
eval MioFalse = False
eval (MioAnd e1 e2) = eval e1 && eval e2
eval (MioOr e1 e2) = eval e1 || eval e2
eval (MioNot e) = not (eval e)