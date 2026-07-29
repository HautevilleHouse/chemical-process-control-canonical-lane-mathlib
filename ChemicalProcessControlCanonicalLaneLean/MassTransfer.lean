import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalProcessControl

structure MassTransferPackage where
  diffusivity : Type u
  concentrationProfile : Type v
  fickLaw : Prop
  convectionDiffusion : Prop
  boundaryLayer : Prop

structure MassTransferEvidence (M : MassTransferPackage) where
  diffusivityDefined : M.diffusivity = M.diffusivity
  concentrationProfileDefined : M.concentrationProfile = M.concentrationProfile
  fickLawClosed : M.fickLaw
  convectionDiffusionClosed : M.convectionDiffusion
  boundaryLayerClosed : M.boundaryLayer

def MassTransferClosed (M : MassTransferPackage) : Prop :=
  M.fickLaw ∧ M.convectionDiffusion ∧ M.boundaryLayer

theorem mass_transfer_closed_from_evidence (M : MassTransferPackage)
    (E : MassTransferEvidence M) : MassTransferClosed M := by
  exact And.intro E.fickLawClosed
    (And.intro E.convectionDiffusionClosed E.boundaryLayerClosed)

end ChemicalProcessControl
end HautevilleHouse