import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalProcessControlCanonicalLaneLean

structure ThermodynamicsPackage (A : AdmissibleClass) where
  firstLaw : Prop
  secondLaw : Prop
  thirdLaw : Prop
  equilibriumCondition : Prop

structure ThermodynamicsEvidence {A : AdmissibleClass} (T : ThermodynamicsPackage A) where
  firstLawClosed : T.firstLaw
  secondLawClosed : T.secondLaw
  thirdLawClosed : T.thirdLaw
  equilibriumConditionClosed : T.equilibriumCondition

def ThermodynamicsClosed {A : AdmissibleClass} (T : ThermodynamicsPackage A) : Prop :=
  T.firstLaw ∧ T.secondLaw ∧ T.thirdLaw ∧ T.equilibriumCondition

theorem thermodynamics_closed_from_evidence {A : AdmissibleClass} (T : ThermodynamicsPackage A) (E : ThermodynamicsEvidence T) :
    ThermodynamicsClosed T := by
  exact And.intro E.firstLawClosed (And.intro E.secondLawClosed (And.intro E.thirdLawClosed E.equilibriumConditionClosed))

end ChemicalProcessControlCanonicalLaneLean
end HautevilleHouse
