# monad-deform

## Deformations of monads and monad algebras

### Deformations of rings and their modules
$$
A\ \ :=\ \ \mathbb{R}[x, y, z]\ \big/\ (x^2+y^2-z)
$$
[...]
$$
\mathbb{R}[t]\ \longrightarrow\ A
\ \ \ \ \ \ \text{taking}\ \ \ \ \ \ 
t\ \mapsto\ z.
$$
If we evaluate $t$ at a particular choice of value $t_0\in\mathbb{R}$, then as a consequence we project the whole algebra $A$ down to a smaller algerba
$$
A_0\ \ =\ \ \mathbb{R}[x, y]\ \big/\ (x^2+y^2-t_0).
$$
We think of $A$ as a *family of algebras* varying along the parameter $t:=z$. We often interpret this family as *deformation* of the particular algebra $A_0$ that occurs when $t=t_0$.

Note that what we've really described here is the exitence of a commutative diagram:

<div align="center">
  <img src="./images/alg_def.png" alt="ring_deformation" width="20%">
</div>

Note that this is a very different thing than deforming a module of a given ring. Suppose that we have some ring that's not necessarily an $\mathbb{R}$-algebra. Let's call this ring $R$. We can also consider *deformations of* $R$-*modules* in which the ring $R$ is fixed and does not deform.

[...]

### Directions of arrows
We get a second interpretation of this situation with the rings $A$ and $A_0$ if we reverse every arrow. 

### Rings as monads