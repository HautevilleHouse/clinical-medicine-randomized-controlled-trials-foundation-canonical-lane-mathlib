import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean

structure MetaAnalysisPackage where
  studySelection : Prop
  heterogeneityAssessment : Prop
  effectSizePooling : Prop
  publicationBias : Prop
  subgroupAnalysis : Prop

structure MetaAnalysisEvidence (M : MetaAnalysisPackage) where
  studySelectionClosed : M.studySelection
  heterogeneityAssessmentClosed : M.heterogeneityAssessment
  effectSizePoolingClosed : M.effectSizePooling
  publicationBiasClosed : M.publicationBias
  subgroupAnalysisClosed : M.subgroupAnalysis

def MetaAnalysisClosed (M : MetaAnalysisPackage) : Prop :=
  M.studySelection ∧ M.heterogeneityAssessment ∧ M.effectSizePooling ∧ M.publicationBias ∧ M.subgroupAnalysis

theorem meta_analysis_closed_from_evidence (M : MetaAnalysisPackage) 
    (E : MetaAnalysisEvidence M) : MetaAnalysisClosed M := by
  exact And.intro E.studySelectionClosed
    (And.intro E.heterogeneityAssessmentClosed
      (And.intro E.effectSizePoolingClosed
        (And.intro E.publicationBiasClosed E.subgroupAnalysisClosed)))

end ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean
end HautevilleHouse