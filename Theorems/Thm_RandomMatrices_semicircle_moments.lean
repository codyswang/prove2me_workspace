import Mathlib
import Definitions.Def_RandomMatrices_Semicircle

open MeasureTheory

namespace RandomMatrices
theorem semicircle_moments (k : ℕ) (hk : 1 ≤ k) :
    (∫ x, x ^ (2 * k) ∂semicircle) = (catalan k : ℝ) ∧
      (∫ x, x ^ (2 * k + 1) ∂semicircle) = 0 := by sorry
end RandomMatrices
