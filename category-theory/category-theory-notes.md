
#### Notes in no particular order


- __Definition[1]:__ A category with exactly one object is a __monoid__.

[1]: Conceptual Math: A first intro to categories, p166.

- __Bookkeeping Rules__:
	- The domain and codomain of 1<sub>A</sub> are both A. 
	- g . f is defined only if dom(g) = co(f).
	- dom(g . f) = dom(f) and co(g . f) = co(g).



- #####Powerset (from wikipedia)
	Example: the powerset functor is also a monad
The power set functor {\displaystyle P:\mathbf {Set} \to \mathbf {Set} } P:{\mathbf  {Set}}\to {\mathbf  {Set}} described above forms a monad. For any set S you have a {\displaystyle \operatorname {unit} _{S}(x)=\{x\}} {\displaystyle \operatorname {unit} _{S}(x)=\{x\}}, mapping elements to their singleton set. Note that each of these singleton sets are trivially a subset of S, so {\displaystyle \operatorname {unit} _{S}} {\displaystyle \operatorname {unit} _{S}} returns elements of the powerset of S, as is required. Also, you can define a function {\displaystyle \operatorname {join} _{S}} {\displaystyle \operatorname {join} _{S}} as follows: we receive an input {\displaystyle L\in {\mathcal {P}}({\mathcal {P}}(S))} L\in {\mathcal  {P}}({\mathcal  {P}}(S)). This is:
	- A member of the powerset of the powerset of S.
So a member of the set of all subsets of the set of all subsets of S.

- ##### Mendelson _Intro to Topology_ Sec 3.9 "Categories and Functors"

	- ######DEFINITION 9.1 

	>A category C is a collection of objects A whose members are called the objects of the category and for each ordered pair (X,Y) of objects of the category a set H(X, Y) called the maps of X into Y together with a rule of composition which associates to each _f_ ∈ _H(X, Y)_ and  _g ∈ H(Y, Z)_  a map _gf ∈ H(Y, Z)_. This composition is associative with identity, that is, 1<sub>X</sub> is the identity on X and f(gh) = (fg)h.
	
	 E.g. C_S could be the category of sets and functions. A_S = class of all sets and for X, Y ∈ A_S, H(X, Y) is the mappings from X to Y. 
	
	A transformation from one category to another which preserves the structure
of a category is called a “functor.”

	- ###### DEFINITION 9.3
	>Let C and C′ be categories with objects A and A′ respectively. A functor* F : C → C′ is a pair of functions F1 and F2 such that F1 : A → A′ and for each ordered pair X, Y of objects of A,
	
				F2 : H(X, Y) -> H'(F1(X), F1(Y))
				
		> while preserving identities and compositions, that is, F2(1_X) = 1_F1(X) and F2(gf) = F2(g)F2(f) for all f in H(X, Y) and g in H(Y, Z). [My note: So the functor F is in fact two functions F1 and F2. Two are needed since a functor requires both a mapping on objects and a mapping of morphisms between objects. So when just one F is mentioned the F1 or F2 is given by context.]

#### From Milewski's YT category theory playlist
- A function is _pure_ if it can be memoized (~5:00 of 2.1).

- Surjective/onto = epimorsphism/epic, monomorphic/into = monomorphism/monic, but more general since in Cat theory the objects aren't necessarily sets. Formal defn at 44:30 (and repeated at start of 2.2 vid): Spse f is an arrow from object a to object b. If for all objects c and all morphisms g1, g2, (g1 . f) = (g2 . f) => g1 = g2, then f is an epimorphism. When C = Set, this reduces to f being a surjective function. Hint for remembering: it permits left cancellation. 

- Monomorphism/monic (3:50 of 2.2): Let f be an arrow from object a to object b. If for all objects c and all arrows g1, g2 from c to a, (f . g1) = (f . g2) => g1 = g2, then f is monomorphism. It permits right cancellation.

- The type (in Haskell, presumably) of the empty set (~9:00 of 2.2) is Void.

- Void = False in logic. (13:10 of 2.2)

- Unit, () :: ()  (~15:00). () = True in logic.

- Thin category (3.1, ~20:55): A thin category corresponds to a preorder.

- Hom-set (3.1, 22:30), hom-set : C(a, b) (or C(a, a)) is a set of arrows from a to b (or a in the second case). In a thin category, every hom-set is either the empty set, or a singleton set.

- Monoid (3.1, 33:00) NB A given object m will have an id\_m : m -> m by necessity, but could have 1 or more other arrows m -> m which are not id\_m. 

- Subset example (3.2, ~7:00): Order but not total order, since d could be a sub of both b and c which are themselves subset of a, but b != c.

- Logging composition example (3.2, 25:00): Latter portion of lecture does a deep dive into logging functionality that's requested after other modules are already written in C++. He calls it embellished composition specifically since the functions are working on pairs (a, string).

\<a, string>

\<a, string\> 