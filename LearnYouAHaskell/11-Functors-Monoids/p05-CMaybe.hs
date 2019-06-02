
sq x = x * x


-- CMaybe = CounterMaybe, which maintains state and thus fails the
-- composition laws and even id laws.
-- Good example of a non-functor even though ghc and ghci
-- will accept it. But it could cause buggy code.
data CMaybe a = CNothing | CJust Int a deriving (Show)

instance Functor CMaybe where
  fmap f CNothing = CNothing
  fmap f (CJust counter x) = CJust (counter + 1) (f x)

a = fmap (*) [1,2,3,4]

ex1 = fmap (++"ha") (CJust 0 "ho")
ex2 = fmap (++"he") (fmap (++"ha") (CJust 0 "ho"))
ex3 = fmap (++"blah") CNothing

--class (Functor f) => Applicative f where
--    pure :: a -> f a
--    (<*>) :: f (a -> b) -> f a -> f b

{-
instance Applicative Maybe where
  pure = Just
  Nothing <*> _ = Nothing
  (Just f) <*> something = fmap f something
-}


-- sequenceA - the following are equivalent:
mapAnd = and $ map (\f -> f 7) [(>4),(<10),odd]
seqAnd = and $ sequenceA [(>4),(<10),odd] 7

-- newtype example
newtype CharList = CharList { getCharList :: [Char] } deriving (Eq, Show)

newtype Pair b a = Pair { getPair :: (a,b) } deriving (Show)
-- And now, we can make it an instance of Functor so that the function is mapped over
-- the first component:
instance Functor (Pair c) where
    fmap f (Pair (x,y)) = Pair (f x, y)

newtype CoolBool = CoolBool { getCoolBool :: Bool } deriving (Show)

helloMe :: CoolBool -> String
helloMe (CoolBool _) = "hello"

-- Monoids
lengthCompare :: String -> String -> Ordering
lengthCompare x y = let a = length x `compare` length y
                        b = x `compare` y
                    in  if a == EQ then b else a

-- better version using the fact that Ordering is a Monoid
lengthCompareM :: String -> String -> Ordering
lengthCompareM x y = (length x `compare` length y) `mappend`
                    (x `compare` y)
