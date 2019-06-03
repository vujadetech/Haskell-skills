
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
