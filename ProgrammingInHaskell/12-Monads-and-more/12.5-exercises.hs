

-- Ex 1

-- original
data Tree a = Leaf a | Node (Tree a) (Tree a) deriving Show

instance Functor Tree where
  fmap g (Leaf x)     = Leaf (g x)
  fmap g (Node l r) = (Node (fmap g l) (fmap g r))

-- TreedD is a tree with data node. To see one you need TreeD glasses.
data TreeD a = Leaf | Node (TreeD a) a (TreeD a)
