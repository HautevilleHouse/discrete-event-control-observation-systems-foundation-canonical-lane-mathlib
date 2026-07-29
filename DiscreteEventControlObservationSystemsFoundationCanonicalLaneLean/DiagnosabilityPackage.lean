import DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean.ControllabilityPackage

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean

structure DiagnosabilityPackage {L : ObservableLanguage}
    {O : ObservabilityPackage L} {C : ControllabilityPackage O} where
  faultEvents : Set L.alphabet
  diagnosabilityCondition : Prop
  faultDetectionDelay : Nat
  delayBound : Prop

structure DiagnosabilityEvidence {L : ObservableLanguage}
    {O : ObservabilityPackage L} {C : ControllabilityPackage O}
    (D : DiagnosabilityPackage C) where
  diagnosabilityConditionClosed : D.diagnosabilityCondition
  delayBoundClosed : D.delayBound

def DiagnosabilityClosed {L : ObservableLanguage}
    {O : ObservabilityPackage L} {C : ControllabilityPackage O}
    (D : DiagnosabilityPackage C) : Prop :=
  D.diagnosabilityCondition ∧ D.delayBound

theorem diagnosability_closed_from_evidence
    {L : ObservableLanguage} {O : ObservabilityPackage L}
    {C : ControllabilityPackage O} (D : DiagnosabilityPackage C)
    (E : DiagnosabilityEvidence D) : DiagnosabilityClosed D := by
  exact And.intro E.diagnosabilityConditionClosed E.delayBoundClosed

end DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean
end HautevilleHouse
