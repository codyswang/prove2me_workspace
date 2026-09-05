import Mathlib
import Definitions.Def_RandomMatrices_ESD

open MeasureTheory

namespace RandomMatrices
theorem esd_moment_eq_trace {N : ℕ} (hN : 0 < N) (A : Matrix (Fin N) (Fin N) ℝ)
    (hA : A.IsHermitian) (k : ℕ) :
    (∫ x, x ^ k ∂esd A) = (N : ℝ)⁻¹ * (A ^ k).trace := by sorry
end RandomMatrices
