

removeNonUppercase :: [Char] -> [Char]
removeNonUppercase cs = [ c | c <- cs, elem c ['A'..'Z' ] ]

factInt :: Int -> Int
factInt n = product [1..n]  

factorial :: Integer -> Integer
factorial n = product [1..n]
