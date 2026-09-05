import Mathlib

set_option autoImplicit false

open scoped Matrix ComplexOrder
open NormedSpace

namespace TaoRandomMatrix

theorem tendsto_trace_pow_exp_smul {n : Type*} [Fintype n] [DecidableEq n]
    {A B : Matrix n n ℂ} (hA : A.IsHermitian) (hB : B.IsHermitian) :
    Filter.Tendsto
      (fun j : ℕ =>
        ((exp (((2 : ℂ) ^ j)⁻¹ • A) * exp (((2 : ℂ) ^ j)⁻¹ • B)) ^ 2 ^ j).trace)
      Filter.atTop (nhds (exp (A + B)).trace) := by sorry

end TaoRandomMatrix
