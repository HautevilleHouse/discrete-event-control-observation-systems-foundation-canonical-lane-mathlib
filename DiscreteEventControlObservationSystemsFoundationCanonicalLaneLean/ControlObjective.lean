import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean

inductive ControlObjective where
  | safety (badStates : Set stateSpace)
  | liveness (desiredTrajectories : Set (List eventSet))
  | reachability (target : Set stateSpace)
  | nonblocking

structure ControlObjectivePackage (S : DiscreteEventSystem) where
  objective : ControlObjective
  specificationDefined : Prop
  specificationDefinedClosed : specificationDefined

structure ControlObjectiveEvidence (S : DiscreteEventSystem) (C : ControlObjectivePackage S) where
  specificationDefinedClosed : C.specificationDefined

def ControlObjectiveClosed (S : DiscreteEventSystem) (C : ControlObjectivePackage S) : Prop :=
  C.specificationDefined

theorem control_objective_closed_from_evidence (S : DiscreteEventSystem) (C : ControlObjectivePackage S)
    (E : ControlObjectiveEvidence S C) : ControlObjectiveClosed S C := by
  exact E.specificationDefinedClosed

end DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean
end HautevilleHouse
