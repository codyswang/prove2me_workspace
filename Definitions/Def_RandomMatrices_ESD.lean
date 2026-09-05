import Mathlib

open MeasureTheory
open scoped ENNReal

namespace RandomMatrices

open Classical in
/-- The eigenvalues of a real symmetric `N × N` matrix, listed with multiplicity as a
family indexed by `Fin N` (the family supplied by Mathlib's spectral theorem for
Hermitian matrices).  For a matrix that is not symmetric this is the zero family. -/
noncomputable def eigenvalues {N : ℕ} (A : Matrix (Fin N) (Fin N) ℝ) : Fin N → ℝ :=
  if h : A.IsHermitian then h.eigenvalues else 0

/-- The **empirical spectral distribution** of a real symmetric `N × N` matrix `A`:
the measure `L_N = (1/N) ∑_i δ_{λ_i}` placing mass `1/N` at each of the `N`
eigenvalues of `A`, counted with multiplicity. -/
noncomputable def esd {N : ℕ} (A : Matrix (Fin N) (Fin N) ℝ) : Measure ℝ :=
  (N : ℝ≥0∞)⁻¹ • ∑ i, Measure.dirac (eigenvalues A i)

/-- On a symmetric matrix, `RandomMatrices.eigenvalues` is Mathlib's family of
eigenvalues of a Hermitian matrix. -/
theorem eigenvalues_of_isHermitian {N : ℕ} {A : Matrix (Fin N) (Fin N) ℝ}
    (hA : A.IsHermitian) : eigenvalues A = hA.eigenvalues :=
  dif_pos hA

/-- Integrating against the empirical spectral distribution is averaging over the
eigenvalues: `⟨L_N, g⟩ = (1/N) ∑_i g (λ_i)`. -/
theorem integral_esd {N : ℕ} (A : Matrix (Fin N) (Fin N) ℝ) (g : ℝ → ℝ) :
    (∫ x, g x ∂esd A) = (N : ℝ)⁻¹ * ∑ i, g (eigenvalues A i) := by
  rw [esd, integral_smul_measure,
    integral_finsetSum_measure (fun i _ => integrable_dirac enorm_lt_top)]
  simp [integral_dirac, ENNReal.toReal_inv, smul_eq_mul]

/-- The empirical spectral distribution of an `N × N` matrix with `N ≥ 1` is a
probability measure. -/
theorem isProbabilityMeasure_esd {N : ℕ} (hN : 0 < N) (A : Matrix (Fin N) (Fin N) ℝ) :
    IsProbabilityMeasure (esd A) := by
  constructor
  simp only [esd, Measure.smul_apply, Measure.coe_finsetSum, Finset.sum_apply,
    Measure.dirac_apply_of_mem (Set.mem_univ _), Finset.sum_const, Finset.card_univ,
    Fintype.card_fin, smul_eq_mul, nsmul_eq_mul, mul_one]
  rw [ENNReal.inv_mul_cancel (by exact_mod_cast hN.ne') (by simp)]

end RandomMatrices
