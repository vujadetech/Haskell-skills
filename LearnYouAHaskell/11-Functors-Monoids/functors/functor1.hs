--
sq x = x * x
--

data List a = Empty | Cons a (List a) deriving (Show, Read, Eq, Ord)

instance Functor List where
  fmap f Empty = Empty
  fmap f (Cons x xs) = Cons (f x) (fmap f xs)

xs = 3 `Cons` (4 `Cons` (5 `Cons` Empty))
xss = xs `Cons` Empty
ys = Cons 1 $ Cons 2 Empty
zs = fmap sq xs -- Cons 9 (Cons 16 (Cons 25 Empty))



data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)

singleton :: a -> Tree a
singleton x = Node x EmptyTree EmptyTree

treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton x
treeInsert x (Node a left right)
    | x == a = Node x left right
    | x < a  = Node a (treeInsert x left) right
    | x > a  = Node a left (treeInsert x right)

treeElem :: (Ord a) => a -> Tree a -> Bool
treeElem x EmptyTree = False
treeElem x (Node a left right)
    | x == a = True
    | x < a  = treeElem x left
    | x > a  = treeElem x right

nums = [8,6,4,1,7,3,5]
numsTree = foldr treeInsert EmptyTree nums

instance Functor Tree where
  fmap f EmptyTree = EmptyTree
  fmap f (Node x left right) = Node (f x) (fmap f left) (fmap f right)

et = EmptyTree
squaredNumsTree = fmap sq numsTree
