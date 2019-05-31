import qualified Data.Map as Map

data LockerState = Taken | Free deriving (Show, Eq)
type Code = String
type LockerMap = Map.Map Int (LockerState, Code)


lockerLookup :: Int -> LockerMap -> Either String Code
lockerLookup lockerNumber map =
    case Map.lookup lockerNumber map of
        Nothing -> Left $ "Locker number " ++ show lockerNumber ++ " doesn't exist!"
        Just (state, code) -> if state /= Taken
                                then Right code
                                else Left $ "Locker " ++ show lockerNumber ++ " is already taken!"

lockers :: LockerMap
lockers = Map.fromList
    [(100,(Taken,"ZD39I"))
    ,(101,(Free,"JAH3I"))
    ,(103,(Free,"IQSA9"))
    ,(105,(Free,"QOTSA"))
    ,(109,(Taken,"893JJ"))
    ,(110,(Taken,"99292"))
    ]

l1 = lockerLookup 101 lockers
l2 = lockerLookup 102 lockers
l3 = lockerLookup 110 lockers
l4 = lockerLookup 105 lockers

-- Recursive data structures
--data List a = Empty | Cons { listHead :: a, listTail :: List a} deriving (Show, Read, Eq, Ord)
data List a = Empty | Cons a (List a) deriving (Show, Read, Eq, Ord)

xs = 3 `Cons` (4 `Cons` (5 `Cons` Empty))
--xss = (42 `Cons` xs)
xss = xs `Cons` Empty
ys = Cons 1 $ Cons 2 Empty
