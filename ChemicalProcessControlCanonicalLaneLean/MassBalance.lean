import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalProcessControlCanonicalLaneLean

structure MassBalancePackage where
  conservationLaw : Prop
  inputOutputRelation : Prop
  accumulationTerm : Prop
  reactionSourceTerm : Prop

structure MassBalanceEvidence (M : MassBalancePackage) where
  conservationLawClosed : M.conservationLaw
  inputOutputRelationClosed : M.inputOutputRelation
  accumulationTermClosed : M.accumulationTerm
  reactionSourceTermClosed : M.reactionSourceTerm

def MassBalanceClosed (M : MassBalancePackage) : Prop :=
  M.conservationLaw ∧ M.inputOutputRelation ∧ M.accumulationTerm ∧ M.reactionSourceTerm

theorem mass_balance_closed_from_evidence (M : MassBalancePackage) (E : MassBalanceEvidence M) :
    MassBalanceClosed M := by
  exact And.intro E.conservationLawClosed (And.intro E.inputOutputRelationClosed (And.intro E.accumulationTermClosed E.reactionSourceTermClosed))

end ChemicalProcessControlCanonicalLaneLean
end HautevilleHouse