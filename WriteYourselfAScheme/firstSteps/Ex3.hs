module Main where
import System.Environment

main :: IO ()
main = do
    -- args <- getArgs
    putStrLn "Enter a name: "
    name <- getLine
    putStrLn ("Hello, " ++ name)
