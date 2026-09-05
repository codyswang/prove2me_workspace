import Mathlib
import Definitions.Def_InverseWignerBasic

open Matrix MeasureTheory

namespace InverseWigner

theorem tendsto_joint_moment_sub_prod
    (B : ∀ N : ℕ, Matrix (Fin N) (Fin N) ℂ)
    (hHerm : ∀ N, (B N).IsHermitian)
    (hTrace : ∀ N, (B N).trace = 0)
    (γ : ℕ → ℝ)
    (hγ : ∀ d : ℕ, Filter.Tendsto (fun N : ℕ => spectralMoment (hHerm N) d)
      Filter.atTop (nhds (γ d)))
    (μ : ∀ N : ℕ, Measure (Matrix (Fin N) (Fin N) ℂ))
    (hμ : ∀ N, IsHaarUnitary (μ N))
    (r : ℕ) (p : ℕ → ℕ) :
    Filter.Tendsto
      (fun N : ℕ =>
        (∫ A, ∏ i ∈ Finset.range r, diagRe (A * B N * Aᴴ) i ^ p i ∂(μ N))
          - ∏ i ∈ Finset.range r, ∫ A, diagRe (A * B N * Aᴴ) i ^ p i ∂(μ N))
      Filter.atTop (nhds 0) := by
  sorry

end InverseWigner
