import Mathlib
import Definitions.Def_TaoRandomMatrix_schattenNormEven

set_option autoImplicit false

open scoped Matrix ComplexOrder
open NormedSpace

namespace TaoRandomMatrix

theorem abs_trace_prod_le_prod_schattenNormEven {n : Type*} [Fintype n] [DecidableEq n]
    (i : ℕ) (A : Fin (2 ^ (i + 1)) → Matrix n n ℂ) :
    ‖(List.ofFn A).prod.trace‖ ≤ ∏ l, schattenNormEven (2 ^ i) (A l) := by sorry

end TaoRandomMatrix
