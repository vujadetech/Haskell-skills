

data Tree a = Leaf a | Node (Tree a) (Tree a) deriving Show

instance Functor Tree where
  fmap g (Leaf x)     = Leaf (g x)
  fmap g (Node l r) = (Node (fmap g l) (fmap g r))

t1 = (Leaf 1)
t2 = (Leaf 2)
t3 = (Node t1 t2)

t4 = fmap even t3

-- Nice functor example generalizing increment
inc :: Functor f => f Int -> f Int
inc = fmap (+1)
jinc = inc (Just 1)
xsinc = inc [1,2,3,4,5]
tinc = inc (Node (Leaf 1) (Leaf 2))

{-
instance Applicative Maybe where
  pure x = Just x
  -- <*> :: Maybe (a -> b) -> Maybe a -> Maybe b
  Nothing <*> _ = Nothing
  (Just g) <*> mx = fmap g mx

instance Applicative [] where
  pure x = [x]
  -- (<*>) :: [a -> b] -> [a] -> [b]
  gs <*> xs = [ (g x) | g <- gs, x <- xs ]
-}

prods xs ys = pure (*) <*> xs <*> ys

pairs :: [a] -> [b] -> [(a, b)]
pairs xs ys =
  xs >>= (\x ->
      ys >>= (\y -> return (x, y)))

-- 12.3 Monads
data Expr = Val Int | Div Expr Expr

eval :: Expr -> Int
eval (Val n)   = n
eval (Div x y) = eval x `div` eval y

-- eval (Div (Val 1) (Val 0)) -- => *** Exception: divide by zero
safediv :: Int -> Int -> Maybe Int
safediv _ 0 = Nothing
safediv n m = Just (n `div` m)

eval2 :: Expr -> Maybe Int
eval2 (Val n)  = Just n
eval2 (Div x y) = case eval2 x of
  Nothing -> Nothing
  Just n  -> case eval2 y of
    Nothing -> Nothing
    Just m -> safediv n m
