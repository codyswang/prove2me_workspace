import Mathlib
import Definitions.Def_TaoRandomMatrix_schattenNorm

set_option autoImplicit false

open scoped Matrix ComplexOrder
open NormedSpace

namespace TaoRandomMatrix

theorem schattenNorm_mul_le {n : Type*} [Fintype n] [DecidableEq n]
    (j : ℕ) (hj : 1 ≤ j) (A B : Matrix n n ℂ) :
    schattenNorm (2 ^ j) (A * B)
      ≤ schattenNorm (2 ^ (j + 1)) A * schattenNorm (2 ^ (j + 1)) B := by sorry

end TaoRandomMatrix
