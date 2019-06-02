
### Group categories

- Let Grp be the class of all groups (or some subset thereof). For G, K in Grp let H(G, K) be the set of all homomorphisms of G into K. Let the operator * be function composition s.t. for all f in H(G, K) and g in H(K, L), g*f is in H(G, L) is the composition of f and g. Then C_Grp can be verified to be the category of groups Grp.

##### Examples of groups
- Let G = {1, -1, i, -i} where * is multiplication and H = (Z, +). Let f : H -> G and n in Z and define f(n) = i^n. Then f is a homomorphism from H to G. 

	Proof:
	
	- f(n + m) = i^(n + m) = i^n * i^m = f(n) * f(m).




##### Jokes

These are normally called _objects_, but since that word could easily be conflated with OO programming by readers with a heavier CS than math background, we'll just call them _things_ so we don't accidentally dispatch a java programmer to go write an IFunctorable interface before we get to the good stuff. 