import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalProcessControlCanonicalLaneLean

structure EnergyBalancePackage where
  firstLawThermodynamics : Prop
  enthalpyChange : Prop
  heatTransfer : Prop
  workTerm : Prop

structure EnergyBalanceEvidence (E : EnergyBalancePackage) where
  firstLawThermodynamicsClosed : E.firstLawThermodynamics
  enthalpyChangeClosed : E.enthalpyChange
  heatTransferClosed : E.heatTransfer
  workTermClosed : E.workTerm

def EnergyBalanceClosed (E : EnergyBalancePackage) : Prop :=
  E.firstLawThermodynamics ∧ E.enthalpyChange ∧ E.heatTransfer ∧ E.workTerm

theorem energy_balance_closed_from_evidence (E : EnergyBalancePackage) (Ev : EnergyBalanceEvidence E) :
    EnergyBalanceClosed E := by
  exact And.intro Ev.firstLawThermodynamicsClosed (And.intro Ev.enthalpyChangeClosed (And.intro Ev.heatTransferClosed Ev.workTermClosed))

end ChemicalProcessControlCanonicalLaneLean
end HautevilleHouse