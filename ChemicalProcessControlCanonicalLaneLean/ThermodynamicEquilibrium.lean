import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalProcessControlCanonicalLaneLean

structure ThermodynamicEquilibriumPackage where
  temperature : Type u
  pressure : Type v
  gibbsFreeEnergy : Type w
  equilibriumCondition : Prop
  phaseRuleSatisfied : Prop
  thermodynamicConsistency : Prop

structure ThermodynamicEquilibriumEvidence (T : ThermodynamicEquilibriumPackage) where
  equilibriumConditionClosed : T.equilibriumCondition
  phaseRuleSatisfiedClosed : T.phaseRuleSatisfied
  thermodynamicConsistencyClosed : T.thermodynamicConsistency

def ThermodynamicEquilibriumClosed (T : ThermodynamicEquilibriumPackage) : Prop :=
  T.equilibriumCondition ∧ T.phaseRuleSatisfied ∧ T.thermodynamicConsistency

theorem thermodynamic_equilibrium_closed_from_evidence (T : ThermodynamicEquilibriumPackage) (E : ThermodynamicEquilibriumEvidence T) : ThermodynamicEquilibriumClosed T := by
  exact And.intro E.equilibriumConditionClosed (And.intro E.phaseRuleSatisfiedClosed E.thermodynamicConsistencyClosed)

end ChemicalProcessControlCanonicalLaneLean
end HautevilleHouse