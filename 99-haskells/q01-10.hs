-- myLast

myLast :: [a] -> a
myLast (x:[]) = x
myLast (x:xs) = myLast xs

q01a = myLast [1,2,3,4]
q01b = myLast ['x','y','z']

-- fold version
myLastf :: [a] -> a
myLastf xs = foldl1 (\_ y -> y) xs

q01c = myLast [1,2,3,4]
q01d = myLast ['x','y','z']
