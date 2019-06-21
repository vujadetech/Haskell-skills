
data Point a = Pt a a deriving (Show, Eq)


data Pt_R2 = Pt_R2 Double Double deriving (Show, Eq)
data Zero_vec = Zero_vec [ Double ] deriving (Show, Eq)

data Vector = ZeroV [ Double ] | UnitVec [ Double ] | Vec [ Double ] deriving (Show, Eq)

-- make_Zero_vec :: (Num k) => Int -> Zero_vec
--make_Zero_vec :: (Fractional a) => Int -> [a]
--make_Zero_vec k = replicate k 0.0

make_Zero_vec :: Int -> Zero_vec
make_Zero_vec n = Zero_vec $ replicate n 0

-- 0-based
make_ZeroV n = ZeroV $ (flip replicate) 0.0 n
make_UnitVec i n = UnitVec $ (replicate (i-1) 0) ++ [1] ++ (replicate (n-i) 0)
make_vec xs  = Vec xs

z2 = make_ZeroV 2
(e1, e2) = (make_UnitVec 1 2, make_UnitVec 2 2)

v1 = make_vec [2, 1]
v2 = make_vec [3, 1]

get_xs (ZeroV xs)   = xs
get_xs (UnitVec xs) = xs
get_xs (Vec xs)     = xs

dot v1 v2 =

--e_i i n = (make_Zero_vec n) !! i

-- projection op pi, but pi is taken for obvious reasons
-- pie k xs =

--v1 = Pt_R2 2 1
--v2 = Pt_R2 3 1 --  (3.0 :: Double) 1.0 :: Double
-- lin_func_basis
