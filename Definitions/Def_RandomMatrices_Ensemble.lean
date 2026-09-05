import Mathlib
import Definitions.Def_RandomMatrices_ESD

open MeasureTheory ProbabilityTheory

namespace RandomMatrices

/-- The index set of the independent entries of a Wigner array: either an
off-diagonal pair `(i, j)` with `i < j`, or a diagonal site `i`. -/
abbrev Site : Type := {p : ℕ × ℕ // p.1 < p.2} ⊕ ℕ

/-- The entry of a Wigner array at a given site: the off-diagonal family `Z` at
`Sum.inl ⟨(i, j), _⟩`, and the diagonal family `Y` at `Sum.inr i`. -/
def entry {Ω : Type*} (Z : ℕ → ℕ → Ω → ℝ) (Y : ℕ → Ω → ℝ) : Site → Ω → ℝ
  | Sum.inl p => Z p.val.1 p.val.2
  | Sum.inr i => Y i

/-- The standing hypotheses on a Wigner array, Anderson–Guionnet–Zeitouni eq. (2.1.1):
`{Z i j}_{i < j}` and `{Y i}` are two independent families of i.i.d. centered real
random variables on the probability space `(Ω, P)`, with `E (Z 0 1)^2 = 1` and with
all absolute moments `E |Z 0 1|^k` and `E |Y 0|^k` finite (`k ≥ 1`). -/
structure IsWignerArray {Ω : Type*} [MeasurableSpace Ω] (P : Measure Ω)
    (Z : ℕ → ℕ → Ω → ℝ) (Y : ℕ → Ω → ℝ) : Prop where
  /-- Each off-diagonal entry used by the matrix is a random variable. -/
  measurable_Z : ∀ i j, i < j → Measurable (Z i j)
  /-- Each diagonal entry is a random variable. -/
  measurable_Y : ∀ i, Measurable (Y i)
  /-- The off-diagonal entries `{Z i j}_{i < j}` together with the diagonal entries
  `{Y i}` form an independent family. -/
  indep : iIndepFun (entry Z Y) P
  /-- The off-diagonal entries are identically distributed. -/
  identDistrib_Z : ∀ i j, i < j → IdentDistrib (Z i j) (Z 0 1) P P
  /-- The diagonal entries are identically distributed. -/
  identDistrib_Y : ∀ i, IdentDistrib (Y i) (Y 0) P P
  /-- The off-diagonal entries are centered. -/
  integral_Z : ∫ ω, Z 0 1 ω ∂P = 0
  /-- The diagonal entries are centered. -/
  integral_Y : ∫ ω, Y 0 ω ∂P = 0
  /-- The off-diagonal entries have unit variance. -/
  integral_sq_Z : ∫ ω, Z 0 1 ω ^ 2 ∂P = 1
  /-- All absolute moments of the off-diagonal entries are finite. -/
  moment_Z : ∀ k : ℕ, 1 ≤ k → Integrable (fun ω => |Z 0 1 ω| ^ k) P
  /-- All absolute moments of the diagonal entries are finite. -/
  moment_Y : ∀ k : ℕ, 1 ≤ k → Integrable (fun ω => |Y 0 ω| ^ k) P

/-- The symmetric `N × N` **Wigner matrix** of Anderson–Guionnet–Zeitouni eq. (2.1.2),
built from a deterministic off-diagonal array `Z` (read only at pairs `i < j`) and a
deterministic diagonal array `Y`: the `(i, j)` entry is `Z i j / √N` for `i < j`,
`Z j i / √N` for `j < i`, and `Y i / √N` for `i = j`. -/
noncomputable def wignerMatrix (Z : ℕ → ℕ → ℝ) (Y : ℕ → ℝ) (N : ℕ) :
    Matrix (Fin N) (Fin N) ℝ :=
  Matrix.of fun i j =>
    if i.val < j.val then Z i.val j.val / Real.sqrt N
    else if j.val < i.val then Z j.val i.val / Real.sqrt N
    else Y i.val / Real.sqrt N

/-- The Wigner matrix is symmetric, hence Hermitian as a real matrix. -/
theorem wignerMatrix_isHermitian (Z : ℕ → ℕ → ℝ) (Y : ℕ → ℝ) (N : ℕ) :
    (wignerMatrix Z Y N).IsHermitian := by
  ext i j
  simp only [Matrix.conjTranspose_apply, star_trivial, wignerMatrix, Matrix.of_apply]
  rcases lt_trichotomy i.val j.val with h | h | h
  · simp [h, not_lt.2 h.le]
  · obtain rfl : i = j := Fin.val_inj.mp h
    simp
  · simp [h, not_lt.2 h.le]

/-- The random Wigner matrix `X_N` of a Wigner array, evaluated at the sample point `ω`. -/
noncomputable def wignerMatrixAt {Ω : Type*} (Z : ℕ → ℕ → Ω → ℝ) (Y : ℕ → Ω → ℝ)
    (N : ℕ) (ω : Ω) : Matrix (Fin N) (Fin N) ℝ :=
  wignerMatrix (fun i j => Z i j ω) (fun i => Y i ω) N

/-- The (random) empirical spectral distribution `L_N` of the Wigner matrix `X_N`. -/
noncomputable def wignerESD {Ω : Type*} (Z : ℕ → ℕ → Ω → ℝ) (Y : ℕ → Ω → ℝ)
    (N : ℕ) (ω : Ω) : Measure ℝ :=
  esd (wignerMatrixAt Z Y N ω)

end RandomMatrices
