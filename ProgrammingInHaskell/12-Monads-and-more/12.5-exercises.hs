

-- Ex 1

-- original
data Tree a = Leaf a | Node (Tree a) (Tree a) deriving Show

instance Functor Tree where
  fmap g (Leaf x)     = Leaf (g x)
  fmap g (Node l r) = (Node (fmap g l) (fmap g r))

-- TreedD is a tree with a data node. To see one you need TreeD glasses.
data TreeD a = LeafD | NodeD (TreeD a) a (TreeD a) deriving Show

t1 = LeafD
t2 = NodeD LeafD 42 LeafD

instance Functor TreeD where
  fmap g LeafD          = LeafD
  fmap g (NodeD l x r)  = NodeD (fmap g l) (g x) (fmap g r)
