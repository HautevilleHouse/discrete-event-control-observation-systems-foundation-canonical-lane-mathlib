import canonicalLaneMathlib.AdmissibleClass
import DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean.EventSystemModel

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean

structure ControlMechanism (S : StateSpace) where
  controlInput : Type
  controlLaw : S.stateType -> controlInput -> S.stateType
  wellDefined : Prop
  wellDefinedTerm : wellDefined

definition ControlWellDefinedClosed {S : StateSpace} (C : ControlMechanism S) : Prop :=
  C.wellDefined

structure ObservationControl (S : StateSpace) (M : ObservationMap S) (C : ControlMechanism S) where
  feasibilityCondition : Prop
  feasibilityConditionTerm : feasibilityCondition

definition FeasibilityClosed {S : StateSpace} {M : ObservationMap S} {C : ControlMechanism S} (OC : ObservationControl S M C) : Prop :=
  OC.feasibilityCondition

end DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean
end HautevilleHouse