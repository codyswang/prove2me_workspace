import Mathlib
import Definitions.Def_InverseWignerBasic

open Matrix MeasureTheory

namespace InverseWigner

theorem integral_diag_mul_diag_eq {N : ℕ} {B : Matrix (Fin N) (Fin N) ℂ}
    (hB : B.IsHermitian) (hTr : B.trace = 0)
    (μ : Measure (Matrix (Fin N) (Fin N) ℂ)) (hμ : IsHaarUnitary μ)
    {i j : ℕ} (hi : i < N) (hj : j < N) (hij : i ≠ j) :
    ∫ A, diagRe (A * B * Aᴴ) i * diagRe (A * B * Aᴴ) j ∂μ
      = -(∑ k : Fin N, hB.eigenvalues k ^ 2) / ((N : ℝ) * ((N : ℝ) ^ 2 - 1)) := by
  sorry

end InverseWigner
