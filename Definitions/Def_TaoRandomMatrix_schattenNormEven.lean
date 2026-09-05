import Mathlib

set_option autoImplicit false

open scoped Matrix ComplexOrder

namespace TaoRandomMatrix

/-- The `2 * k`-Schatten norm of a square complex matrix:
`schattenNormEven k A = ‖A‖_{2k} = (tr ((A * Aᴴ) ^ k)) ^ (1 / (2 * k))`.

The index is the half-exponent `k`, not the exponent itself, so the matrix power is a
natural-number power and the exponent `2 * k` is even by construction; the trace of the
positive semi-definite matrix `(A * Aᴴ) ^ k` is taken as a real number via its real part. -/
noncomputable def schattenNormEven {n : Type*} [Fintype n] [DecidableEq n]
    (k : ℕ) (A : Matrix n n ℂ) : ℝ :=
  (((A * Aᴴ) ^ k).trace.re) ^ (((2 * k : ℕ) : ℝ)⁻¹)

end TaoRandomMatrix
