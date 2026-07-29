import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalProcessControlCanonicalLaneLean

structure MolecularOrbitalTheoryPackage where
  hamiltonian : Type u
  orbitalBasis : Type v
  electronCorrelation : Type w
  hartreeFockApproximation : Prop
  variationalPrincipleSatisfied : Prop
  orbitalOrthogonality : Prop

structure MolecularOrbitalTheoryEvidence (M : MolecularOrbitalTheoryPackage) where
  hartreeFockApproximationClosed : M.hartreeFockApproximation
  variationalPrincipleSatisfiedClosed : M.variationalPrincipleSatisfied
  orbitalOrthogonalityClosed : M.orbitalOrthogonality

def MolecularOrbitalTheoryClosed (M : MolecularOrbitalTheoryPackage) : Prop :=
  M.hartreeFockApproximation ∧ M.variationalPrincipleSatisfied ∧ M.orbitalOrthogonality

theorem molecular_orbital_theory_closed_from_evidence (M : MolecularOrbitalTheoryPackage) (E : MolecularOrbitalTheoryEvidence M) : MolecularOrbitalTheoryClosed M := by
  exact And.intro E.hartreeFockApproximationClosed (And.intro E.variationalPrincipleSatisfiedClosed E.orbitalOrthogonalityClosed)

end ChemicalProcessControlCanonicalLaneLean
end HautevilleHouse