data Expr = Val Int | Add Expr Expr | Mult Expr Expr deriving (Show)

-- This value is only used for demo purposes before moving on to the abstract machine.
--value :: Expr -> Int
--value e = eval e []
--value (Add x y) = value x + value y

-- value for machine
value :: Expr -> Int
value e = eval e [] -- [EVAL (Val 42)]
-- value calls eval, which then starts the mutual recursion between eval and exec.
-- Reminds me of the SICP eval/apply meta-circular evaluator.

type Cont = [Op] -- CONTrol stack, e.g., [Val 1, Add (Val 1) (Val 2)]
data Op = EVAL_MULT Expr | EVAL_ADD Expr | ADD Int | MULT Int --deriving (Show)

eval :: Expr -> Cont -> Int
-- e.g., eval (Add (Val 1) (Val 2)) [] => 3
eval (Val n)   c  = exec c n
eval (Add x y) c  = eval x (EVAL_ADD y : c)
eval (Mult x y) c = eval x (EVAL_MULT y : c)

exec :: Cont -> Int -> Int
-- e.g., exec (ADD 2 : []) 3 => 5
-- e.g., exec (MULT 2 : []) 3 => 6
exec []           n = n
exec (EVAL_ADD y : c) n = eval y (ADD n : c)
exec (EVAL_MULT y : c) n = eval y (MULT n : c)
exec (ADD  n : c) m = exec c (n + m)
exec (MULT n : c) m = exec c (n * m)

-- Let's get  some machine results
v1 = (Val 42)
v2 = (Val 7)

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

-- split_list_in_half assumes a list with at least 2 elements
split_list_in_half list@(x0:x1:xs) =
  let n = length list
      k = (quot n 2)
  in [(take k list), (drop k list)]

-- split into parts that are all length <= k
split_list xs k =
  let front = take k xs
      rest  = drop k xs
      split_rest = if (length rest < k) then [rest] else split_list rest k
  in front : split_rest

xs = [1..5]
split = split_list xs 3
t0 = balance $ split !! 0
t1 = balance $ split !! 1
balSplit = map balance split

-- 4. balance : (x:xs) -> balanced Tree
-- Mine is longer b/c I accidentally used a different datatype, lol.
-- It's supposed to use
-- data Tree a = Leaf a | Node (Tree a) (Tree a)
-- which would have been a bit simpler, so I just need to learn how to read. :D

make_prefixes x = map (\n -> [1..n]) [1..x]

balance [] = NullT
balance list@(x1:xs)
  | (xs == [])        = Leaf x1
  | (xs == [x2])      = Node NullT x1 (Leaf x2)
  | (xs == [x2, x3])  = Node (Leaf x1) x2 (Leaf x3)
  | otherwise         = NullT
  where x2 = xs !! 0
        x3 = xs !! 1

-- make_tree xs
make_tree []        = NullT
make_tree xs
  | (xs == [])      = NullT
  | (xs == [x0])    = Leaf x0
  | (xs == [x0,x1]) = Node (Leaf x0) x1 NullT
  | otherwise       = Node (make_tree l) x0 (make_tree r)
  where [ x0, x1 ] = [ xs !! 0, xs !! 1 ]
        split      = split_list_in_half $ tail xs
        [ l, r ]   = [ split !! 0, split !! 1 ]

balance2 xs = make_tree xs

tenBalancedTrees = map balance2 (make_prefixes 10)
bals = map balanced tenBalancedTrees

-- Ex 5.
--data Expr = Val Int | Add Expr Expr
folde :: (Int -> a) -> (a -> a -> a) -> Expr -> a
folde f g (Val x) = (f x)
folde f g (Add e1 e2) =
  let folde1 = folde f g e1
      folde2 = folde f g e2
  in (g folde1 folde2)

-- Ex 6
size :: Expr -> Int
size (Val _)      = 1
size (Add e1 e2)  = size e1 + size e2

x1 = (Val 42)
x2 = (Val 7)
x3 = (Val 3)
e4 = (Add x1 x2)

-- eval for ex 6 since eval in namespace above
eval6 :: Expr -> Int
eval6 = folde id (+)

-- Ex 9 abstract machine mult
{-
data Expr = Val Int | Add Expr Expr | Mult Expr Expr deriving (Show)
data Op = EVAL Expr | ADD Int        --deriving (Show)

eval (Val n)   c = exec c n
eval (Add x y) c = eval x (EVAL y : c)

exec []           n = n
exec (EVAL y : c) n = eval y (ADD n : c)
exec (ADD  n : c) m = exec c (n + m)
-}
--eval (Mult)
