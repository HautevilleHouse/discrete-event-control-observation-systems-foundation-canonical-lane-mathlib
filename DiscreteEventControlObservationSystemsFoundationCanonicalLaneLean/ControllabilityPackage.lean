import DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean.ObservabilityPackage

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean

structure ControllabilityPackage {L : ObservableLanguage} (O : ObservabilityPackage L) where
  controllableEvents : Set L.alphabet
  disableMap : L.alphabet -> Bool
  controllabilityCondition : Prop
  disableConsistency : Prop

structure ControllabilityEvidence {L : ObservableLanguage} {O : ObservabilityPackage L}
    (C : ControllabilityPackage O) where
  controllabilityConditionClosed : C.controllabilityCondition
  disableConsistencyClosed : C.disableConsistency

def ControllabilityClosed {L : ObservableLanguage} {O : ObservabilityPackage L}
    (C : ControllabilityPackage O) : Prop :=
  C.controllabilityCondition ∧ C.disableConsistency

theorem controllability_closed_from_evidence
    {L : ObservableLanguage} {O : ObservabilityPackage L}
    (C : ControllabilityPackage O) (E : ControllabilityEvidence C) :
    ControllabilityClosed C := by
  exact And.intro E.controllabilityConditionClosed E.disableConsistencyClosed

end DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean
end HautevilleHouse
