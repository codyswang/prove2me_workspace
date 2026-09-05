import Mathlib

set_option autoImplicit false

open scoped Matrix ComplexOrder

namespace TaoRandomMatrix

/-- The `p`-Schatten norm of a square complex matrix for an **even** exponent `p`:
`‖A‖_p = (tr ((A * Aᴴ) ^ (p / 2))) ^ (1 / p)`, where `p / 2` is natural-number division
(exact for even `p`) and the trace of the positive semi-definite matrix `(A * Aᴴ) ^ (p / 2)`
is taken as a real number via its real part. -/
noncomputable def schattenNorm {n : Type*} [Fintype n] [DecidableEq n]
    (p : ℕ) (A : Matrix n n ℂ) : ℝ :=
  (((A * Aᴴ) ^ (p / 2)).trace.re) ^ ((p : ℝ)⁻¹)

end TaoRandomMatrix
