import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalProcessControlCanonicalLaneLean

structure ProcessControlPackage (A : AdmissibleClass) where
  feedbackControl : Prop
  stabilityMargin : Prop
  transferFunction : Prop
  pidTuning : Prop

structure ProcessControlEvidence {A : AdmissibleClass} (P : ProcessControlPackage A) where
  feedbackControlClosed : P.feedbackControl
  stabilityMarginClosed : P.stabilityMargin
  transferFunctionClosed : P.transferFunction
  pidTuningClosed : P.pidTuning

def ProcessControlClosed {A : AdmissibleClass} (P : ProcessControlPackage A) : Prop :=
  P.feedbackControl ∧ P.stabilityMargin ∧ P.transferFunction ∧ P.pidTuning

theorem process_control_closed_from_evidence {A : AdmissibleClass} (P : ProcessControlPackage A) (E : ProcessControlEvidence P) :
    ProcessControlClosed P := by
  exact And.intro E.feedbackControlClosed (And.intro E.stabilityMarginClosed (And.intro E.transferFunctionClosed E.pidTuningClosed))

end ChemicalProcessControlCanonicalLaneLean
end HautevilleHouse
