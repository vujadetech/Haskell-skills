
data Expr = Val Int | Add Expr Expr

value :: Expr -> Int
--value (Val n) = n
--value (Add x y) = value x + value y
value e = eval e []

type Cont = [Op]
data Op = EVAL Expr | ADD Int --deriving (Show)

eval (Val n)   c = exec c n
eval (Add x y) c = eval x (EVAL y : c)

exec []           n = n
exec (EVAL y : c) n = eval y (ADD n : c)
exec (ADD  n : c) m = exec c (n + m)

-- 3, balanced

-- Note: This defn of tree forbids a null subtree.
-- data Tree a = Leaf a | Node (Tree a) a (Tree a) deriving (Show)
data Tree a = NullT | Leaf a | Node (Tree a) a (Tree a) deriving (Show)

t :: Tree Int
t = Node (Node (Leaf 1) 3 (Leaf 4)) 5
  (Node (Leaf 6) 7 (Leaf 9))

t2 :: Tree Integer
t2 = (Node NullT 7 (Leaf 42))

num_leaves :: Tree a -> Integer
num_leaves NullT        = 0
num_leaves (Leaf _)     = 1
num_leaves (Node l x r) = num_leaves l + num_leaves r

balanced :: Tree a -> Bool
balanced NullT    = True
balanced (Leaf _) = True
balanced (Node l x r)
  | (abs $ (num_leaves l) - (num_leaves r)) > 1 = False
  | otherwise = (balanced l) && (balanced r)

split_list_in_half xs =
  let n = length xs
      k = (quot n 2)
  in [(take k xs), (drop k xs)]

-- split into parts that are all length <= k
split_list xs k =
  let front = take k xs
      rest  = drop k xs
      split_rest = if (length rest < k) then [rest] else split_list rest k
  in front : split_rest

-- 4. balance : (x:xs) -> balanced Tree
balance [] = NullT
balance (x1:xs)
  | (xs == [])        = Leaf x1
  | (xs == [x2])      = Node NullT x1 (Leaf x2)
  | (xs == [x2, x3])  = Node (Leaf x1) x2 (Leaf x3)
  | otherwise         = Leaf 42
  where x2 = xs !! 0
        x3 = xs !! 1
