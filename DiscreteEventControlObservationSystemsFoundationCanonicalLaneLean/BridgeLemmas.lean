import DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ObservationWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.observationClosed

end DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean
end HautevilleHouse