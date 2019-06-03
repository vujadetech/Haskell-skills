data Set a = NilSet | ConsSet a (Set a)
-- give constructors with types:

--NilSet :: Set a
ConsSet ::  a -> Set a -> Set a
