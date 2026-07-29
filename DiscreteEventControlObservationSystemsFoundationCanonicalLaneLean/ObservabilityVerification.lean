import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean

structure ObservabilityCondition (S : DiscreteEventSystem) where
  observableLanguage : Set (List S.eventSet)
  initialObservableSet : Set S.observableEventSet
  observabilityHolds : Prop

structure ObservabilityVerificationPackage (S : DiscreteEventSystem) (O : ObservationMapping S) where
  condition : ObservabilityCondition S
  conditionVerified : Prop
  verificationWitness : conditionVerified

structure ObservabilityVerificationEvidence (S : DiscreteEventSystem) (O : ObservationMapping S)
    (P : ObservabilityVerificationPackage S O) where
  conditionVerifiedClosed : P.conditionVerified

def ObservabilityVerificationClosed (S : DiscreteEventSystem) (O : ObservationMapping S)
    (P : ObservabilityVerificationPackage S O) : Prop :=
  P.conditionVerified

theorem observability_verification_closed_from_evidence (S : DiscreteEventSystem) (O : ObservationMapping S)
    (P : ObservabilityVerificationPackage S O) (E : ObservabilityVerificationEvidence S O P) :
    ObservabilityVerificationClosed S O P := by
  exact E.conditionVerifiedClosed

end DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean
end HautevilleHouse
