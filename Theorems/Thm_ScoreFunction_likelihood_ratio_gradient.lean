import Mathlib.Analysis.Calculus.ParametricIntegral
import Mathlib.Analysis.SpecialFunctions.Log.Deriv

open MeasureTheory Filter
open scoped Topology

namespace ScoreFunction
theorem likelihood_ratio_gradient
    {X : Type*} [MeasurableSpace X] {μ : Measure X}
    {p p' : ℝ → X → ℝ} {f bound : X → ℝ} {θ : ℝ} {s : Set ℝ}
    (hs : s ∈ 𝓝 θ)
    (hp_pos : ∀ᵐ x ∂μ, 0 < p θ x)
    (hF_meas : ∀ᶠ t in 𝓝 θ, AEStronglyMeasurable (fun x => f x * p t x) μ)
    (hF_int : Integrable (fun x => f x * p θ x) μ)
    (hF'_meas : AEStronglyMeasurable (fun x => f x * p' θ x) μ)
    (h_bound : ∀ᵐ x ∂μ, ∀ t ∈ s, |f x * p' t x| ≤ bound x)
    (h_bound_int : Integrable bound μ)
    (h_diff : ∀ᵐ x ∂μ, ∀ t ∈ s, HasDerivAt (fun u => p u x) (p' t x) t) :
    deriv (fun t => ∫ x, f x * p t x ∂μ) θ
      = ∫ x, f x * p θ x * deriv (fun t => Real.log (p t x)) θ ∂μ := by sorry
end ScoreFunction
