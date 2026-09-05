import Mathlib

set_option autoImplicit false

open scoped Matrix ComplexOrder
open NormedSpace

namespace TaoRandomMatrix

theorem posSemidef_sub_of_posSemidef_exp_sub {n : Type*} [Fintype n] [DecidableEq n]
    {A B : Matrix n n ℂ} (hA : A.IsHermitian) (hB : B.IsHermitian)
    (h : (exp B - exp A).PosSemidef) : (B - A).PosSemidef := by sorry

end TaoRandomMatrix
