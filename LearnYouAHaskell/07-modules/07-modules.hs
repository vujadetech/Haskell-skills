import Data.List

numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub

-- import options:
--import Data.List (nub, sort)
--import Data.List hiding (nub)
--import qualified Data.Map -- must use Data.Map.filter, say.
--import qualified Data.Map as M -- Then

equation_sum = map sum $ transpose [[0,3,5,9],[10,0,0,9],[8,5,1,-1]]

{-
Data.List includes intersperse, intercalate, transpose.
Also,

foldl', foldl1': strict eval versions of the lazy foldl/foldl1 versions.
concatMap is the same as first mapping a function to a list and then concatenating the list with concat.

and, or, any, all for arbitrary lists.
iterate: take 10 $ iterate (*2) 1
splitAt
takeWhile, dropWhile
span, break
sort, group
inits, tails
isPrefixOf, isInfixOf, isSuffixOf
elem, notElem
partition
find
elemIndex
elemIndices
findIndex
zip, zipWith, zip3, etc.
lines: string with \n -> list of the lines.
unlines: concat the list of lines to make a file/etc.
words/unwords: ditto but for space instead of newline.
nub ("essence"): like unix uniq - why didn't they just call it that?
delete: just deletes first occurence

Set ops:
\\: set diff
union (intersect): set union (intersection)

insert: places it where it should go assuming list is sorted (even if it's not).

Generic versions of legacy Int functions:
genericLength, genericTake, genericDrop, genericSplitAt, genericIndex and genericReplicate.

Generic versions of (==) functions:
nubBy, deleteBy, unionBy, intersectBy and groupBy
e.g., group is the same as groupBy (==)

on (from Data.Function):
on :: (b -> b -> c) -> (a -> b) -> a -> a -> c
f `on` g = \x y -> f (g x) (g y)
Example: groupBy ((==) `on` (> 0)) values. Used with By functions alot.

-- **************** Data.Map ********************
Because Data.Map exports functions that clash with the Prelude and Data.List ones, we'll do a qualified import.

import qualified Data.Map as Map



-}
