{-
module Shapes
  ( Point(..)
  , Shape(..)
  , surface
  , nudge
  , baseCircle
  , baseRect ) where
-}

data Point = Point Float Float deriving (Show)
data Shape = Circle Point Float | Rectangle Point Point deriving (Show)

surface :: Shape -> Float
surface (Circle _ r) = pi * r ^ 2
surface (Rectangle (Point x1 y1) (Point x2 y2)) = (abs $ x2 - x1) * (abs $ y2 - y1)

nudge :: Shape -> Float -> Float -> Shape
nudge (Circle (Point x y) r) a b = Circle (Point (x+a) (y+b)) r
nudge (Rectangle (Point x1 y1) (Point x2 y2)) a b = Rectangle (Point (x1+a) (y1+b)) (Point (x2+a) (y2+b))

baseCircle :: Float -> Shape
baseCircle r = Circle (Point 0 0) r

baseRect :: Float -> Float -> Shape
baseRect width height = Rectangle (Point 0 0) (Point width height)

-- Record syntax
-- Person defn:
{- see better version below
data Person = Person String String Int Float String String deriving (Show)

firstName :: Person -> String
firstName (Person firstname _ _ _ _ _) = firstname

lastName :: Person -> String
lastName (Person _ lastname _ _ _ _) = lastname

age :: Person -> Int
age (Person _ _ age _ _ _) = age

height :: Person -> Float
height (Person _ _ _ height _ _) = height

phoneNumber :: Person -> String
phoneNumber (Person _ _ _ _ number _) = number

flavor :: Person -> String
flavor (Person _ _ _ _ _ flavor) = flavor
-- /Person defn
-}

data Person = Person { firstName :: String
                     , lastName :: String
                     , age :: Int
                     , height :: Float
                     , phoneNumber :: String
                     , flavor :: String
                     } deriving (Show)

guy = Person "Buddy" "Finklestein" 43 184.2 "526-2928" "Chocolate"

{-
If we were defining a mapping type, we could add a typeclass constraint in
the data declaration:

data (Ord k) => Map k v = ...

However, it's a very strong convention in Haskell to never add typeclass
constraints in data declarations. Why? Well, because we don't benefit a
lot, but we end up writing more class constraints, even when we don't need them.
-}

-- Type parameters
data Maybe a = Nothing | Just a

-- data Car = Car String String Int deriving (Show) -- Using record syntax instead∷
data Car = Car {company :: String,
                  model :: String,
                   year :: Int} deriving (Show)

mustang = Car "Ford" "Mustang" 1967
motherInLawsCar = Car "Ruben Rebasa from Tim Robinson's show 'I think you should leave'"
  "A car with a great streering wheel that won't _whiff_ out the window while I driving." 2019

tellCar :: Car -> String
tellCar (Car {company = c, model = m, year = y}) = "This " ++ c ++ " " ++ m ++ " was made in " ++ show y

data Vector a = Vector a a a deriving (Show)

vplus :: (Num t) => Vector t -> Vector t -> Vector t
(Vector i j k) `vplus` (Vector l m n) = Vector (i+l) (j+m) (k+n)

vectMult :: (Num t) => Vector t -> t -> Vector t
(Vector i j k) `vectMult` m = Vector (i*m) (j*m) (k*m)

scalarMult :: (Num t) => Vector t -> Vector t -> t
(Vector i j k) `scalarMult` (Vector l m n) = i*l + j*m + k*n

-- Derived Instances



-- Linked List
data List a = Empty | Cons a (List a) deriving (Show, Read, Eq, Ord)
