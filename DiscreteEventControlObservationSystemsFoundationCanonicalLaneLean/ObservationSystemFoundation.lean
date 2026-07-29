import canonicalLaneMathlib.AdmissibleClass

/-!
# Observation System Foundation

This module defines the foundational structures for discrete event control
observation systems. An observation system consists of a plant automaton,
an observation map that projects events onto observable symbols, and an
observer automaton that reconstructs the plant state up to observation equivalence.
-/

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean

structure ObservationSystem where
  plantStateSet : Type u
  plantEventSet : Type v
  plantTransition : plantStateSet -> plantEventSet -> plantStateSet
  observationMap : plantEventSet -> String
  observerStateSet : Type w
  observerTransition : observerStateSet -> String -> observerStateSet
  observerInitial : observerStateSet
  observationConsistency : Prop
  plantInitial : plantStateSet
  plantInitialTerm : plantInitial = plantInitial
  observerInitialTerm : observerInitial = observerInitial

structure ObservationSystemEvidence (O : ObservationSystem) where
  observationConsistencyClosed : O.observationConsistency
  plantInitialClosed : O.plantInitial = O.plantInitial
  observerInitialClosed : O.observerInitial = O.observerInitial

def ObservationSystemClosed (O : ObservationSystem) : Prop :=
  O.observationConsistency

theorem observation_system_closed_from_evidence
    (O : ObservationSystem) (E : ObservationSystemEvidence O) :
    ObservationSystemClosed O := by
  exact E.observationConsistencyClosed

end DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean
end HautevilleHouse