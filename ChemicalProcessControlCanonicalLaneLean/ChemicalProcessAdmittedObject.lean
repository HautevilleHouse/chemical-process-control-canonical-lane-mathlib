import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalProcessControlCanonicalLaneLean

structure ChemicalProcessAdmittedObject where
  processReactor : Type u
  thermodynamicState : Type v
  dynamicEquilibrium : Prop
  reachabilityToTarget : Prop
  conclusion : reachabilityToTarget

def ProcessWitnessClosed (O : ChemicalProcessAdmittedObject) : Prop :=
  O.reachabilityToTarget

end ChemicalProcessControlCanonicalLaneLean
end HautevilleHouse