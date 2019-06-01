


-- CounterMaybe, which maintains state and thus fails the
-- composition laws and even id laws.
data CMaybe a = CNothing | CJust Int a deriving (Show)

instance Functor CMaybe where
  fmap f CNothing = CNothing
  fmap f (CJust counter x) = CJust (counter + 1) (f x)

a = fmap (*) [1,2,3,4]

ex1 = fmap (++"ha") (CJust 0 "ho")
ex2 = fmap (++"he") (fmap (++"ha") (CJust 0 "ho"))
ex3 = fmap (++"blah") CNothing
