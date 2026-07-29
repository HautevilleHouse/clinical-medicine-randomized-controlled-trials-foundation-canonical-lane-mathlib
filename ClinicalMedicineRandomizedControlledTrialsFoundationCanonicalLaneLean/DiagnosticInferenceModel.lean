import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean

structure DiagnosticInferencePackage where
  testSensitivity : ℝ
  testSpecificity : ℝ
  diseasePrevalence : ℝ
  positivePredictiveValue : ℝ
  negativePredictiveValue : ℝ
  sensitivityClosed : Prop
  specificityClosed : Prop
  predictiveValuesComputed : Prop

structure DiagnosticInferenceEvidence (D : DiagnosticInferencePackage) where
  sensitivityClosed : D.sensitivityClosed
  specificityClosed : D.specificityClosed
  predictiveValuesComputedClosed : D.predictiveValuesComputed

def DiagnosticInferenceClosed (D : DiagnosticInferencePackage) : Prop :=
  D.sensitivityClosed ∧ D.specificityClosed ∧ D.predictiveValuesComputed

theorem diagnostic_inference_closed_from_evidence (D : DiagnosticInferencePackage)
    (E : DiagnosticInferenceEvidence D) : DiagnosticInferenceClosed D := by
  exact And.intro E.sensitivityClosed
    (And.intro E.specificityClosed E.predictiveValuesComputedClosed)

end ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean
end HautevilleHouse
