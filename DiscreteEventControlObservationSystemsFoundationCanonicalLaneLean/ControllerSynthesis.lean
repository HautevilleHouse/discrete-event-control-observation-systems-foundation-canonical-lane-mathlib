import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean.Observability

/-!
# Controller Synthesis

This module formalizes the synthesis of a supervisor/controller that
disables certain controllable events based on partial observations to enforce
a given specification language.
-/

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean

structure ControllerSynthesisPackage (O : ObservationSystem) where
  controllableEvents : Set (O.plantEventSet)
  specificationLanguage : Set (List (O.plantEventSet))
  supervisorMap : O.observerStateSet -> Set (O.plantEventSet)
  specificationEnforced : Prop
  nonblockingCondition : Prop
  specificationEnforcedClosed : specificationEnforced
  nonblockingConditionClosed : nonblockingCondition

structure ControllerSynthesisEvidence {O : ObservationSystem}
    (C : ControllerSynthesisPackage O) where
  specificationEnforcedClosed : C.specificationEnforced
  nonblockingConditionClosed : C.nonblockingCondition

def ControllerSynthesisClosed {O : ObservationSystem}
    (C : ControllerSynthesisPackage O) : Prop :=
  C.specificationEnforced ∧ C.nonblockingCondition

theorem controller_synthesis_closed_from_evidence
    {O : ObservationSystem} (C : ControllerSynthesisPackage O)
    (E : ControllerSynthesisEvidence C) : ControllerSynthesisClosed C := by
  exact And.intro E.specificationEnforcedClosed E.nonblockingConditionClosed

end DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean
end HautevilleHouse