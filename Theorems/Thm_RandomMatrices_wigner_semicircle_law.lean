import Mathlib
import Definitions.Def_RandomMatrices_Semicircle
import Definitions.Def_RandomMatrices_Ensemble

open MeasureTheory Filter
open scoped BoundedContinuousFunction Topology

namespace RandomMatrices
theorem wigner_semicircle_law {Ω : Type*} [MeasurableSpace Ω] (P : Measure Ω)
    [IsProbabilityMeasure P] (Z : ℕ → ℕ → Ω → ℝ) (Y : ℕ → Ω → ℝ)
    (hZY : IsWignerArray P Z Y) (f : ℝ →ᵇ ℝ) (ε : ℝ) (hε : 0 < ε) :
    Tendsto (fun N : ℕ => P {ω | ε < |(∫ x, f x ∂wignerESD Z Y N ω)
        - ∫ x, f x ∂semicircle|}) atTop (𝓝 0) := by sorry
end RandomMatrices
