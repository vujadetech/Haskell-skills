import Data.Either

--
sq x = x * x
--

data List a = Empty | Cons a (List a) deriving (Show, Read, Eq, Ord)

instance Functor List where
  fmap f Empty = Empty
  fmap f (Cons x xs) = Cons (f x) (fmap f xs)
-- This obeys the functor laws since fmap id = id b/c
-- 1) fmap id Empty = Empty and
-- 2) fmap id (Cons x xs) = Cons (id x) (fmap id xs) = (Cons x xs)
-- and the composition law since
-- 1) fmap (f . g) Empty = f (g Empty) = f Empty = Empty and also
--    fmap f (fmap g Empty) = fmap f Empty = Empty.
-- 2) Induction can be used for the composition.
-- (Empty is the base case that was just proven.) Suppose
-- fmap (f . g) xs = fmap f (fmap g xs) as the inductive hypothesis.
-- fmap (f . g) (Cons x xs) = Cons ((f . g) x) (fmap (f . g) xs)
--    = Cons (f (g x)) (fmap f (fmap g xs)) by the inductive hypothesis.
-- fmap f (fmap g (Cons x xs)) = fmap f (Cons (g x) (fmap g xs))
--    = Cons (f (g x)) (fmap f (fmap g xs)). QED.

xs = 3 `Cons` (4 `Cons` (5 `Cons` Empty))
xss = xs `Cons` Empty
ys = Cons 1 $ Cons 2 Empty
zs = fmap sq xs -- Cons 9 (Cons 16 (Cons 25 Empty))

-- Trees

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

-- /Trees

recipRoot 0 = Left "zero"
recipRoot x
  | (x < 0) = Left "negative"
  | otherwise = Right (1 / (sqrt x))

roots = map recipRoot $ [-1..3] ++ [0]
validRoots = rights roots
invalidRoots = lefts roots

-- NOTE:
--either :: (a -> c) -> (b -> c) -> Either a b -> c
