import DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean

structure ObservabilityStructure (A : AdmissibleClass) where
  eventSet : Type u
  observationMap : eventSet → Option (eventSet)
  projectionClosed : Prop
  currentState : Type v
  stateTrajectory : List (eventSet) → currentState
  observableEvents : Set eventSet
  unobservableEvents : Set eventSet
  projectionCompositionInvariant : Prop
  projectionCompositionInvariantTerm : projectionCompositionInvariant
  stateEstimateErrorBounded : Prop
  stateEstimateErrorBoundedTerm : stateEstimateErrorBounded

end DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean
end HautevilleHouse
