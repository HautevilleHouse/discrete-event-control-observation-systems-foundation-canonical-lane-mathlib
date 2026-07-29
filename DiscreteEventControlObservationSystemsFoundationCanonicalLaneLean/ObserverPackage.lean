import DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean.SupervisoryControlPackage

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean

structure ObserverPackage {L : ObservableLanguage}
    {O : ObservabilityPackage L} {C : ControllabilityPackage O}
    {D : DiagnosabilityPackage C} {S : SupervisoryControlPackage D} where
  observerStateSpace : Type u
  transitionFunction : observerStateSpace -> L.alphabet -> observerStateSpace
  initialObserverState : observerStateSpace
  observationFunction : observerStateSpace -> Set (List L.alphabet)
  observerCorrectness : Prop
  observationConsistency : Prop

structure ObserverEvidence {L : ObservableLanguage}
    {O : ObservabilityPackage L} {C : ControllabilityPackage O}
    {D : DiagnosabilityPackage C} {S : SupervisoryControlPackage D}
    (Ob : ObserverPackage S) where
  observerCorrectnessClosed : Ob.observerCorrectness
  observationConsistencyClosed : Ob.observationConsistency

def ObserverClosed {L : ObservableLanguage}
    {O : ObservabilityPackage L} {C : ControllabilityPackage O}
    {D : DiagnosabilityPackage C} {S : SupervisoryControlPackage D}
    (Ob : ObserverPackage S) : Prop :=
  Ob.observerCorrectness ∧ Ob.observationConsistency

theorem observer_closed_from_evidence
    {L : ObservableLanguage} {O : ObservabilityPackage L}
    {C : ControllabilityPackage O} {D : DiagnosabilityPackage C}
    {S : SupervisoryControlPackage D} (Ob : ObserverPackage S)
    (E : ObserverEvidence Ob) : ObserverClosed Ob := by
  exact And.intro E.observerCorrectnessClosed E.observationConsistencyClosed

end DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean
end HautevilleHouse
