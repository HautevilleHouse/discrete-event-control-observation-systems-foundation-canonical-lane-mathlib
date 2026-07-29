import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean

structure ObservationLanguage where
  eventAlphabet : Type u
  observationAlphabet : Type v
  observationMap : eventAlphabet → observationAlphabet
  observationMapPartial : Bool
  language : Set (List eventAlphabet)
  observationProjection : List eventAlphabet → List observationAlphabet
  languageClosedUnderProjection : Prop

structure ObservationLanguageEvidence (L : ObservationLanguage) where
  languageClosedUnderProjectionClosed : L.languageClosedUnderProjection

def ObservationLanguageClosed (L : ObservationLanguage) : Prop :=
  L.languageClosedUnderProjection

theorem observation_language_closed_from_evidence (L : ObservationLanguage) (E : ObservationLanguageEvidence L) : ObservationLanguageClosed L :=
  E.languageClosedUnderProjectionClosed

end DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean
end HautevilleHouse
