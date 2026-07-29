import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean

structure KaplanMeierSurvivalPackage where
  timeScale : Type u
  eventIndicator : Prop
  survivorFunction : Prop
  censoringMechanism : Prop
  logRankTest : Prop

structure KaplanMeierSurvivalEvidence (K : KaplanMeierSurvivalPackage) where
  eventIndicatorClosed : K.eventIndicator
  survivorFunctionClosed : K.survivorFunction
  censoringMechanismClosed : K.censoringMechanism
  logRankTestClosed : K.logRankTest

def KaplanMeierSurvivalClosed (K : KaplanMeierSurvivalPackage) : Prop :=
  K.eventIndicator ∧ K.survivorFunction ∧ K.censoringMechanism ∧ K.logRankTest

theorem kaplan_meier_survival_closed_from_evidence (K : KaplanMeierSurvivalPackage) 
    (E : KaplanMeierSurvivalEvidence K) : KaplanMeierSurvivalClosed K := by
  exact And.intro E.eventIndicatorClosed
    (And.intro E.survivorFunctionClosed
      (And.intro E.censoringMechanismClosed E.logRankTestClosed))

end ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean
end HautevilleHouse