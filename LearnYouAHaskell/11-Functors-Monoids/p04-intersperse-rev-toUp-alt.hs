import Data.Char
import Data.List

main = do
  line <- getLine
  let line2 =  (intersperse '-' . reverse . map toUpper) line
  putStrLn line2
