
import Data.ByteString as B
import Data.Monoid
import Control.Monad.Writer

loaded = "13a.hs"

-- Writer? I hardly know her!

isBigGang :: Int -> (Bool, String)
isBigGang x = (x > 9, "Compared gang size to 9.")

--applyLog :: (a,String) -> (a -> (b,String)) -> (b,String)
applyLog :: (a,[c]) -> (a -> (b,[c])) -> (b,[c])
applyLog (x,log) f = let (y,newLog) = f x in (y,log ++ newLog)

taco_bell_dog = B.pack [99,104,105] `mappend` B.pack [104,117,97,104,117,97]

type Food = String
type Price = Sum Int

addDrink :: Food -> (Food,Price)
addDrink "beans" = ("milk", Sum 25)
addDrink "jerky" = ("whiskey", Sum 99)
addDrink _ = ("beer", Sum 30)

--newtype Writer w a = Writer { runWriter :: (a, w) }
--instance (Monoid w) => Monad (Writer w) where
--  return x = Writer (x, mempty)
--  (Writer (x,v)) >>= f = let (Writer (y, v')) = f x in Writer (y, v `mappend` v')

logNumber :: Int -> Writer [String] Int
logNumber x = writer (x, ["Got number: " ++ show x])

multWithLog :: Writer [String] Int
multWithLog = do
    a <- logNumber 3
    b <- logNumber 5
    return (a*b)
