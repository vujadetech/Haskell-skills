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
