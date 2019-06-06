### Category Theory for Programmers by Bartosz MIlewski, my solutions to non-code/open ended questions

#### Part 1, Category: The essence of composition


Challenge 4. If the www is a category, say C(W), the objects could be sites/urls, and arrows links between them. In this case, every site would need an identity arrow/link back to itself. Refreshing the page could then be considered invoking the identity arrow/morphism for any site. As to composition, following two links in succession would be the most natural definition. This would require that if a site A had a link to B, and B had a link to C, then A must have a link to C. So if one limited the objects to those which satisfied the closure property it would be a category. This would mean that there could be more than one category, depending on which site among A, B and C were deleted from Ob(W) to ensure composition.

Challenge 5. If friendships are morphisms, they would need to compose. Although that may be true in some cases, it isn't in general. For example, suppose Alice is friends with Bob, and Bob is friends with Carol. Then Alice must be friends with Carol, which might not be the case. So if one limited the objects to sets of people who whose arrows composed, then that set of objects and arrows would form a category.

Challenge 6. For a directed graph G with Ob(G) = nodes of G and Arr(G) = directed edges between nodes, the identity arrow would be an edge from a node to itself. So all nodes would need to have such an edge/loop. For each directed edge e1 = (n1, n2) for nodes n1, n2 and e2 = (n2, n3) there must exist an edge e3 = (n1, n3). So any graph could be extended to be a member of the Graph category by adding a loop to each node that doesn't already have one, and likewise adding an edge w = (a, c) for each u = (a, b) and v = (b, c) in case (a, c) isn't already an edge. The resulting set of graphs would form a category.


#### Part 2, Types and Functions


Challenge 5. There are 4 rows in each function and each row can have one of two values, so there are 2^4 = 16 functions in all. E.g. Id\_x (identity on first variable), Id\_y (same but for second variable y, or whatever it's called))Or, Xor, And, Nand, yada yada. You can enumerate them all by listing each of the 16 words of length 4 over {T, F}.

Challenge 6. 


#### Part 