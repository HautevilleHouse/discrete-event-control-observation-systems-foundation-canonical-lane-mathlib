import DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean.DiagnosabilityPackage

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean

structure SupervisoryControlPackage {L : ObservableLanguage}
    {O : ObservabilityPackage L} {C : ControllabilityPackage O}
    {D : DiagnosabilityPackage C} where
  supervisorMap : List L.alphabet -> Set L.alphabet
  nonblockingCondition : Prop
  nonconflictingCondition : Prop
  supervisorConsistency : Prop

structure SupervisoryControlEvidence {L : ObservableLanguage}
    {O : ObservabilityPackage L} {C : ControllabilityPackage O}
    {D : DiagnosabilityPackage C} (S : SupervisoryControlPackage D) where
  nonblockingConditionClosed : S.nonblockingCondition
  nonconflictingConditionClosed : S.nonconflictingCondition
  supervisorConsistencyClosed : S.supervisorConsistency

def SupervisoryControlClosed {L : ObservableLanguage}
    {O : ObservabilityPackage L} {C : ControllabilityPackage O}
    {D : DiagnosabilityPackage C} (S : SupervisoryControlPackage D) : Prop :=
  S.nonblockingCondition ∧ S.nonconflictingCondition ∧ S.supervisorConsistency

theorem supervisory_control_closed_from_evidence
    {L : ObservableLanguage} {O : ObservabilityPackage L}
    {C : ControllabilityPackage O} {D : DiagnosabilityPackage C}
    (S : SupervisoryControlPackage D) (E : SupervisoryControlEvidence S) :
    SupervisoryControlClosed S := by
  exact And.intro E.nonblockingConditionClosed
    (And.intro E.nonconflictingConditionClosed E.supervisorConsistencyClosed)

end DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean
end HautevilleHouse
