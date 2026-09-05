import Mathlib.Analysis.Calculus.ParametricIntegral
import Mathlib.Analysis.SpecialFunctions.Log.Deriv

open MeasureTheory Filter
open scoped Topology

namespace ScoreFunction
theorem score_zero_mean
    {X : Type*} [MeasurableSpace X] {μ : Measure X}
    {p p' : ℝ → X → ℝ} {bound : X → ℝ} {θ : ℝ} {s : Set ℝ}
    (hs : s ∈ 𝓝 θ)
    (hp_pos : ∀ᵐ x ∂μ, 0 < p θ x)
    (hp_meas : ∀ᶠ t in 𝓝 θ, AEStronglyMeasurable (p t) μ)
    (hp_int : Integrable (p θ) μ)
    (hp'_meas : AEStronglyMeasurable (p' θ) μ)
    (h_bound : ∀ᵐ x ∂μ, ∀ t ∈ s, |p' t x| ≤ bound x)
    (h_bound_int : Integrable bound μ)
    (h_diff : ∀ᵐ x ∂μ, ∀ t ∈ s, HasDerivAt (fun u => p u x) (p' t x) t)
    (h_norm : ∀ t ∈ s, ∫ x, p t x ∂μ = 1) :
    ∫ x, p θ x * deriv (fun t => Real.log (p t x)) θ ∂μ = 0 := by sorry
end ScoreFunction
