
### Group categories

- Let Grp be the class of all groups (or some subset thereof). For G, K in Grp let H(G, K) be the set of all homomorphisms of G into K. Let the operator * be function composition s.t. for all f in H(G, K) and g in H(K, L), g*f is in H(G, L) is the composition of f and g. Then C_Grp can be verified to be the category of groups Grp.

##### Examples of groups (from emathzone.com)
- Let G = {1, -1, i, -i} where * is multiplication and H = (Z, +). Let f : H -> G and n in Z and define f(n) = i^n. Then f is a homomorphism from H to G. 

	Proof:
	
	- f(n + m) = i^(n + m) = i^n * i^m = f(n) * f(m).

### Functors (from wikipedia.com)

- If C and D are categories a __functor__ F from C to D is a mapping that 
	- associates each X in C an object F(X) in D (in Mendelson's terms, F1(X) in D).
	- associates to each morphism f : X -> Y in C a morphism F(f) : F(X) -> F(Y) that preserves identity morphisms and composition of morphisms, or in Mendelson's terms, F2(f):F1(X)->F1(Y). Also can be written F2 : H(X, Y) -> H'(F1(X), F1(Y)), that is, F2 maps morphisms/arrows in H to morphisms in H'. 

##### Examples of functors

- Constant functor: The functor C → D which maps every object of C to a fixed object X in D and every morphism in C to the identity morphism on X. Such a functor is called a constant or selection functor.

- Endofunctor: A functor that maps a category to that same category; e.g., polynomial functor.

- Identity functor: in category C, written 1_C or id_C, maps an object to itself and a morphism to itself. The identity functor is an endofunctor.

- Diagonal functor: The diagonal functor is defined as the functor from D to the functor category DC which sends each object in D to the constant functor at that object.

- Power sets: The power set functor P : Set → Set maps each set to its power set and each function f:X->Y to the map which sends each subset U of X to the subset f(U) of Y. So F1(X) = the power set of X. F2 depends on f since F2 sends f to the map which sends subsets of X to their images under f in Y.
	- E.g., if X = Z_2 = {0,1} then F1(X) = P(X) = {{}, {0}, {1}, X}. Suppose f(0) = {} and f(1) = {0,1} = X, to make f specific. Call it the "all or nothing" mapping, if you will. F2(f) is the function which sends any subset U of X to it's image f(U), which in this case means
		- {} -> f({}) = {}, where the -> refers to the mapping under F2(f).
		- {0} -> f({0}) = {f(0)} = {{}}.
		- {1} -> f({1}) = {f(1)} = {X}.
		- {0,1} -> f({0,1}) -> {f(0), f(1)} = {{}, X}.

##### Jokes

These are normally called _objects_, but since that word could easily be conflated with OO programming by readers with a heavier CS than math background, we'll just call them _things_ so we don't accidentally dispatch a java programmer to go write an IFunctorable interface before we get to the good stuff. 