import Mathlib
import Definitions.Def_TaoRandomMatrix_schattenNorm

set_option autoImplicit false

open scoped Matrix ComplexOrder
open NormedSpace

namespace TaoRandomMatrix

theorem abs_trace_prod_le_prod_schattenNorm {n : Type*} [Fintype n] [DecidableEq n]
    (j : ℕ) (hj : 1 ≤ j) (A : Fin (2 ^ j) → Matrix n n ℂ) :
    ‖(List.ofFn A).prod.trace‖ ≤ ∏ i, schattenNorm (2 ^ j) (A i) := by sorry

end TaoRandomMatrix
