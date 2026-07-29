import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalProcessControlCanonicalLaneLean

structure ReactionKineticsPackage (A : AdmissibleClass) where
  rateLaw : Prop
  rateConstant : Prop
  reactionOrder : Prop
  activationEnergy : Prop

structure ReactionKineticsEvidence {A : AdmissibleClass} (R : ReactionKineticsPackage A) where
  rateLawClosed : R.rateLaw
  rateConstantClosed : R.rateConstant
  reactionOrderClosed : R.reactionOrder
  activationEnergyClosed : R.activationEnergy

def ReactionKineticsClosed {A : AdmissibleClass} (R : ReactionKineticsPackage A) : Prop :=
  R.rateLaw ∧ R.rateConstant ∧ R.reactionOrder ∧ R.activationEnergy

theorem reaction_kinetics_closed_from_evidence {A : AdmissibleClass} (R : ReactionKineticsPackage A) (E : ReactionKineticsEvidence R) :
    ReactionKineticsClosed R := by
  exact And.intro E.rateLawClosed (And.intro E.rateConstantClosed (And.intro E.reactionOrderClosed E.activationEnergyClosed))

end ChemicalProcessControlCanonicalLaneLean
end HautevilleHouse
