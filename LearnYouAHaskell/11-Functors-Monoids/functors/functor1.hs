--
sq x = x * x

--

data List a = Empty | Cons a (List a) deriving (Show, Read, Eq, Ord)

instance Functor List where
  fmap f Empty = Empty
  fmap f (Cons item xs) = Cons (f item) (fmap f xs)

xs = 3 `Cons` (4 `Cons` (5 `Cons` Empty))
xss = xs `Cons` Empty
ys = Cons 1 $ Cons 2 Empty
zs = fmap sq xs -- Cons 9 (Cons 16 (Cons 25 Empty))


-- instance functor List
