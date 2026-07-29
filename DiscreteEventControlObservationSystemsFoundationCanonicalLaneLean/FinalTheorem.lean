import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean.ObservationSystemFoundation
import HautevilleHouse.DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean.Observability
import HautevilleHouse.DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean.ControllerSynthesis

/-!
# Final Theorem

This module assembles the admissible closure for discrete event control
observation systems: the observation system is closed under bridge and gate.
-/

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean

def ConstrainedObservationSystemClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_observation_system_endgame (A : AdmissibleClass) :
    ConstrainedObservationSystemClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean
end HautevilleHouse