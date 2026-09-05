import Mathlib
import Definitions.Def_InverseWignerBasic

open Matrix MeasureTheory

namespace InverseWigner

theorem diag_conj_eq {N : ℕ} {B : Matrix (Fin N) (Fin N) ℂ} (hB : B.IsHermitian)
    (A : Matrix (Fin N) (Fin N) ℂ) (i : Fin N) :
    ((A * B * Aᴴ) i i).re =
      ∑ k : Fin N,
        Complex.normSq ((A * (hB.eigenvectorUnitary : Matrix (Fin N) (Fin N) ℂ)) i k)
          * hB.eigenvalues k := by
  sorry

end InverseWigner
