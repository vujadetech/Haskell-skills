factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

factFold :: (Integral a) => a -> a
factFold n = foldl (*) 1 [1..n]

-- Type constraint, anonymous variable
length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs

-- Pattern using @
-- all@(x:xs) allows using all instead of (x:xs)
capital :: String -> String
capital "" = "Empty string, whoops!"
capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]

-- Guards, guards!

bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
    | bmi <= skinny = "You're underweight, you emo, you!"
    | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"
    | bmi <= fat    = "You're fat! Lose some weight, fatty!"
    | otherwise     = "You're a whale, congratulations!"
    where bmi = weight / height ^ 2
          skinny = 18.5
          normal = 25.0
          fat = 30.0

-- Let it be (let, OO style)
cylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
    let sideArea = 2 * pi * r * h
        topArea = pi * r ^2
    in  sideArea + 2 * topArea

-- if then else w/ lists
ifList = [if 5 > 3 then "Woo" else "Boo", if 'a' > 'b' then "Foo" else "Bar"]

-- let binding inside scope
letScope = 4 * (let a = 9 in a + 1) + 2

-- let binding inline (can't use offside rule)
tupleInline = (let a = 100; b = 200; c = 300 in a*b*c, let foo="Hey "; bar = "there!" in foo ++ bar)

-- let in list comprehensions
calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2]

-- let with in
boot_ = let boot x y z = x * y + z in boot 3 4 2

{-
Case expressions:

case expression of pattern -> result
                   pattern -> result
                   pattern -> result
                   yada yada ...
-}


describeList :: [a] -> String
describeList xs = "The list is " ++ case xs of [] -> "empty."
                                               [x] -> "a singleton list."
                                               xs -> "a longer list."

-- They are useful for pattern matching against something in the middle of an expression.
-- Because pattern matching in function definitions is syntactic sugar for case expressions, we could have also defined this like so:

describeListPatt :: [a] -> String
describeListPatt xs = "The list is " ++ what xs
    where what [] = "empty."
          what [x] = "a singleton list."
          what xs = "a longer list."
