

-- Bird, alg of prog, Ex 1.2
-- This determines a unique partial function.
m :: Int -> Int -> Int
m x y
  | (x == y) = y + 1
  | otherwise = m x (m (x-1) (y+1))

z = m 2 0

-- m 2 0 = m 2 m()
