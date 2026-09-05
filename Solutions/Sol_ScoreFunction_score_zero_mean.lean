import Mathlib.Analysis.Calculus.ParametricIntegral
import Mathlib.Analysis.SpecialFunctions.Log.Deriv
import Theorems.Thm_ScoreFunction_likelihood_ratio_gradient

open MeasureTheory Filter
open scoped Topology

theorem solution
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
    ∫ x, p θ x * deriv (fun t => Real.log (p t x)) θ ∂μ = 0 := by
  have key := ScoreFunction.likelihood_ratio_gradient (f := fun _ => (1 : ℝ)) (p := p) (p' := p')
    (bound := bound) hs hp_pos (by simpa using hp_meas) (by simpa using hp_int)
    (by simpa using hp'_meas) (by simpa using h_bound) h_bound_int h_diff
  simp only [one_mul] at key
  rw [← key]
  have hEq : (fun t => ∫ x, p t x ∂μ) =ᶠ[𝓝 θ] fun _ => (1 : ℝ) :=
    eventually_of_mem hs fun t ht => h_norm t ht
  rw [hEq.deriv_eq, deriv_const]
