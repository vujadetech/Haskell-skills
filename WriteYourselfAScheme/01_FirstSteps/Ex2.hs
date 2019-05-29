module Main where
import System.Environment

main :: IO ()
main = do
    args <- getArgs
    let x0 = read (args !! 0) :: Int
        x1 = read (args !! 1) :: Int
        sum = x0 + x1
    putStrLn ("Hello, " ++ show sum)
