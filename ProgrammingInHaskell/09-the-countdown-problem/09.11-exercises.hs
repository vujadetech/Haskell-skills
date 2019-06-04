main :: IO ()
main = print (solutions [1,3,7,10,25,50] 765)

solns = (solutions [1,3,7,10,25,50] 765)

data Op = Add | Sub | Mul | Div

instance Show Op where
  show Add = "+"
  show Sub = "-"
  show Mul = "*"
  show Div = "/"

valid :: Op -> Int -> Int -> Bool
valid Add _ _ = True
valid Sub x y = x > y
valid Mul _ _ = True
valid Div x y = x `mod` y == 0

apply :: Op -> Int -> Int -> Int
apply  Add x y = x + y
apply  Sub x  y = x - y
apply  Mul x  y = x * y
apply  Div x  y = x `div` y

-- 9.3 Numeric Expressions

data Expr = Val Int | App Op Expr Expr

instance Show Expr where
  show (Val n)      = show n
  show (App o l r)  = brak l ++ show o ++ brak r
    where
      brak (Val n) = show n
      brak e       = "(" ++ show e ++ ")"
-- e.g, (App Add (Val 1) (App Mul (Val 2) (Val 3))) => 1+(2*3)

-- values :: Expr -> [Integer]
values (Val n)     = [n]
values (App _ l r) = values l ++ values r

eval (Val n)      = [n | n > 0]
eval (App o l r)  = [apply o x y | x <- eval l,
                                   y <- eval r,
                                   valid o x y]

-- 9.4 Combinatorial funcs
{-
subs :: (Eq a) => [a] -> [[a]]
subs [] = [[]]
subs (x:xs)
  | (xs == []) = [ [], [x] ]
  | otherwise =
    let rest_subs = subs xs
    in rest_subs ++ ([x] : rest_subs) -- [x] : rest_subs
-}

subs :: [a] -> [[a]]
subs []     = [[]]
subs (x:xs) = yss ++ map (x:) yss
              where yss = subs xs

-- insert a into [a] in every combination possible
interleave :: a -> [a] -> [[a]]
interleave x [] = [[ x ]]
interleave x (y:ys) = [x : (y:ys)] ++ map (y:) (interleave x ys)

-- perms xs = all permutations of xs
perms :: [a] -> [[a]]
perms [] = [[]]
-- interleave x into all perms of the xs
perms (x:xs) = concat $ map (interleave x) (perms xs)


--choices :: [a] -> [[a]]
--choices = concat . map perms . subs

-- 9.5 Formalising the problem

--solution :: Expr -> [Int] -> Int -> Bool
--solution e ns n = elem (values e) (choices ns) && eval e == [n]

-- 9.6 Brute force solution

split :: [a] -> [([a], [a])]
split []  = []
split [_] = []

-- split all@(x:xs) =  ([x], xs) : (map (\t -> x:(fst t)) (split xs))
split (x:xs) = ([x], xs) : [(x:ls,rs) | (ls,rs) <- split xs]

exprs :: [Int] -> [Expr]
exprs []  = []
exprs [n] = [Val n]
exprs ns  = [e | (ls,rs) <- split ns,
                  l      <- exprs ls,
                  r      <- exprs rs,
                  e      <- combine l r]

combine :: Expr -> Expr -> [Expr]
combine l r = [App o l r | o <- ops]

ops :: [Op]
ops = [ Add, Sub, Mul, Div ]

solutions :: [Int] -> Int -> [Expr]
solutions ns n =
  [e | ns' <- choices ns, e <- exprs ns', eval e == [n]]

-- Ex 1
choices :: [a] -> [[a]]
choices = concat . map perms . subs

-- power set
ps :: [a] -> [[a]]
ps []     = [[]]
ps [x]    = [[], [x]]
ps (x:xs) = [ fronts ++ backs | fronts <- ps [x], backs <- ps xs ]

insert_every :: a -> [a] -> [[a]]
insert_every x []     = [[x]]
insert_every x [y]    = [[x,y], [y,x]]
insert_every x (y:ys) = (x:y:ys) : [ y : z | z <- insert_every x ys ]

-- you can still use subs and perms
choices2 = []

-- Ex 2

newtype Set a = MakeSet [a] deriving (Show)

elementOfQ :: (Eq a) => a -> [a] -> Bool
elementOfQ x []     = False
elementOfQ x (y:ys)
  | (x == y)  = True
  | otherwise = (elementOfQ x ys)

--sameElementsQ :: [a] -> [a] -> Bool
subsetQ :: (Eq a) => [a] -> [a] -> Bool
subsetQ [] [] = True
subsetQ _  [] = False
subsetQ []  _ = True
subsetQ (x:xs) ys
  | (elementOfQ x ys) = True
  | otherwise       = False

isChoice :: (Eq a) => [a] -> [a] -> Bool
isChoice = subsetQ

--setEqQ :: Set a -> Bool

--isChoice :: Eq a => [a] -> [a] -> Bool
--isChoice = True

lop_off :: [a] -> [a]
lop_off = tail
