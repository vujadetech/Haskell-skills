
-- 10.8 Life, "Life's what happens while you're making other plans." - John Lennon


cls = putStr "\ESC[2J"

-- p 124
type Pos = (Int, Int)

writeat :: Pos -> String -> IO ()
writeat p xs = do goto p
                  putStr xs

goto :: Pos -> IO ()
goto (x, y) = putStr ( "\ESC[" ++ show y ++ ";" ++ show x ++ "H" )

-- Game of Life
delay :: Integer
delay = 100000

width :: Int
width = 50

height :: Int
height = 30

type Board = [Pos]

glider :: Board
glider = [(4,2),(2,3),(4,3),(3,4),(4,4)]

showcells :: Board -> IO ()
showcells b = sequence_ [writeat p "O" | p <- b]

isAlive :: Board -> Pos -> Bool
isAlive b p = elem p b

isEmpty :: Board -> Pos -> Bool
isEmpty b p = not (isAlive b p)

neighbs :: Pos -> [Pos]
neighbs (x, y) = map wrap [
  (x-1, y-1), (x  , y-1),
  (x+1, y-1), (x-1, y  ),
  (x+1, y  ), (x-1, y+1),
  (x  , y+1), (x+1, y+1) ]

wrap :: Pos -> Pos
wrap (x, y) = ( (mod (x-1) width) +1, (mod (y-1) height) + 1 )

liveneighbs :: Board -> Pos -> Int
liveneighbs b = length . filter (isAlive b) . neighbs

survivors :: Board -> [Pos]
survivors b = [p | p <- b, elem (liveneighbs b p) [2,3]]

births :: Board -> [Pos]
births b = [(x, y) | x <- [1..width], y <- [1..height],
                          isEmpty b (x, y),
                          liveneighbs b (x, y) == 3 ]

rmdups :: Eq a => [a] -> [a]
rmdups [] = []
rmdups (x:xs) = x : rmdups (filter (/= x) xs)

-- An earthquake struck a maternity ward in Toledo, OH this morning. 8 people died, but 10 people were born! -- George Carlin
nextgen b = survivors b ++ births b

life b = do cls
            showcells b
            wait delay
            life (nextgen b)

wait n = sequence_ [return () | _ <- [1..n]]
