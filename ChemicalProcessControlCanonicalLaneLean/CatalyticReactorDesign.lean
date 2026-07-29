import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalProcessControlCanonicalLaneLean

structure CatalyticReactorDesignPackage where
  catalystSite : Type u
  rateExpression : Type v
  deactivationModel : Type w
  activityAssumption : Prop
  massTransferLimitation : Prop
  reactorPerformanceGuaranteed : Prop

structure CatalyticReactorDesignEvidence (C : CatalyticReactorDesignPackage) where
  activityAssumptionClosed : C.activityAssumption
  massTransferLimitationClosed : C.massTransferLimitation
  reactorPerformanceGuaranteedClosed : C.reactorPerformanceGuaranteed

def CatalyticReactorDesignClosed (C : CatalyticReactorDesignPackage) : Prop :=
  C.activityAssumption ∧ C.massTransferLimitation ∧ C.reactorPerformanceGuaranteed

theorem catalytic_reactor_design_closed_from_evidence (C : CatalyticReactorDesignPackage) (E : CatalyticReactorDesignEvidence C) : CatalyticReactorDesignClosed C := by
  exact And.intro E.activityAssumptionClosed (And.intro E.massTransferLimitationClosed E.reactorPerformanceGuaranteedClosed)

end ChemicalProcessControlCanonicalLaneLean
end HautevilleHouse