import Mathlib
import Definitions.Def_InverseWignerBasic

open Matrix MeasureTheory

namespace InverseWigner

theorem integral_diag_sq_eq {N : ℕ} {B : Matrix (Fin N) (Fin N) ℂ}
    (hB : B.IsHermitian) (hTr : B.trace = 0)
    (μ : Measure (Matrix (Fin N) (Fin N) ℂ)) (hμ : IsHaarUnitary μ)
    {i : ℕ} (hi : i < N) :
    ∫ A, diagRe (A * B * Aᴴ) i ^ 2 ∂μ
      = (∑ k : Fin N, hB.eigenvalues k ^ 2) / ((N : ℝ) * ((N : ℝ) + 1)) := by
  sorry

end InverseWigner
