import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean

structure RandomizedTrial where
  treatmentArm : Type u
  controlArm : Type v
  treatmentSampleSize : ℕ
  controlSampleSize : ℕ
  outcome : Type w
  effectSize : ℝ

def validTrial (t : RandomizedTrial) : Prop :=
  t.treatmentSampleSize > 0 ∧ t.controlSampleSize > 0

structure TrialEvidence (t : RandomizedTrial) where
  validTrialClosed : validTrial t
  randomizationClosed : randomizationProcess t treatmentArm controlArm
  outcomeAssessmentClosed : outcomeAssessmentMethod t outcome
  statisticalSignificanceClosed : pValue t.effectSize < 0.05

def trialClosed (t : RandomizedTrial) : Prop :=
  validTrial t ∧ randomizationProcess t treatmentArm controlArm ∧ outcomeAssessmentMethod t outcome ∧ pValue t.effectSize < 0.05

theorem trial_closed_from_evidence (t : RandomizedTrial) (e : TrialEvidence t) : trialClosed t := by
  exact And.intro e.validTrialClosed (And.intro e.randomizationClosed (And.intro e.outcomeAssessmentClosed e.statisticalSignificanceClosed))

end ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean
end HautevilleHouse
