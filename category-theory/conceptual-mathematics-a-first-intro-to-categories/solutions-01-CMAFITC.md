
#### Some solutions to Conceptual Maths ... Categories [in progress]

##### Article 2, Isomorphisms
- NB: Arrow composition will be indicated by either a * between two objects or simply juxtaposition of the two objects.

- __Ex 1 r__ I_A serves as its own inverse since I_A * I_A = I_A. Thus I_A is an isomorphism.
- __Ex 1 s__ Spse f : A -> B is an iso(morphism) and g : B -> A is an f inverse. Then fg = I_B and gf = I_A, so g is also an iso.
- __Ex 1 t__ Since f is an iso from A to B there is a g : B -> A that is an f inverse, and likewise an h : C -> B that is a k inverse. Thus  gh : C -> A is an inverse for kf : A -> C since (gh)(kf) = g(h(kf)) = g(hk)f = g(I_B)f = gf = I_A, and similarly (kf)(gh) = I_C, so gh and kf are inverses of each other and thus both are isos.

- __Ex 2__ kf : A -> B is I_A, and gf is I_A as well. Likewise fk and fg are both I_B. So g = g I_B = g(fk) = (gf)k = I_A k = k.

- __Ex 3 a__ Spse fh and fk are both arrows from B to C, and f is an arrow from B to C, so that h and k are both arrows from A to B. f has an inverse from C to B, call it g. Thus gf = I_B and fg = I_C, so h = I_B * h = (gf)h = g(fh) = g(fk) = (gf)k = I_B * k = k.
- __Ex 3 b__ Same idea as 3a, just run the proof "backwards."

- __Ex 3 c__ A counterexample would be to set h and k to the identity arrow on the respective sets. E.g., if f is an arrow from A to B where A and B are distinct objects, then h = I_B and k = I_A, so in that case hf = fk since both sides reduce to f, but h != f since although h and f are both identity morphisms, their domains are different.

- __Ex 4__ 1. Invertible since linear 2. Invertible b/c of domain restriction 3. Non invertible 4. Non invertible 5. Invertible

- __Ex 5__ f would send 0 to any of {b, p, q} and 1 to any in {r, s}, so 6 functions in total. Choosing a particular f, say f(0) = x for some x in {b,p,q} and similarly for f(1) = y in {r,s} means g(x) = 0 and g(y) = 1, so only one choice for g.

- __Ex 6__ Let the retraction for f be r : B -> A with rf = I_A, and set t = gr : B -> T. Then tf = (gr)f = g(rf) = g * I_A = g.

- __Ex 7__ Let the section for f be s : B -> A with fs = I_B. Then t1 = t1 * I_B = t1(fs) = (t1 * f)s = (t2 * f)s = t2(fs) = t2 * I_B = t2. 

- __Ex 8__ Let f : A -> B and g : B -> C be the two maps in question, and s1 : B -> A with f * s1 = I_B and s2: C -> B with g * s2 = I_C be the sections of f and g, respectively. Then h = gf : A -> C will have a section s3 := s1 * s2 : C -> A since h * s3 = (gf)(s1 * s2) = g( (f s1) s2) = g(I_B * s2) = g(s2) = I_C, and therefore s3 is a section for h = gf.

- __Ex 9__ Spse f is an arrow from A to B, so the retraction is r : B -> A with rf = I_A, and e = fr : B -> B. Then ee = (fr)(fr) = f(r(fr)) = f((rf)r) = f(I_A * r) = fr = e. For the second part, spse f is an iso and let g = f inverse. Then gf = I_A => gf = rf => g = r by right cancelling f, and thus e = fr = fg = I_B, the idenity arrow on object B.

- __Ex 10__ Spse h = gf, so h is an arrow from A to C, and let f' and g' be the inverses of f and g, respectively. Let h' := f' * g' : C -> A. Then h * h' = (gf)(f' * g') = g(f (f' * g')) = g((f*f') g') =g(I_B)g' = g*g' = I_C, and h' * h = (f' * g')(gf) = f' * (g'(gf)) = f' * (g'*g) * f = f'(I_B) * f = f' * f = I_A, so h is an iso with h' = f' * g', that is, h inverse is g inverse before f inverse.

- __Ex 11__ There are six mappings f : A -> B that are 1-1 and hence invertible, so any of them will suffice to show f is an iso. Since C has only two elements, there can't be an iso from A -> C b/c any mapping from B, which has 3 elements, will fail to be 1-1.

- __Ex 12__ In both cases it is six morphisms since they must be 1-1 to be invertible.

#### Session 4, Division of maps: isomorphisms

- __Ex 2__ f(odd) = neg, f(even) = pos.

- __Ex 3__
	- (a) p doesn't have an inverse since if it did have an inverse, say q, then q from R+ to R+ would be q(x) = x - 1, but then q(
	- (b) 
