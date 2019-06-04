

data Tree a = Leaf a | Node (Tree a) (Tree a) deriving Show

instance Functor Tree where
  fmap g (Leaf x)     = Leaf (g x)
  fmap g (Node l r) = (Node (fmap g l) (fmap g r))

t1 = (Leaf 1)
t2 = (Leaf 2)
t3 = (Node t1 t2)

t4 = fmap even t3
