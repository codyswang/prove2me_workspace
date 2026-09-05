import Mathlib
import Definitions.Def_InverseWignerBasic

open Matrix MeasureTheory

namespace InverseWigner

theorem tendsto_diag_moment
    (B : ∀ N : ℕ, Matrix (Fin N) (Fin N) ℂ)
    (hHerm : ∀ N, (B N).IsHermitian)
    (hTrace : ∀ N, (B N).trace = 0)
    (γ : ℕ → ℝ)
    (hγ : ∀ d : ℕ, Filter.Tendsto (fun N : ℕ => spectralMoment (hHerm N) d)
      Filter.atTop (nhds (γ d)))
    (μ : ∀ N : ℕ, Measure (Matrix (Fin N) (Fin N) ℂ))
    (hμ : ∀ N, IsHaarUnitary (μ N))
    (i d : ℕ) :
    Filter.Tendsto (fun N : ℕ => ∫ A, diagRe (A * B N * Aᴴ) i ^ d ∂(μ N))
      Filter.atTop
      (nhds (∫ x, x ^ d ∂ProbabilityTheory.gaussianReal 0 (γ 2).toNNReal)) := by
  sorry

end InverseWigner
