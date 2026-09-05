import Mathlib
import Definitions.Def_RandomMatrices_Semicircle
import Definitions.Def_RandomMatrices_Ensemble

open MeasureTheory Filter
open scoped Topology

namespace RandomMatrices
theorem expected_moment_tendsto {Ω : Type*} [MeasurableSpace Ω] (P : Measure Ω)
    [IsProbabilityMeasure P] (Z : ℕ → ℕ → Ω → ℝ) (Y : ℕ → Ω → ℝ)
    (hZY : IsWignerArray P Z Y) (k : ℕ) :
    Tendsto (fun N : ℕ => ∫ ω, (∫ x, x ^ k ∂wignerESD Z Y N ω) ∂P) atTop
      (𝓝 (∫ x, x ^ k ∂semicircle)) := by sorry
end RandomMatrices
