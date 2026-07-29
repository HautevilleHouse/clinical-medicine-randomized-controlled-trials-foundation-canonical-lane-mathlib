import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean

structure StatisticalAnalysisPackage where
  primaryAnalysis : String
  sampleSizeJustification : Prop
  interimAnalysis : Bool
  missingDataMethod : String
  subgroupAnalyses : List String
  sensitivityAnalyses : List String
  statisticalSignificanceLevel : Float
  nonInferiorityMargin : Option Float
  adjustmentForMultiplicity : String

define StatisticalAnalysisEvidence (S : StatisticalAnalysisPackage) where
  primaryAnalysisClosed : S.primaryAnalysis = "Intention-to-Treat"
  interimAnalysisClosed : S.interimAnalysis = false

def StatisticalAnalysisClosed (S : StatisticalAnalysisPackage) : Prop :=
  S.primaryAnalysis = "Intention-to-Treat" ∧ S.interimAnalysis = false ∧
  (S.statisticalSignificanceLevel = 0.05) ∧ (S.missingDataMethod = "Multiple Imputation")

theorem statistical_analysis_closed_from_evidence (S : StatisticalAnalysisPackage)
    (E : StatisticalAnalysisEvidence S) : StatisticalAnalysisClosed S := by
  refine And.intro E.primaryAnalysisClosed (And.intro E.interimAnalysisClosed
    (And.intro ?_ ?_))
  · exact rfl
  · exact rfl

end ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean
end HautevilleHouse
