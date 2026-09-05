import Mathlib
import Definitions.Def_TaoRandomMatrix_schattenNorm

set_option autoImplicit false

open scoped Matrix ComplexOrder
open NormedSpace

namespace TaoRandomMatrix

theorem abs_trace_mul_le_schattenNorm_two_mul {n : Type*} [Fintype n] [DecidableEq n]
    (A B : Matrix n n ℂ) :
    ‖(A * B).trace‖ ≤ schattenNorm 2 A * schattenNorm 2 B := by sorry

end TaoRandomMatrix
