data Tree a = Leaf a | Node a (Tree a) (Tree a)
instance Functor Tree where
    fmap f (Leaf x) = Leaf (f x)
    fmap f (Node x t1 t2) = Node (f x) (fmap f t1) (fmap f t2)

