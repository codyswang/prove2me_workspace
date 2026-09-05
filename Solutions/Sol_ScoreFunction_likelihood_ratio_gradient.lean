import Mathlib.Analysis.Calculus.ParametricIntegral
import Mathlib.Analysis.SpecialFunctions.Log.Deriv

open MeasureTheory Filter
open scoped Topology

theorem solution
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
      = ∫ x, f x * p θ x * deriv (fun t => Real.log (p t x)) θ ∂μ := by
  have hderiv : HasDerivAt (fun t => ∫ x, f x * p t x ∂μ) (∫ x, f x * p' θ x ∂μ) θ :=
    (hasDerivAt_integral_of_dominated_loc_of_deriv_le (bound := bound)
      (F' := fun t x => f x * p' t x) hs hF_meas hF_int hF'_meas
      (by simpa using h_bound) h_bound_int
      (h_diff.mono fun x hx t ht => (hx t ht).const_mul (f x))).2
  rw [hderiv.deriv]
  refine (integral_congr_ae ?_).symm
  filter_upwards [hp_pos, h_diff] with x hx hdx
  have hlog : HasDerivAt (fun t => Real.log (p t x)) (p' θ x / p θ x) θ :=
    (hdx θ (mem_of_mem_nhds hs)).log hx.ne'
  rw [hlog.deriv]
  field_simp
