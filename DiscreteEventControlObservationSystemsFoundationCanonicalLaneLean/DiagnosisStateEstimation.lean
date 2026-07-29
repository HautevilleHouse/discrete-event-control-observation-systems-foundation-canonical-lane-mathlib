import DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean.ControlArchitecture

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean

structure DiagnosisStateEstimation (A : AdmissibleClass) (O : ObservabilityStructure A) (C : ControlArchitecture A O) where
  faultEventSet : Set (O.eventSet)
  diagnosticStates : Type x
  diagnosisFunction : O.currentState → diagnosticStates
  estimationErrorBound : Prop
  faultDiagnosabilityCondition : Prop
  faultDiagnosabilityConditionTerm : faultDiagnosabilityCondition
  estimationErrorBoundTerm : estimationErrorBound
  diagnosisConsistency : Prop
  diagnosisConsistencyTerm : diagnosisConsistency

end DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean
end HautevilleHouse
