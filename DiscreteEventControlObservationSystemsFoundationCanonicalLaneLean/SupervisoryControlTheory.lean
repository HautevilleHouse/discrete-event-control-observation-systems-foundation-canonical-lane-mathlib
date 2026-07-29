import DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean.DiagnosisStateEstimation

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean

structure SupervisoryControlTheory (A : AdmissibleClass) (O : ObservabilityStructure A) (C : ControlArchitecture A O) (D : DiagnosisStateEstimation A O C) where
  supervisorExistenceCondition : Prop
  supervisorExistenceConditionTerm : supervisorExistenceCondition
  closedLoopBehavior : Set (List (O.eventSet))
  controlSpecification : Set (List (O.eventSet))
  controllabilityTheorem : closedLoopBehavior ⊆ controlSpecification
  observabilityTheorem : Prop
  observabilityTheoremTerm : observabilityTheorem

end DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean
end HautevilleHouse
