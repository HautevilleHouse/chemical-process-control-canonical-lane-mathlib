import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalProcessControlCanonicalLaneLean.ReactionKinetics
import HautevilleHouse.ChemicalProcessControlCanonicalLaneLean.MassBalance
import HautevilleHouse.ChemicalProcessControlCanonicalLaneLean.EnergyBalance
import HautevilleHouse.ChemicalProcessControlCanonicalLaneLean.ProcessControl
import HautevilleHouse.ChemicalProcessControlCanonicalLaneLean.TransportPhenomena

namespace HautevilleHouse
namespace ChemicalProcessControlCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  AdmittedClosure A

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  A.endpointSatisfied

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A :=
  A.gateWitness

def ConstrainedChemicalProcessControlClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_chemical_process_control_endgame (A : AdmissibleClass) :
    ConstrainedChemicalProcessControlClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ChemicalProcessControlCanonicalLaneLean
end HautevilleHouse