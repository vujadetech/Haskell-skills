
xs = [1..10]

-- 2.

bools = map even [1..10]
nums = map (\x -> [1..x]) ([1..10] :: [Int])

add :: Int -> Int -> Int -> Int
add = (\x -> \y -> \z -> 0 :: Int) -- Not a very useful function, but it satisfies the type requirement.

--copy :: a -> (a, a)
copy x = (x, x)


apply f x = (f x)



-- 3.
-- twice :: (a -> a) -> a -> a
twice f x = f (f x)
