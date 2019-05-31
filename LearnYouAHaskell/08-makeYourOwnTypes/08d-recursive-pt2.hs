infixr 5 :-:
data List a = Empty | a :-: (List a) deriving (Show, Read, Eq, Ord)

xs = 3 :-: 4 :-: 5 :-: Empty

-- In case you need to write some Lisp in Haskell, lol:
car (x :-: _ ) = x
cdr (_ :-: xs) = xs

infixr 5  .++
(.++) :: List a -> List a -> List a
Empty .++ ys = ys
(x :-: xs) .++ ys = x :-: (xs .++ ys)

a = 3 :-: 4 :-: 5 :-: Empty
b = 6 :-: 7 :-: Empty
c = a .++ b

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

data TrafficLight = Red | Yellow | Green

instance Eq TrafficLight where
  Red == Red = True
  Green == Green = True
  Yellow == Yellow = True
  _ == _ = False

instance Show TrafficLight where
  show Red = "Red light"
  show Yellow = "Yellow light"
  show Green = "Green light"

tl = [Red, Yellow, Green]

class YesNo a where
  yesno :: a -> Bool

instance YesNo Int where
  yesno 0 = False
  yesno _ = True

instance YesNo [a] where
  yesno [] = False
  yesno _ = True

instance YesNo Bool where
  yesno = id

instance YesNo (Maybe a) where
  yesno (Just _) = True
  yesno Nothing = False

instance YesNo (Tree a) where
  yesno EmptyTree = False
  yesno _ = True

instance YesNo TrafficLight where
  yesno Red = False
  yesno _ = True

yesnoIf :: (YesNo y) => y -> a -> a -> a
yesnoIf yesnoVal yesResult noResult = if yesno yesnoVal then yesResult else noResult

-- The Functor typeclass
--class Functor f where
--  fmap :: (a -> b) -> f a -> f b
{- These have conflicts with the prelude:
instance Functor [] where
  fmap = map

instance Functor Maybe where
  fmap f (Just x) = Just (f x)
  fmap f Nothing = Nothing

instance Functor Tree where
  fmap f EmptyTree = EmptyTree
  fmap f (Node x leftsub rightsub) = Node (f x) (fmap f leftsub) (fmap f rightsub)

instance Functor (Either a) where
  fmap f (Right x) = Right (f x)
  fmap f (Left x) = Left x

data Either a b = Left a | Right b
-}

-- TODO: Review the rest of this again.
class Tofu t where
  tofu :: j a -> t a j

data Frank a b  = Frank {frankField :: b a} deriving (Show)
f1 = Frank {frankField = Just "HAHA"}

instance Tofu Frank where
  tofu x = Frank x

tf1 = tofu (Just 'a') :: Frank Char Maybe
tf2 = tofu ["HELLO"] :: Frank [Char] []

data Barry t k p = Barry { yabba :: p, dabba :: t k }
instance Functor (Barry a b) where
  fmap f (Barry {yabba = x, dabba = y}) = Barry {yabba = f x, dabba = y}

{-
data Mod2 = Mod2 Int -- deriving (Show)
instance Eq Mod2 where
  mod2 :: (Mod2 x) -> Bool
  (mod x 2) == (mod x 2) = true
  _ == _ = False
-}

-- misc
--data Stinky = Maybe Int | Nothing
--data Bool = False | True deriving (Ord)
