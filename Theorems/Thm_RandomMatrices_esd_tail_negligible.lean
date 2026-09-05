import Mathlib
import Definitions.Def_RandomMatrices_Ensemble

open MeasureTheory Filter
open scoped Topology

namespace RandomMatrices
theorem esd_tail_negligible {Ω : Type*} [MeasurableSpace Ω] (P : Measure Ω)
    [IsProbabilityMeasure P] (Z : ℕ → ℕ → Ω → ℝ) (Y : ℕ → Ω → ℝ)
    (hZY : IsWignerArray P Z Y) (k : ℕ) (ε : ℝ) (hε : 0 < ε) :
    Tendsto (fun N : ℕ => P {ω | ε < ∫ x in {x : ℝ | 5 < |x|}, |x| ^ k
        ∂wignerESD Z Y N ω}) atTop (𝓝 0) := by sorry
end RandomMatrices
