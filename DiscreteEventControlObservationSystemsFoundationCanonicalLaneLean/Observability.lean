import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean.ObservationSystemFoundation

/-!
# Observability and Detectability Package

This module formalizes observability and detectability properties for
discrete event control systems under partial observation.
-/

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean

structure ObservabilityPackage (O : ObservationSystem) where
  observableLanguage : Set (List String)
  indistinguishableStates : O.plantStateSet -> O.plantStateSet -> Prop
  observabilityCondition : Prop
  detectabilityCondition : Prop
  observabilityConditionClosed : observabilityCondition
  detectabilityConditionClosed : detectabilityCondition

structure ObservabilityEvidence {O : ObservationSystem}
    (P : ObservabilityPackage O) where
  observabilityConditionClosed : P.observabilityCondition
  detectabilityConditionClosed : P.detectabilityCondition

def ObservabilityClosed {O : ObservationSystem}
    (P : ObservabilityPackage O) : Prop :=
  P.observabilityCondition ∧ P.detectabilityCondition

theorem observability_closed_from_evidence
    {O : ObservationSystem} (P : ObservabilityPackage O)
    (E : ObservabilityEvidence P) : ObservabilityClosed P := by
  exact And.intro E.observabilityConditionClosed E.detectabilityConditionClosed

end DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean
end HautevilleHouse