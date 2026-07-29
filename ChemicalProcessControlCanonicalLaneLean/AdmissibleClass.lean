import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalProcessControlCanonicalLaneLean

structure AdmissibleClass where
  object : ChemicalProcessAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ProcessWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ChemicalProcessControlCanonicalLaneLean
end HautevilleHouse