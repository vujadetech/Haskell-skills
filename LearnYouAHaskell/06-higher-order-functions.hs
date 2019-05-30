
multThree :: (Num a) => a -> a -> a -> a
multThree x y z = x * y * z

compareWithHundred :: (Num a, Ord a) => a -> Ordering
compareWithHundred x = compare 100 x

compareWithHundredflip :: (Num a, Ord a) => a -> Ordering
compareWithHundredflip x = flip compare 100 x

divideByTen :: (Floating a) => a -> a
divideByTen = (/10)

isUpperAlphanum :: Char -> Bool
isUpperAlphanum = (`elem` ['A'..'Z'])

-- Some higher-orderism is in order
applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

-- flip' is a good where_example
flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f = g
    where g x y = f y x

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map' f xs

-- In Haskell quicksort is nearly poetry. Or is it more of a zen koan...
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
    let smallerSorted = quicksort (filter (<=x) xs)
        biggerSorted = quicksort (filter (>x) xs)
    in  smallerSorted ++ [x] ++ biggerSorted

largestDivisible :: (Integral a) => a
largestDivisible = head (filter p [100000,99999..])
    where p x = x `mod` 3829 == 0

-- general version of largestDivisible: ub = upperbound, k = other num
maxDivisible_ub_k :: (Integral a) => a -> a -> a
maxDivisible_ub_k ub k = head (filter p [ub,ub-1..])
  where p x = x `mod` k == 0

-- maxDivisible_ub_k 100000 3829 -- => 99554

listOfFuns = map (*) [0..]

-- Chain is also in Chapter 2.
chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain n
    | even n =  n:chain (n `div` 2)
    | odd n  =  n:chain (n*3 + 1)

numLongChains :: Int
--numLongChains = length (filter isLong (map chain [1..100]))
--    where isLong xs = length xs > 15
numLongChains = length
  (filter (\xs -> length xs > 15) (map chain [1..100]))

sum' :: (Num a) => [a] -> a
sum' = foldl (+) 0

elem' :: (Eq a) => a -> [a] -> Bool
elem' y ys = foldl (\acc x -> if x == y then True else acc) False ys

maximum' :: (Ord a) => [a] -> a
maximum' = foldr1 (\x acc -> if x > acc then x else acc)

reverse' :: [a] -> [a]
reverse' = foldl (\acc x -> x : acc) []

product' :: (Num a) => [a] -> a
product' = foldr1 (*)

filter' :: (a -> Bool) -> [a] -> [a]
filter' p = foldr (\x acc -> if p x then x : acc else acc) []

head' :: [a] -> a
head' = foldr1 (\x _ -> x)

last' :: [a] -> a
last' = foldl1 (\_ x -> x)

{- scanl and scanr are like foldl and foldr, only they report all the
 intermediate accumulator states in the form of a list.
 There are also scanl1 and scanr1, which are analogous to foldl1 and foldr1. -}

scanl_sum = scanl (+) 0 [3,5,2,1]

-- How many elements does it take for the sum of the roots of all natural
-- numbers to exceed 1000?

-- vujadeTech version - not the most efficient/clever/idiomatic/readable/poetic,
-- but handforged in Mebane, NC by Vuja de Tech founder Todd Igoe. :D

-- First a partialSums helper function:
-- In fact this could be generalized further by parameterizing on the op
-- to allow not just (+) but (*), cons, yada yada, any binary op,
-- as the SICP lectures hammer repeatedly: https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-001-structure-and-interpretation-of-computer-programs-spring-2005/video-lectures/
partialSums i j f =
  let range = [i..j]
      ys = map f range
  in  scanl (+) 0 ys

partialSumsInf i f =
  let range = [i..]
      ys = map f range
  in  scanl (+) 0 ys

-- How many square roots must a geek on github add up, before they
-- sum to 1000? https://www.youtube.com/watch?v=G58XWF6B3AA

numSqRoots = length $ takeWhile (< 1000) $ partialSumsInf 1 sqrt -- => 131
-- So mine is admittedly more verbose than the the book's version,
-- but that's ok since I'm just experimenting. :D On the upside, this version
-- is more general since it permits an infinite stream,
-- and can used with arbitrary functions besides sqrt.

-- function composition example.
func_comp = map (negate . abs) [5,-3,-6,7,-3,2,-19,24]

-- iterated function composition, 3 functions in this case:
comp_chain = map (negate . sum . tail) [[1..5],[3..6],[1..7]]

-- uber example/lisp-scheme nightmare:
scheme_horror x = ceiling (negate (tan (cos (max 50 x)))) -- Too many parens!
haskell_heaven = ceiling . negate . tan . cos . max 50    -- Aaaaaaaaahhh ...

-- Readability++
oddSquareSum :: Integer
oddSquareSum =
  let oddSquares = filter odd $ map (^2) [1..]
      belowLimit = takeWhile (<10000) oddSquares
  in  sum belowLimit
