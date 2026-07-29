import DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean.ObservabilityStructure

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean

structure ControlArchitecture (A : AdmissibleClass) (O : ObservabilityStructure A) where
  controllerSet : Type w
  supervisionMap : O.currentState → controllerSet
  admissibleControlPatterns : Set (controllerSet)
  controlledSystemDynamics : O.eventSet × controllerSet → O.eventSet
  controllabilityCondition : Prop
  controllabilityConditionTerm : controllabilityCondition
  supervisionMapRespectsControllability : Prop
  supervisionMapRespectsControllabilityTerm : supervisionMapRespectsControllability

end DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean
end HautevilleHouse
