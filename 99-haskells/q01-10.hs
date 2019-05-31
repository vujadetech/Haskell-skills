--q01_10 = putStrLn "Loading q01-10.hs"

xs = [1,2,3,4]      -- nums for testing
cs = ['x','y','z']  -- chars for testing

-- Problem 01
-- myLast, not using builtin last for obvious reasons.

myLast :: [a] -> a
myLast (x:[]) = x
myLast (x:xs) = myLast xs

q01a = myLast [1,2,3,4]
q01b = myLast ['x','y','z']

-- fold version is a 1 liner (not counting the function signature).
myLastf :: [a] -> a
myLastf xs = foldl1 (\_ y -> y) xs

q01c = myLastf [1,2,3,4]
q01d = myLastf ['x','y','z']

-- Problem 02, myButLast

myButLast :: [a] -> a
myButLast (x:_:[]) = x
myButLast (x:xs) = myButLast xs

q02a = myButLast [1,2,3,4]
q02b = myButLast ['x','y','z']

-- Problem 03, elementAt
elementAt :: (Integral b) => [a] -> b -> a
elementAt (x:xs) n
  | (n == 1) = x
  | otherwise = elementAt xs (n - 1)

-- some alternate implementations:
elementAt2 xs n = head $ drop (n - 1) xs
elementAt3 xs n = xs !! (n - 1)
-- Ok, can we make this simple function just a bit more irritating? Of course!
elementAt4 xs n =
  let foundIt = dropWhile (\pair -> fst pair /= n) $ zip [1..] xs
  in snd $ head foundIt

elementAt4_test1 = elementAt4 "haskell" 5

-- Problem 04, myLen
myLen :: (Integral b) => [a] -> b
myLen xs = sum [1 | _ <- xs]

-- Problem 05, myRev
myRev :: [a] -> [a]
myRev xs = foldl (flip (:)) [] xs

-- Canonical version as given in "Learn you a Haskell..."
myRev2 :: [a] -> [a]
myRev2 [] = []
myRev2 (x:xs) = myRev2 xs ++ [x]

-- Problem 06, isPal
isPal :: (Eq a) => [a] -> Bool
isPal xs = (myRev xs) == xs

-- Problem 07, flatten a list, TODO
data NestedList a = Elem a | List [NestedList a] deriving (Eq, Show)

nestedElemQ :: NestedList a -> Bool
nestedElemQ (Elem _) = True
nestedElemQ _        = False

nestedListQ :: NestedList a -> Bool
nestedListQ nl = not $ nestedElemQ nl

--car :: NestedList a -> NestedList a

flatten :: NestedList a -> [a]
flatten (List []) = []
flatten (Elem x) = [x]
flatten (List [ Elem x ]) = [x]

-- Problem 08, compress
compress :: (Eq a) => [a] -> [a]
compress [] = []
compress [x] = [x]
compress (x0:x1:xs)
  | (x0 == x1 ) = compress rest
  | otherwise = x0 : compress rest
  where rest = (x1:xs)

--compress2 :: (Eq a) => [a] -> [a]
compress2 xs = foldl1 (\x y -> if ([last x] == y) then x else x ++ y) $ map (\x -> [x]) xs
