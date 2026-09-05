import Mathlib

open MeasureTheory

namespace RandomMatrices

/-- The **semicircle density** of Anderson–Guionnet–Zeitouni, eq. (2.1.3):
`σ(x) = √(4 - x²) / (2π)` for `|x| ≤ 2`, and `σ(x) = 0` otherwise. -/
noncomputable def semicircleDensity (x : ℝ) : ℝ :=
  if |x| ≤ 2 then Real.sqrt (4 - x ^ 2) / (2 * Real.pi) else 0

/-- The **semicircle distribution** `σ(x) dx` on `ℝ`, i.e. Lebesgue measure weighted by
`RandomMatrices.semicircleDensity`. -/
noncomputable def semicircle : Measure ℝ :=
  volume.withDensity fun x => ENNReal.ofReal (semicircleDensity x)

end RandomMatrices
