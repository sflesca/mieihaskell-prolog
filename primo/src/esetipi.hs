data Nat = Zero | Succ Nat
    deriving (Show)

nat2int :: Nat -> Int
nat2int Zero     = 0
nat2int (Succ n) = 1 + nat2int n

int2nat :: Int -> Nat
int2nat 0 = Zero
int2nat n = Succ (int2nat (n-1))


add :: Nat -> Nat -> Nat
add Zero     n = n
add (Succ m) n = Succ (add m n) 

mult :: Nat -> Nat -> Nat
mult m Zero = Zero
mult m (Succ n) = add m (mult m n)

data Expr = Val Int | Add Expr Expr | Mul Expr Expr
    deriving Show

folde :: (Int->Int) -> (Int->Int->Int) -> (Int->Int->Int) -> Expr -> Int
folde f g h (Val n) = f n
folde f g h (Add e1 e2) = g (folde f g h e1) (folde f g h e2)
folde f g h (Mul e1 e2) = h (folde f g h e1) (folde f g h e2)

exp1::Expr
exp1 = Add (Val 10) (Mul (Add (Val 2) (Val 3)) (Val 4))


data Tree a = Leaf a | Node a (Tree a) (Tree a)
    deriving Show
