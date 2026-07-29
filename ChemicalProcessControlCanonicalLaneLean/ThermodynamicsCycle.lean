import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalProcessControlCanonicalLaneLean

structure ThermodynamicsCyclePackage where
  enthalpyBalance : Prop
  entropyGeneration : Prop
  gibbsFreeEnergyMinimized : Prop
  phaseEquilibrium : Prop

structure ThermodynamicsCycleEvidence (T : ThermodynamicsCyclePackage) where
  enthalpyBalanceClosed : T.enthalpyBalance
  entropyGenerationClosed : T.entropyGeneration
  gibbsFreeEnergyMinimizedClosed : T.gibbsFreeEnergyMinimized
  phaseEquilibriumClosed : T.phaseEquilibrium

def ThermodynamicsCycleClosed (T : ThermodynamicsCyclePackage) : Prop :=
  T.enthalpyBalance ∧ T.entropyGeneration ∧ T.gibbsFreeEnergyMinimized ∧ T.phaseEquilibrium

theorem thermodynamics_cycle_closed_from_evidence (T : ThermodynamicsCyclePackage) (E : ThermodynamicsCycleEvidence T) : ThermodynamicsCycleClosed T := by
  exact And.intro E.enthalpyBalanceClosed (And.intro E.entropyGenerationClosed (And.intro E.gibbsFreeEnergyMinimizedClosed E.phaseEquilibriumClosed))

end ChemicalProcessControlCanonicalLaneLean
end HautevilleHouse