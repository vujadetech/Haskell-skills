Highlights from https://wiki.haskell.org/Introduction_to_IO.


- Haskell provides us with a few primitives for composing and chaining together IO actions. A simple one of these is:

	- (>>) :: IO a -> IO b -> IO b
where if x and y are IO actions, then (x >> y) is the action that performs x, dropping the result, then performs y and returns its result. Great, we can now write programs which do multiple things:

	main = putStrLn "Hello" >> putStrLn "World"
will print "Hello" and "World" on separate lines.


