import Mathlib
import Definitions.Def_TaoRandomMatrix_schattenNormEven

set_option autoImplicit false

open scoped Matrix ComplexOrder
open NormedSpace

namespace TaoRandomMatrix

theorem schattenNormEven_mul_le {n : Type*} [Fintype n] [DecidableEq n]
    (i : ℕ) (A B : Matrix n n ℂ) :
    schattenNormEven (2 ^ i) (A * B)
      ≤ schattenNormEven (2 ^ (i + 1)) A * schattenNormEven (2 ^ (i + 1)) B := by sorry

end TaoRandomMatrix
