import Mathlib

set_option autoImplicit false

open scoped Matrix ComplexOrder
open NormedSpace

namespace TaoRandomMatrix

theorem trace_mul_pow_le_trace_pow_mul_pow {n : Type*} [Fintype n] [DecidableEq n]
    (j : ℕ) (hj : 1 ≤ j) {A B : Matrix n n ℂ}
    (hA : A.IsHermitian) (hB : B.IsHermitian) :
    ((A * B) ^ 2 ^ j).trace.re ≤ (A ^ 2 ^ j * B ^ 2 ^ j).trace.re := by sorry

end TaoRandomMatrix
