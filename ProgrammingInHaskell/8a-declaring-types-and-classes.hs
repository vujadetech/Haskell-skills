
safediv _ 0 = Nothing
safediv x y = Just (/ x y)

safehead [] = Nothing
safehead xs = Just (head xs)
