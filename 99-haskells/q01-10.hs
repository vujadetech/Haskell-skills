--q01_10 = putStrLn "Loading q01-10.hs"
import Data.List
import System.Random hiding (split)

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

-- Problem 07, alternate nested list definition using the List datatype as
-- given in Chapter 8 of LYAH (Learn you a Haskell).
data List a = Empty | Cons a (List a) deriving (Show, Read, Eq, Ord)


--car :: NestedList a -> NestedList a

flatten :: NestedList a -> [a]
flatten (List []) = []
flatten (Elem x) = [x]
flatten (List [ Elem x ]) = [x]

-- Problem 08, compress
cs8 = "aaaabccaadeeee"

compress :: (Eq a) => [a] -> [a]
compress [] = []
compress [x] = [x]
compress (x0:x1:xs)
  | (x0 == x1 ) = compress rest
  | otherwise = x0 : compress rest
  where rest = (x1:xs)

--compress2 :: (Eq a) => [a] -> [a]
compress2 xs = foldl1 (\x y -> if ([last x] == y) then x else x ++ y) $ map (\x -> [x]) xs

compress3 :: (Eq a) => [a] -> [a]
compress3 = (map head) . pack

-- Problem 09,


--pack [ ] = []
--pack [x] = [x]
{-
pack (x1:x2:xs) = []
  | takeWhile (hd == c)
  | otherwise
  where
    compressed = compress xs
    c  = head compressed
    hd = head xs
    -}

pack :: Eq a => [a] -> [ [a] ]
pack [] = []
pack xs = first : pack rest
  where
    first = takeWhile (== head xs) xs
    rest  = dropWhile (== head xs) xs

pack1 = pack cs8
pack2 = pack [1,1,2,3,3,3,3,3,1]

-- Problem 10
c10s = "aaaabccaadeeee"

encode :: (Eq a) => [a] -> [ (Int, a) ]
encode = map (\ys -> (length ys, head ys)) . pack
es10 = encode cs8

-- Problem 11
-- This one is annoying in Haskell b/c of its type system, so skipping it. Judge me if you must. :D

-- Problem 12

decode ps = concat $ map (\p -> (replicate (fst p) (snd p))) ps

-- Problem 13

-- encodeDirectAccumulator
edAcc :: (Eq a) => [a] -> [(Int, a)] -> [(Int, a)]
edAcc [] acc = acc
edAcc (x:xs) []  = edAcc xs [ (1, x) ]
edAcc (x:xs) ( (n, y) : ps )
  | (x == y)  = edAcc xs ((n+1, y) : ps)
  | otherwise = (n, y) : edAcc xs ( (1, x) : ps )

encodeDirect :: (Eq a) => [a] -> [ (Int, a) ]
encodeDirect = (flip edAcc) []


-- Problem 14
dupli xs = concatMap (\x -> x:x:[]) xs

-- Problem 15
repli xs n = concatMap (replicate n) xs

-- point-free
repli' :: Foldable t => t b -> Int -> [b]
repli' = flip $ concatMap . replicate

-- Problem 16
split_every xs n
  | (n >= length xs) = [ xs ]
  | otherwise = (take n xs) : split_every (drop n xs) n

dropEvery xs n = concat $  (take (n-1) xs) : (map tail (split_every (drop (n-1) xs) n))

-- Problem 17
split xs n = (take n xs, drop n xs)

-- Problem 18
slice xs i k = (take len) . (drop (i-1)) $ xs
  where len = (k - i + 1)

-- Problem 19
rotate xs n = rest ++ first
  where
    k = (mod n (length xs))
    (first, rest) = split xs k

-- Problem 20
removeAt n xs = (x, first ++ (tail rest))
  where
    (first, rest) = split xs (n-1)
    x = head rest

-- Problem 21
insertAt x xs n = first ++ [x] ++ rest
  where
    (first, rest) = split xs (n-1)

-- p22
range a b
  | (a > b) = []
  | otherwise = a : range (a+1) b

-- p23
rollDie x = getStdRandom (randomR (1, x))

randomPick' xs = do
  k <- rollDie (length xs)
  return (xs !! (k-1))

randomPick xs =
  rollDie (length xs) >>=
    (\k -> return (xs !! (k-1)))

randomPick'' :: [a] -> IO (a, [a])
randomPick'' xs =
  rollDie (length xs) >>=
    (\k -> do
      let i = k-1
      return (xs !! i, snd $ removeAt k xs))

rndSelect xs n = do
  p <- randomPick'' xs
  let ys = (snd p)
  if (n == 1) then return ys
  else return ys

rndSelect' xs n acc
  | (n == 0) = return acc
  | (n == 1) = do
      ys <- randomPick'' xs
      return $ snd ys
  | otherwise = return []

rndSelectAcc :: (Eq t, Num t) => [a] -> t -> [a] -> IO [a]
rndSelectAcc xs 0 acc = return acc
rndSelectAcc xs n acc = do
  (y, ys) <- randomPick'' xs
  rndSelectAcc ys (n-1) (y:acc)

rnd_select xs n = rndSelectAcc xs n []

-- p24
diff_select k n = rnd_select [1..n] k

-- p25
rnd_permu xs = rnd_select xs (length xs)

-- p26

--combos 1 xs = map (:[]) xs
combos k xs = ps
  where
    len = length xs
    xss = replicate len xs
    ps  = zipWith removeAt [1..len] xss

combos' 0  _     = [[]]
combos' _  []    = [[]]
combos' 1 (x:xs)    = map (:[]) (x:xs)
combos' k (x:xs) = filter ((== k) . length) $ x_combos ++ rest_combos
  where
    x_combos = map (x:) (combos' (k-1) xs)
    rest_combos = combos' k xs

--combos :: Int -> [a] -> [[a]]
--combos k xs
--  | (k == 1) = map (:[]) xs
--  | otherwise = (combos 1 xs)

{-
rndSelectAcc xs 0 acc = return acc
rndSelectAcc xs n acc = do
  p <- randomPick'' xs
  y  <- fst p
  ys <- snd p
  zs <- rndSelectAcc ys (n-1) (y:acc)
  return zs

-}
{-
rndSelect xs n
  | (n == 1) = randomPick xs >>= (\x -> return [x])
  | otherwise = do
      y <- randomPick xs
      ys <- rndSelect xs (n-1)
      return $ [y] ++ ys

rndSelect' xs n = do
  x <- randomPick xs
  if (n == 1) then
    return [x]
  else
    return $ [x] ++ xs
-}
