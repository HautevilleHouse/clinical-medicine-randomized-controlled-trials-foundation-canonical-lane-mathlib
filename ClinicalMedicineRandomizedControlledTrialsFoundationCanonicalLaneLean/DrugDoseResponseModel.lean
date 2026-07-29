import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean

structure DrugDoseResponsePackage where
  drug : Type u
  doseLevels : List ℕ
  responseMetric : Type v
  doseResponseCurve : doseLevels → responseMetric
  monotonicResponse : Prop
  plateauObserved : Prop
  toxicityThreshold : Prop

structure DrugDoseResponseEvidence (D : DrugDoseResponsePackage) where
  monotonicResponseClosed : D.monotonicResponse
  plateauObservedClosed : D.plateauObserved
  toxicityThresholdClosed : D.toxicityThreshold

def DrugDoseResponseClosed (D : DrugDoseResponsePackage) : Prop :=
  D.monotonicResponse ∧ D.plateauObserved ∧ D.toxicityThreshold

theorem drug_dose_response_closed_from_evidence (D : DrugDoseResponsePackage)
    (E : DrugDoseResponseEvidence D) : DrugDoseResponseClosed D := by
  exact And.intro E.monotonicResponseClosed
    (And.intro E.plateauObservedClosed E.toxicityThresholdClosed)

end ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean
end HautevilleHouse
