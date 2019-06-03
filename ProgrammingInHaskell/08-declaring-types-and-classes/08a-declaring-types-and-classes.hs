
-- 8.2

data Shape = Circle Float | Rect Float Float deriving (Show)

square :: Float -> Shape
square n = Rect n n

area :: Shape -> Float
area (Circle r) = pi * r^2
area (Rect x y) = x * y

safediv _ 0 = Nothing
safediv x y = Just (/ x y)

safehead [] = Nothing
safehead xs = Just $ head xs

-- 8.3 Newtype
newtype NatInt = N Int

-- 8.4 Recursive
data Nat = Zero | Succ Nat deriving (Show)

add :: Nat -> Nat -> Nat
add Zero n = n
-- add n Zero  = n -- Note: this won't work
add (Succ m) n = add m (Succ n)

one = Succ Zero
two = Succ one

data List a = Nil | Cons a (List a) deriving (Eq)
instance Show (List a) where
  show Nil = "NILL"
  --show (Cons x Nil) = x
  --show (Cons x xs) = (show x) ++ (show xs)

l1 = (Cons 1 (Cons 2 Nil))
l2 = (Cons 1 (Cons 2 Nil))

{-
instance Eq (List a) where
  Nil == Nil  = True
  (Cons x Nil) == (Cons y Nil)
    | (x /= y) = False
    | otherwise = (xs == ys)
-}

data Tree a = Leaf a | Node (Tree a) a (Tree a) deriving (Show)

t :: Tree Int
t = Node (Node (Leaf 1) 3 (Leaf 4)) 5
  (Node (Leaf 6) 7 (Leaf 9))

-- occurs x t
occurs x (Leaf y) = (x == y)
occurs x (Node left y right) = x == y || occurs x left || occurs x right

flatten :: Tree a -> [a]
flatten (Leaf x) = [x]
flatten (Node l x r) = flatten l ++ [x] ++ flatten r

-- occurs, binary search version
occurs_bin x (Leaf y) = x == y
occurs_bin x (Node l y r)
  | x == y    = True
  | (x < y)   = occurs_bin x l
  | otherwise = occurs_bin x r

-- 8.5
{-
class Eq a where
  (==), (/=) :: a -> a -> Bool
  x /= y = not (x == y)
-}
