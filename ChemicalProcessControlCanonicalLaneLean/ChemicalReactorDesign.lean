import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalProcessControl

structure ChemicalReactorDesignPackage where
  reactorType : Type u
  materialBalance : Prop
  energyBalance : Prop
  rateExpressions : Prop
  designEquations : Prop

structure ChemicalReactorDesignEvidence (R : ChemicalReactorDesignPackage) where
  reactorTypeDefined : R.reactorType = R.reactorType
  materialBalanceClosed : R.materialBalance
  energyBalanceClosed : R.energyBalance
  rateExpressionsClosed : R.rateExpressions
  designEquationsClosed : R.designEquations

def ChemicalReactorDesignClosed (R : ChemicalReactorDesignPackage) : Prop :=
  R.materialBalance ∧ R.energyBalance ∧ R.rateExpressions ∧ R.designEquations

theorem chemical_reactor_design_closed_from_evidence
    (R : ChemicalReactorDesignPackage)
    (E : ChemicalReactorDesignEvidence R) : ChemicalReactorDesignClosed R := by
  exact And.intro E.materialBalanceClosed
    (And.intro E.energyBalanceClosed
      (And.intro E.rateExpressionsClosed E.designEquationsClosed))

end ChemicalProcessControl
end HautevilleHouse