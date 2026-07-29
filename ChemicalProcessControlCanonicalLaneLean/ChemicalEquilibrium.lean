import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalProcessControlCanonicalLaneLean

structure ChemicalEquilibriumPackage (A : AdmissibleClass) where
  equilibriumConstant : Prop
  leChatelierPrinciple : Prop
  reactionQuotient : Prop
  gibbsFreeEnergy : Prop

structure ChemicalEquilibriumEvidence {A : AdmissibleClass} (C : ChemicalEquilibriumPackage A) where
  equilibriumConstantClosed : C.equilibriumConstant
  leChatelierPrincipleClosed : C.leChatelierPrinciple
  reactionQuotientClosed : C.reactionQuotient
  gibbsFreeEnergyClosed : C.gibbsFreeEnergy

def ChemicalEquilibriumClosed {A : AdmissibleClass} (C : ChemicalEquilibriumPackage A) : Prop :=
  C.equilibriumConstant ∧ C.leChatelierPrinciple ∧ C.reactionQuotient ∧ C.gibbsFreeEnergy

theorem chemical_equilibrium_closed_from_evidence {A : AdmissibleClass} (C : ChemicalEquilibriumPackage A) (E : ChemicalEquilibriumEvidence C) :
    ChemicalEquilibriumClosed C := by
  exact And.intro E.equilibriumConstantClosed (And.intro E.leChatelierPrincipleClosed (And.intro E.reactionQuotientClosed E.gibbsFreeEnergyClosed))

end ChemicalProcessControlCanonicalLaneLean
end HautevilleHouse
