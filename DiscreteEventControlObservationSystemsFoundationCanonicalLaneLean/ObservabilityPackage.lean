import DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean

structure ObservableLanguage where
  alphabet : Type u
  strings : List (List alphabet)

def ObservableLanguageClosure (L : ObservableLanguage) : Prop :=
  forall s : List L.alphabet, s ∈ L.strings

structure ObservabilityPackage (L : ObservableLanguage) where
  projection : L.alphabet -> Option (L.alphabet)
  observableStrings : Set (List L.alphabet)
  indistinguishablePairs : (List L.alphabet) × (List L.alphabet) -> Prop
  projectionConsistency : Prop
  indistinguishabilityClosed : Prop

structure ObservabilityEvidence {L : ObservableLanguage} (O : ObservabilityPackage L) where
  projectionConsistencyClosed : O.projectionConsistency
  indistinguishabilityClosed : O.indistinguishabilityClosed

def ObservabilityClosed {L : ObservableLanguage} (O : ObservabilityPackage L) : Prop :=
  O.projectionConsistency ∧ O.indistinguishabilityClosed

theorem observability_closed_from_evidence
    {L : ObservableLanguage} (O : ObservabilityPackage L)
    (E : ObservabilityEvidence O) : ObservabilityClosed O := by
  exact And.intro E.projectionConsistencyClosed E.indistinguishabilityClosed

end DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean
end HautevilleHouse
