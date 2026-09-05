# Gap analysis: Tao, *Topics in Random Matrix Theory* (AMS GSM 132, 2012)

Which numbered results of the book are **not** available in Mathlib or on Prove2me.

## Baseline checked

- **Mathlib**: rev `0df444a360eaa60ab8c11dca51a86af692955474` (Lean `v4.33.1`) — Prove2me's default
  environment. Sparse checkout of `Mathlib/`, grepped by declaration name and docstring.
- **Prove2me**: full mission list (130 missions) and `GET /theorems?q=` keyword search over
  titles, Lean names and natural-language statements.

There is **no random-matrix-theory mission** on the platform, and Mathlib has no random-matrix
file: `Wigner`, `semicircle` (as a spectral law), `Marchenko`, `circular law`, `TracyWidom`,
`GUE`, `Ginibre` (as an ensemble), `Weingarten`, `empiricalSpectral`, `StieltjesTransform`,
and free-probability names all return zero declarations.

## Already covered (do not re-formalize)

| Book result | Where |
|---|---|
| Thm 1.3.1 spectral theorem | Mathlib `Matrix.IsHermitian.spectral_theorem`, `Analysis/Matrix/Spectrum.lean`; sorted eigenvalues `eigenvalues₀`, `eigenvalues₀_antitone` |
| Thm 1.3.2 Courant–Fischer min-max | Prove2me `courant_fischer` (**Proved**), plus `hermitian_kth_eigenvalue_witness`, `hermitian_kth_eigenvalue_dual_witness`, `hermitian_eigenspan_decomp` — from the Sensitivity Conjecture mission |
| Ex. 1.3.14 Cauchy interlacing | Prove2me `cauchy_interlacing_sorted` (**Proved**) |
| Thm 1.3.9 SVD | Mathlib `Analysis/InnerProductSpace/SingularValues.lean` (definition + rank support) |
| §1.2 Stirling's formula | Mathlib `Analysis/SpecialFunctions/Stirling.lean` |
| Ex. 1.1.1 / 1.1.26 Borel–Cantelli | Mathlib `Probability/BorelCantelli.lean` |
| Thm 2.1.3 Chernoff, Ex. 2.1.4 Hoeffding, Thm 2.1.5 Azuma | Mathlib `Probability/Moments/Basic.lean` (Chernoff), `Moments/SubGaussian.lean` (Hoeffding, Azuma–Hoeffding); Prove2me `hoeffding_two_sided`, `bounded_diff_martingale_two_sided`, many bandit-mission variants |
| Thm 2.1.8 strong LLN | Mathlib `Probability/StrongLaw.lean` |
| Thm 2.2.1 CLT (iid, scalar) | Mathlib `Probability/CentralLimitTheorem.lean` |
| Thm 2.2.4 Lévy continuity | Mathlib `MeasureTheory/Measure/LevyConvergence.lean` |
| Ex. 2.5.10 Gelfand–Naimark | Mathlib `Analysis/CStarAlgebra/GelfandNaimarkSegal.lean` |
| §3.1 Brownian motion (existence) | Mathlib `Probability/BrownianMotion/` |
| Catalan numbers $C_k$ (used throughout §2.3–2.5) | Mathlib `Combinatorics/Enumerative/Catalan/` |
| Trace-power = closed-walk sum (the moment method's combinatorial core) | Prove2me `trace_pow_eq_walk` (**Proved**), `buchholz_walk_sum` (Definition) — matrix-completion missions |

Partial: Talagrand-type machinery exists on the platform as `TalagrandCore.*` (Bennett/CGF
lemmas for the Candès–Romberg application), but **not** Thm 2.1.13 itself.

## Unproven in both — the gap list

Ordered by leverage: earlier items are prerequisites for later ones.

### Tier 1 — matrix perturbation (§1.3), elementary, no probability

1. **Weyl inequalities (1.54)**: $\lambda_{i+j-1}(A+B) \le \lambda_i(A)+\lambda_j(B)$ for
   $i,j\ge 1$, $i+j-1\le n$, $A,B$ Hermitian. Dual form (Ex. 1.3.5):
   $\lambda_{i+j-n}(A+B)\ge\lambda_i(A)+\lambda_j(B)$.
2. **Ky Fan inequality (1.55)**: $\sum_{i\le k}\lambda_i(A+B)\le\sum_{i\le k}\lambda_i(A)+\sum_{i\le k}\lambda_i(B)$.
3. **Lidskii inequality** and its dual (Ex. 1.3.5).
4. **$p$-Wielandt–Hoffman inequality (1.64)**:
   $\|(\lambda_i(A+B)-\lambda_i(A))_{i=1}^n\|_{\ell^p_n}\le\|B\|_{S^p}$, $1\le p\le\infty$;
   the $p=2$ case is what §2.4 uses.
5. **Ex. 1.3.3 Wielandt minimax formula** (the $k$-tuple generalization of Courant–Fischer;
   Prove2me has the single-index version only).
6. **Prop. 1.3.4 extremal partial trace**: $\sum_{i\le k}\lambda_i(A)=\sup_V \mathrm{tr}(A|_V)$
   over $k$-dimensional $V$.

These are the cheapest wins: Courant–Fischer is already **Proved** on the platform, so
(1)–(6) are short reductions from it. Everything in §2.3–§2.4 depends on them.

### Tier 2 — scalar concentration and CLT refinements (§2.1–§2.2)

7. **Thm 2.1.10 McDiarmid's inequality** (bounded differences). Platform has
   `bounded_diff_martingale_two_sided`; the named inequality itself is absent from both.
8. **Thm 2.1.12 Gaussian concentration for Lipschitz functions**:
   $\mathbb{P}(|F(X)-\mathbb{E}F(X)|\ge\lambda)\le Ce^{-c\lambda^2}$ for $1$-Lipschitz $F$,
   $X\sim N(0,1)^n$.
9. **Lemma 2.1.16 Gaussian log-Sobolev inequality** (the proof route for 8).
10. **Thm 2.1.13 Talagrand concentration inequality** for convex Lipschitz $F$ of independent
    bounded variables, both around the median and the mean (2.18)/(2.19). Used constantly in
    §2.3, §2.7, §2.8.
11. **Cor. 2.1.19 distance from a random vector to a subspace** — concentration of
    $\mathrm{dist}(X,V)$; the workhorse of §2.7.
12. **Thm 2.2.8 / 2.2.11 / 2.2.14 / 2.2.15 Berry–Esseen theorem**, in the full and weak forms:
    $\mathbb{P}(Z_n<a)=\mathbb{P}(G<a)+O(n^{-1/2}\mathbb{E}|X|^3)$ uniformly in $a$.
13. **Thm 2.2.9 Carleman continuity theorem**: for uniformly subgaussian $X_n$, convergence of
    all moments $\Leftrightarrow$ convergence in distribution. This is the theorem that makes
    the moment method legitimate — the single highest-leverage missing prerequisite for §2.3–§2.5.
14. **Thm 2.2.13 Stein continuity theorem**.
15. **Ex. 2.2.15 Lindeberg CLT** (Mathlib has the iid CLT only). Related platform items
    (`Martingale.clt_of_mds`, `MarkovChainCLT.martingaleCLT_chain`) are still **Open**.

### Tier 3 — operator norm of random matrices (§2.3)

16. **Thm 2.3.8** (Bai–Yin-type bound $\|M\|_{op}=O(\sqrt n)$ under a second-moment condition).
17. **Thm 2.3.16 moment computation**: for a real symmetric matrix with jointly independent
    mean-zero, variance-one upper-triangular entries bounded by $o(\sqrt n)$ and even $k$,
    $\mathbb{E}\,\mathrm{tr}(M^k)=(C_{k/2}+o_k(1))\,n^{k/2+1}$, $C_{k/2}$ the Catalan number.
    Mathlib has Catalan numbers and Prove2me has `trace_pow_eq_walk`, so the missing content is
    exactly the non-crossing-pairing count.
18. **Thm 2.3.21 improved moment bound** (removing the logarithm).
19. **Prop. 2.3.19 lower Bai-Yin theorem**.
20. **Thm 2.3.23 weak Bai–Yin upper bound**: $\|M\|_{op}\le(2+\varepsilon)\sqrt n$ a.a.s. under
    a finite fourth moment.
21. **Thm 2.3.24 strong Bai–Yin upper bound**: $\limsup_n \|M_n\|_{op}/\sqrt n\le 2$ a.s.
22. **Cor. 2.3.5 / 2.3.6 upper tail estimates** for iid and Wigner ensembles;
    **Lemma 2.3.4 volume packing / epsilon-net argument**.

### Tier 4 — the semicircular law (§2.4)

23. **Thm 2.4.2 Wigner semicircular law**: the ESDs of $\frac{1}{\sqrt n}M_n$ converge almost
    surely to $\mu_{sc}=\frac{1}{2\pi}(4-|x|^2)_+^{1/2}\,dx$. *The headline theorem of the book
    and the natural mission goal.*
24. **Lemma 2.4.3 / Ex. 2.4.3 / Ex. 2.4.4** ESD stability under small-Frobenius-norm and
    small-rank perturbations (reductions from Tier 1 items 1 and 4).
25. **Ex. 2.4.10 Stieltjes continuity theorem** — convergence of Stieltjes transforms implies
    vague convergence of measures; the resolvent route to item 23. Nothing on either system
    defines the Stieltjes transform of a measure.

### Tier 5 — free probability (§2.5)

26. **Thm 2.5.8 spectral theorem for bounded self-adjoint elements** of a von Neumann /
    tracial $W^*$ algebra (Mathlib has the continuous functional calculus but not this
    packaging).
27. **Prop. 2.5.21 asymptotic freeness of Wigner matrices**.
28. **Ex. 2.5.24 free central limit theorem**: free sums converge in moments to a semicircular
    element. Requires a definition of free independence, absent from both systems.

### Tier 6 — Gaussian ensembles (§2.6)

29. **Ginibre formula (2.127)**: the GUE eigenvalue density
    $\rho_n(\lambda)=\frac{1}{(2\pi)^{n/2}}e^{-|\lambda|^2/2}|\Delta_n(\lambda)|^2$.
30. **Lemma 2.6.5 determinantal integration formula** — the algebraic core of determinantal
    processes; reusable and self-contained.
31. Ginibre-ensemble density (2.131) and the eigenvalue-distinctness codimension count (Ex. 2.6.1).

### Tier 7 — least singular value (§2.7) and the circular law (§2.8)

32. **Thm 2.7.1 lower bound** and **Prop. 2.7.3 Erdős Littlewood–Offord inequality**
    (nothing matching "Littlewood-Offord" exists on either system).
33. **Thm 2.7.5 / 2.7.7 lower and upper tail estimates for $\sigma_n(M)$** at scale $1/\sqrt n$.
34. **Thm 2.7.8** convergence in distribution of $\sqrt n\,\sigma_n(M)$ for iid Bernoulli $M$.
35. **Thm 2.8.1 circular law**: the spectral measure of $\frac{1}{\sqrt n}M_n$ converges in
    probability and almost surely to $\mu_{circ}=\frac1\pi 1_{|z|\le1}\,dx\,dy$.
36. **Thm 2.8.3 logarithmic potential continuity theorem** and **Thm 2.8.4** (Girko's
    Hermitization route to item 35).

### Tier 8 — related articles (Chapter 3)

37. **Thm 3.1.16 Dyson Brownian motion**:
    $d\lambda_i=dB_i+\sum_{j\ne i}\frac{dt}{\lambda_i-\lambda_j}+\dots$
38. **Thm 3.1.18 Johansson formula** for the spectral density of $A_0+t^{1/2}G$, $G$ from GUE.
39. **§3.2 Golden–Thompson inequality** $\mathrm{tr}\,e^{A+B}\le\mathrm{tr}(e^Ae^B)$ for
    Hermitian $A,B$ — absent from both, entirely finite-dimensional, and a clean standalone
    target (it is also the standard route to matrix Chernoff bounds, which Mathlib lacks too).
40. **Lemmas 3.3.1 / 3.3.2** bulk and edge asymptotics of the GUE kernel $K_n$ (Dyson and Airy
    kernels); **§3.4** mesoscopic structure of GUE eigenvalues.

## Recommended starting points

- **Item 39, Golden–Thompson**: self-contained, finite-dimensional, no probability, no new
  definitions beyond Mathlib's matrix exponential. Best single-theorem target.
- **Tier 1 (items 1–6)**: each is a short reduction from the platform's already-proved
  `courant_fischer` / `hermitian_kth_eigenvalue_*`, and every later tier cites them.
- **Item 13, Carleman continuity theorem** together with **item 17, Thm 2.3.16**: these two are
  the whole moment method. With them plus Tier 1, the semicircular law (item 23) becomes a
  reachable mission goal rather than a research project.
- **Item 30, determinantal integration formula**: isolated from the rest, reusable, and needs no
  probability theory.

## Method notes

- The Prove2me `q=` search is substring-based, so short queries (`GUE`, `Weyl`) return large
  volumes of unrelated hits; the counts above come from reading the matched declaration names,
  not from the totals.
- Mathlib was checked at the pinned environment rev `0df444a`, not master; everything listed as
  present above (including the singular-value API and the CLT) is present at the pinned rev.
