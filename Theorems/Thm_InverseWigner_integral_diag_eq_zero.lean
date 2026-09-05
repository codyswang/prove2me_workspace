import Mathlib
import Definitions.Def_InverseWignerBasic

open Matrix MeasureTheory

namespace InverseWigner

theorem integral_diag_eq_zero {N : ℕ} {B : Matrix (Fin N) (Fin N) ℂ}
    (hB : B.IsHermitian) (hTr : B.trace = 0)
    (μ : Measure (Matrix (Fin N) (Fin N) ℂ)) (hμ : IsHaarUnitary μ) (i : ℕ) :
    ∫ A, diagRe (A * B * Aᴴ) i ∂μ = 0 := by
  sorry

end InverseWigner
