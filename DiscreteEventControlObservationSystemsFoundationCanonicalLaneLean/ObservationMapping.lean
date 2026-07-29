import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean

structure ObservationMapping (S : DiscreteEventSystem) where
  observationFunction : S.eventSet → Option S.observableEventSet
  observationConsistency : ∀ e : S.eventSet, (observationFunction e).isSome ↔ e ∈ S.observableEventSet

structure ObservationMappingEvidence (S : DiscreteEventSystem) (O : ObservationMapping S) where
  observationConsistencyClosed : O.observationConsistency

def ObservationMappingClosed (S : DiscreteEventSystem) (O : ObservationMapping S) : Prop :=
  O.observationConsistency

theorem observation_mapping_closed_from_evidence (S : DiscreteEventSystem) (O : ObservationMapping S)
    (E : ObservationMappingEvidence S O) : ObservationMappingClosed S O := by
  exact E.observationConsistencyClosed

end DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean
end HautevilleHouse
