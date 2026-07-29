import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean.ControllerSynthesis

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean

structure SupervisoryControl where
  plantLanguage : ControllerSynthesis.plantLanguage
  specificationLanguage : ControllerSynthesis.specificationLanguage
  supervisorMap : List (ControllerSynthesis.plantLanguage.observationAlphabet) → Set (ControllerSynthesis.plantLanguage.eventAlphabet)
  controllableEvents : ControllerSynthesis.controllableEvents
  admissibleSupervisor : Prop
  closedLoopLanguageResult : Set (List (ControllerSynthesis.plantLanguage.eventAlphabet))
  nonblockingProperty : Prop
  permissivenessProperty : Prop

structure SupervisoryControlEvidence (S : SupervisoryControl) where
  admissibleSupervisorClosed : S.admissibleSupervisor
  nonblockingPropertyClosed : S.nonblockingProperty
  permissivenessPropertyClosed : S.permissivenessProperty

def SupervisoryControlClosed (S : SupervisoryControl) : Prop :=
  S.admissibleSupervisor ∧ S.nonblockingProperty ∧ S.permissivenessProperty

theorem supervisory_control_closed_from_evidence (S : SupervisoryControl) (E : SupervisoryControlEvidence S) : SupervisoryControlClosed S :=
  And.intro E.admissibleSupervisorClosed (And.intro E.nonblockingPropertyClosed E.permissivenessPropertyClosed)

end DiscreteEventControlObservationSystemsFoundationCanonicalLaneLean
end HautevilleHouse
