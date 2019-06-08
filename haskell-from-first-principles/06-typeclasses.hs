

--data Trivial = Trivial
data Trivial = Trivial' deriving (Show)

instance Eq Trivial where
  (/=) Trivial' Trivial' = False

x = Trivial'
y = Trivial'

data Car = AGreatSteeringWheelThatWont__Whiff__OutTheWindowWhileIDriving


data List a = Nil | Cons a (List a)

-- Exercises: Eq

-- 1.
data TisAnInteger = TisAn Integer deriving (Show)
i = TisAn 42

-- 2.
data TwoIntegers = Two Integer Integer deriving (Show)
ti = Two 4 2

--data StringOrInt = TisAnInt Int | TisAString String
--soii = 42
--sois = "forty two"

data StringOrInt2 = TisAnInteger | TisAString String -- first case inherited
--[soii, sois] = [ TisAn 42, TisAString "forty two" ]
soii =  TisAn 42
sois =  TisAString "forty two" 
