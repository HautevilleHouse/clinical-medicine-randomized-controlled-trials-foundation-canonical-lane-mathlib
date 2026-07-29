import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean

structure SurvivalAnalysisPackage where
  survivalTimeType : Type u
  censoringIndicator : survivalTimeType → Bool
  hazardFunction : survivalTimeType → ℝ
  kaplanMeierEstimate : survivalTimeType → ℝ
  proportionalHazardsAssumption : Prop
  logRankTestSignificant : Prop

structure SurvivalAnalysisEvidence (S : SurvivalAnalysisPackage) where
  proportionalHazardsAssumptionClosed : S.proportionalHazardsAssumption
  logRankTestSignificantClosed : S.logRankTestSignificant

def SurvivalAnalysisClosed (S : SurvivalAnalysisPackage) : Prop :=
  S.proportionalHazardsAssumption ∧ S.logRankTestSignificant

theorem survival_analysis_closed_from_evidence (S : SurvivalAnalysisPackage)
    (E : SurvivalAnalysisEvidence S) : SurvivalAnalysisClosed S := by
  exact And.intro E.proportionalHazardsAssumptionClosed E.logRankTestSignificantClosed

end ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean
end HautevilleHouse
