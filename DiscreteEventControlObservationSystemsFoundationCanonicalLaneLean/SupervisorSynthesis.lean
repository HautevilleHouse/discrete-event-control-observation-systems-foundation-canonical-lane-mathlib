import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean

structure Supervisor (S : DiscreteEventSystem) where
  controlMap : S.stateSpace → Set S.eventSet
  admissibleControl : ∀ s : S.stateSpace, ∀ e ∈ controlMap s, e ∈ S.controllableEventSet
  observationConsistency : ∀ s : S.stateSpace, controlMap s ⊆ S.observableEventSet

structure SupervisorSynthesisPackage (S : DiscreteEventSystem) (C : ControlObjectivePackage S) where
  supervisor : Supervisor S
  objectiveAchieved : Prop
  closedLoopConsistency : Prop

structure SupervisorSynthesisEvidence (S : DiscreteEventSystem) (C : ControlObjectivePackage S)
    (P : SupervisorSynthesisPackage S C) where
  objectiveAchievedClosed : P.objectiveAchieved
  closedLoopConsistencyClosed : P.closedLoopConsistency

def SupervisorSynthesisClosed (S : DiscreteEventSystem) (C : ControlObjectivePackage S)
    (P : SupervisorSynthesisPackage S C) : Prop :=
  P.objectiveAchieved ∧ P.closedLoopConsistency

theorem supervisor_synthesis_closed_from_evidence (S : DiscreteEventSystem) (C : ControlObjectivePackage S)
    (P : SupervisorSynthesisPackage S C) (E : SupervisorSynthesisEvidence S C P) :
    SupervisorSynthesisClosed S C P := by
  exact And.intro E.objectiveAchievedClosed E.closedLoopConsistencyClosed

end DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean
end HautevilleHouse
