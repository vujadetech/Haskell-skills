doubleMe :: Integer -> Integer
doubleMe x = x + x

add :: Integer -> Integer -> Integer
add x y = x + y

sq :: Integer -> Integer
sq x  = x * x

bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
    | bmi <= 18.5 = "You're underweight, you emo, you!"
    | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"
    | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"
    | otherwise   = "You're a whale, congratulations!"
    where bmi = weight / height ^ 2

chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain n
  | even n = n : chain (div n 2)
  | odd  n = n : chain (n * 3 + 1)


numLongChains :: Int
numLongChains = length (filter isLong (map chain [1..100]))
    where isLong xs = length xs > 15

longer :: [a] -> [a] -> [a]
longer xs ys
  | length xs > length ys = xs
  | otherwise             = ys

-- vujadeTech
longestChainInRange :: (Integral a) => a -> a -> [a]
longestChainInRange x y -- nums -- (map chain nums)
  | (x >  y)  = []
  | (x == y)  = chain x
  | otherwise = foldl longer [] (map chain nums)
  where nums = [x..y]

-- Texas Ranges
charSeq = ['a'..'z'] -- char sequence
skipBy3 = [3,6..20] -- skip by 3
countdown20 = [20,19..1] -- countdown
take24By13s = take 24 [13,26..] -- from infinite stream/list
{-
Can also use "cycle xs" or "repeat x" for infinite lists, and "replicate n x" for lists of length n.
-}

-- List comprehensions
eq3mod7s = [ x | x <- [50..100], x `mod` 7 == 3]
products = [ x*y | x <- [2,5,10], y <- [8,10,11]]

length' xs = sum [1 | _ <- xs] -- anonymous variable, Prolog/Scheme style

-- Tuples
point = (8,11)
xy = [fst point, snd point]

-- zip
num_names = zip [1..] ["one", "two"] -- can zip finite with infinite list

-- tuples and list comprehensions
rightTrianglesAll = [ (a,b,c) | c <- [1..100], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2]
rightTriangles24 = [ (a, b, c) | (a, b, c ) <- rightTrianglesAll, a + b + c == 24]
