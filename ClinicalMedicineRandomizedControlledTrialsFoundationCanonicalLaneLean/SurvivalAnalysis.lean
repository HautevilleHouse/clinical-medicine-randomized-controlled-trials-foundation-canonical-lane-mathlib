import clinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean.DiagnosticInference

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean

structure SurvivalAnalysisPackage {C : CompartmentModelPackage} {P : PharmacokineticsPackage C} {D : DiagnosticInferencePackage P} where
  hazardFunction : Prop
  kaplanMeierEstimator : Prop
  coxProportionalHazards : Prop
  logRankTest : Prop
  survivalCurves : Prop

structure SurvivalAnalysisEvidence {C : CompartmentModelPackage} {P : PharmacokineticsPackage C} {D : DiagnosticInferencePackage P} (S : SurvivalAnalysisPackage D) where
  hazardFunctionClosed : S.hazardFunction
  kaplanMeierEstimatorClosed : S.kaplanMeierEstimator
  coxProportionalHazardsClosed : S.coxProportionalHazards
  logRankTestClosed : S.logRankTest
  survivalCurvesClosed : S.survivalCurves

def SurvivalAnalysisClosed {C : CompartmentModelPackage} {P : PharmacokineticsPackage C} {D : DiagnosticInferencePackage P} (S : SurvivalAnalysisPackage D) : Prop :=
  S.hazardFunction ∧ S.kaplanMeierEstimator ∧ S.coxProportionalHazards ∧ S.logRankTest ∧ S.survivalCurves

theorem survival_analysis_closed_from_evidence {C : CompartmentModelPackage} {P : PharmacokineticsPackage C} {D : DiagnosticInferencePackage P} (S : SurvivalAnalysisPackage D) (E : SurvivalAnalysisEvidence S) :
    SurvivalAnalysisClosed S := by
  exact And.intro E.hazardFunctionClosed (And.intro E.kaplanMeierEstimatorClosed (And.intro E.coxProportionalHazardsClosed (And.intro E.logRankTestClosed E.survivalCurvesClosed)))

end ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean
end HautevilleHouse