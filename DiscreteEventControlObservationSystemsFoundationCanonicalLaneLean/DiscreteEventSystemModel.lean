import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean

structure DiscreteEventSystem where
  eventSet : Type u
  stateSpace : Type v
  observableEventSet : Set eventSet
  controllableEventSet : Set eventSet
  transitionFunction : stateSpace → eventSet → stateSpace
  initialStates : Set stateSpace
  markedStates : Set stateSpace

def admissibleStatePair (A : AdmissibleClass) (s1 s2 : A.object.stateSpace) : Prop := True

end DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean
end HautevilleHouse
