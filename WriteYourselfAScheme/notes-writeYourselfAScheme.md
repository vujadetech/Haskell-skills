
<table >
<tbody><tr>
<th>Operator(s)
</th>
<th>Precedence
</th>
<th>Associativity
</th>
<th>Description
</th></tr>
<tr>
<td><code>.</code>
</td>
<td rowspan="2">9
</td>
<td>right
</td>
<td>function composition
</td></tr>
<tr>
<td><code>!!</code>
</td>
<td>left
</td>
<td>list indexing
</td></tr>
<tr>
<td><code>^</code>, <code>^^</code>, <code>**</code>
</td>
<td>8
</td>
<td>right
</td>
<td>exponentiation (integer, fractional, and floating-point)
</td></tr>
<tr>
<td><code>*</code>, <code>/</code>
</td>
<td>7
</td>
<td>left
</td>
<td>multiplication, division
</td></tr>
<tr>
<td><code>+</code>, <code>-</code>
</td>
<td>6
</td>
<td>left
</td>
<td>addition, subtraction
</td></tr>
<tr>
<td><code>:</code>
</td>
<td rowspan="2">5
</td>
<td>right
</td>
<td><i>cons</i> (list construction)
</td></tr>
<tr>
<td><code>++</code>
</td>
<td>right
</td>
<td>list concatenation
</td></tr>
<tr>
<td><code>`elem`</code>, <code>`notElem`</code>
</td>
<td rowspan="2">4
</td>
<td>left
</td>
<td>list membership
</td></tr>
<tr>
<td><code>==</code>, <code>/=</code>, <code>&lt;</code>, <code>&lt;=</code>, <code>&gt;=</code>, <code>&gt;</code>
</td>
<td>left
</td>
<td>equality, inequality, and other relation operators
</td></tr>
<tr>
<td><code>&amp;&amp;</code>
</td>
<td>3
</td>
<td>right
</td>
<td>logical and
</td></tr>
<tr>
<td><code>||</code>
</td>
<td>2
</td>
<td>right
</td>
<td>logical or
</td></tr>
<tr>
<td><code>&gt;&gt;</code>, <code>&gt;&gt;=</code>
</td>
<td rowspan="2">1
</td>
<td>left
</td>
<td>monadic bind ignoring the return value, monadic bind piping value to the next function
</td></tr>
<tr>
<td><code>=&lt;&lt;</code>
</td>
<td>right
</td>
<td>reverse monadic bind (same as above, but arguments reversed)
</td></tr>
<tr>
<td><code>$</code>
</td>
<td>0
</td>
<td>right
</td>
<td>infix function application (<code>f $ x</code> is the same as <code>f x</code>, but right-associative instead of left)
</td></tr></tbody></table>