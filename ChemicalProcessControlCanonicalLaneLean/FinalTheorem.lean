import canonicalLaneMathlib.AdmissibleClass
import ChemicalProcessControlCanonicalLaneLean.BridgeLemmas
import ChemicalProcessControlCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace ChemicalProcessControlCanonicalLaneLean

def ConstrainedChemicalProcessClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_chemical_process_endgame (A : AdmissibleClass) :
    ConstrainedChemicalProcessClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ChemicalProcessControlCanonicalLaneLean
end HautevilleHouse