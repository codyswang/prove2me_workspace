import Mathlib
import Definitions.Def_TaoRandomMatrix_schattenNormEven

set_option autoImplicit false

open scoped Matrix ComplexOrder
open NormedSpace

namespace TaoRandomMatrix

theorem abs_trace_mul_le_schattenNormEven_one_mul {n : Type*} [Fintype n] [DecidableEq n]
    (A B : Matrix n n ℂ) :
    ‖(A * B).trace‖ ≤ schattenNormEven 1 A * schattenNormEven 1 B := by sorry

end TaoRandomMatrix
