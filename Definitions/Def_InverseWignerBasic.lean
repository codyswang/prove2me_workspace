import Mathlib

namespace InverseWigner

/-- `spectralMoment hB d` is the `d`-th moment of the empirical eigenvalue distribution
of the rescaled matrix `N^{-1/2} B`, i.e.
`(1/N) * Tr (N^{-1/2} B)^d = (1/N) * P_d (λ_1/√N, …, λ_N/√N)`,
where `λ_1, …, λ_N` are the eigenvalues of the Hermitian matrix `B` and `P_d` is the
`d`-th power-sum symmetric polynomial. -/
noncomputable def spectralMoment {N : ℕ} {B : Matrix (Fin N) (Fin N) ℂ}
    (hB : B.IsHermitian) (d : ℕ) : ℝ :=
  ((N : ℝ))⁻¹ * ∑ k : Fin N, (hB.eigenvalues k / Real.sqrt (N : ℝ)) ^ d

/-- `diagRe X i` is the real part of the `i`-th diagonal entry of the matrix `X`,
extended by `0` when the index `i` is out of range. For a Hermitian `X` and `i < N`
this is exactly the (necessarily real) diagonal entry `X i i`. -/
noncomputable def diagRe {N : ℕ} (X : Matrix (Fin N) (Fin N) ℂ) (i : ℕ) : ℝ :=
  if h : i < N then (X ⟨i, h⟩ ⟨i, h⟩).re else 0

/-- The product (Borel) measurable-space structure on matrices, inherited from the
function space `m → n → α`. `Matrix m n α` is definitionally `m → n → α`, but Mathlib
deliberately does not propagate instances through the synonym, so the measurable-space
structure used to speak about random matrices has to be named explicitly. -/
instance instMeasurableSpaceMatrix {m n : Type*} {α : Type*} [MeasurableSpace α] :
    MeasurableSpace (Matrix m n α) :=
  inferInstanceAs (MeasurableSpace (m → n → α))

/-- `IsHaarUnitary μ` says that `μ` is the Haar (uniform) probability law of a random
`N × N` unitary matrix, viewed as a measure on all of `Matrix (Fin N) (Fin N) ℂ`:

1. `μ` is a probability measure;
2. `μ` gives full mass to the unitary group `U(N)`;
3. `μ` is invariant under left translation by any fixed unitary;
4. `μ` is invariant under right translation by any fixed unitary.

Conditions 3 and 4 are both listed because Haar measure on the compact group `U(N)`
is bi-invariant; by uniqueness of Haar measure they pin `μ` down exactly. -/
def IsHaarUnitary {N : ℕ} (μ : MeasureTheory.Measure (Matrix (Fin N) (Fin N) ℂ)) : Prop :=
  MeasureTheory.IsProbabilityMeasure μ ∧
    μ {A | A ∈ Matrix.unitaryGroup (Fin N) ℂ} = 1 ∧
    (∀ V ∈ Matrix.unitaryGroup (Fin N) ℂ, μ.map (fun A => V * A) = μ) ∧
    (∀ V ∈ Matrix.unitaryGroup (Fin N) ℂ, μ.map (fun A => A * V) = μ)

end InverseWigner
