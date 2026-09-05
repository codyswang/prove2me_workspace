import Mathlib
import Definitions.Def_InverseWignerBasic

open Matrix MeasureTheory

namespace InverseWigner

theorem gaussian_moment (v : NNReal) (d : ℕ) :
    ∫ x, x ^ d ∂ProbabilityTheory.gaussianReal 0 v =
      if d % 2 = 1 then 0 else (v : ℝ) ^ (d / 2) * (Nat.doubleFactorial (d - 1) : ℝ) := by
  sorry

end InverseWigner
