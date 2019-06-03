
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
data Tree a = Leaf a | Node (Tree a) a (Tree a) deriving (Show)

t :: Tree Int
t = Node (Node (Leaf 1) 3 (Leaf 4)) 5
  (Node (Leaf 6) 7 (Leaf 9))

num_leaves :: Tree a -> Integer
num_leaves (Leaf _) = 1
num_leaves (Node l x r) = num_leaves l + num_leaves r

balanced :: Tree a -> Bool
balanced (Leaf _) = True
balanced (Node l x r)
  | (abs $ (num_leaves l) - (num_leaves r)) > 1 = False
  | otherwise = (balanced l) && (balanced r)

split_list xs =
  let n = length xs
      k = (quot n 2)
  in [(take k xs), (drop k xs)]

--split_list' xs =


-- 4. balance
--ys = let n = length xs in (take (quot n 2) xs)
