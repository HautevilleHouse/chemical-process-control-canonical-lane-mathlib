import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalProcessControl

structure ProcessControlPIDPackage where
  proportionalGain : Type u
  integralTime : Type v
  derivativeTime : Type w
  closedLoopStability : Prop
  setpointTracking : Prop

structure ProcessControlPIDEvidence (P : ProcessControlPIDPackage) where
  proportionalGainDefined : P.proportionalGain = P.proportionalGain
  integralTimeDefined : P.integralTime = P.integralTime
  derivativeTimeDefined : P.derivativeTime = P.derivativeTime
  closedLoopStabilityClosed : P.closedLoopStability
  setpointTrackingClosed : P.setpointTracking

def ProcessControlPIDClosed (P : ProcessControlPIDPackage) : Prop :=
  P.closedLoopStability ∧ P.setpointTracking

theorem process_control_pid_closed_from_evidence
    (P : ProcessControlPIDPackage)
    (E : ProcessControlPIDEvidence P) : ProcessControlPIDClosed P := by
  exact And.intro E.closedLoopStabilityClosed E.setpointTrackingClosed

end ChemicalProcessControl
end HautevilleHouse