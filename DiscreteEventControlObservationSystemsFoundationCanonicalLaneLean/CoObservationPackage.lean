import DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean.ObserverPackage

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean

structure CoObservationPackage {L : ObservableLanguage}
    {O : ObservabilityPackage L} {C : ControllabilityPackage O}
    {D : DiagnosabilityPackage C} {S : SupervisoryControlPackage D}
    {Ob : ObserverPackage S} where
  agentSet : Set String
  localObservationFunctions : String -> (List L.alphabet -> Set (List L.alphabet))
  coObservationCondition : Prop
  fusionConsistency : Prop

structure CoObservationEvidence {L : ObservableLanguage}
    {O : ObservabilityPackage L} {C : ControllabilityPackage O}
    {D : DiagnosabilityPackage C} {S : SupervisoryControlPackage D}
    {Ob : ObserverPackage S} (Co : CoObservationPackage Ob) where
  coObservationConditionClosed : Co.coObservationCondition
  fusionConsistencyClosed : Co.fusionConsistency

def CoObservationClosed {L : ObservableLanguage}
    {O : ObservabilityPackage L} {C : ControllabilityPackage O}
    {D : DiagnosabilityPackage C} {S : SupervisoryControlPackage D}
    {Ob : ObserverPackage S} (Co : CoObservationPackage Ob) : Prop :=
  Co.coObservationCondition ∧ Co.fusionConsistency

theorem co_observation_closed_from_evidence
    {L : ObservableLanguage} {O : ObservabilityPackage L}
    {C : ControllabilityPackage O} {D : DiagnosabilityPackage C}
    {S : SupervisoryControlPackage D} {Ob : ObserverPackage S}
    (Co : CoObservationPackage Ob) (E : CoObservationEvidence Co) :
    CoObservationClosed Co := by
  exact And.intro E.coObservationConditionClosed E.fusionConsistencyClosed

end DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean
end HautevilleHouse
