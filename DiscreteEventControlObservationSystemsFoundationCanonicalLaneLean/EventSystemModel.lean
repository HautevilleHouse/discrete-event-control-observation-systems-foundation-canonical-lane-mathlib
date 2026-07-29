import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean

structure EventSet where
  eventType : Type
  alphabet : List eventType
  finite : Prop
  finiteTerm : finite

definition EventAlphabetFinite (E : EventSet) : Prop :=
  E.finite

structure StateSpace where
  stateType : Type
  initialState : stateType
  stateReachable : Prop
  stateReachableTerm : stateReachable

definition StateReachableClosed (S : StateSpace) : Prop :=
  S.stateReachable

end DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean
end HautevilleHouse