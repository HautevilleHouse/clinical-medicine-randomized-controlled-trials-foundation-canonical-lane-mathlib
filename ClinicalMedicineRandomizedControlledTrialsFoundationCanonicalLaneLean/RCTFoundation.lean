import clinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean.SurvivalAnalysis

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean

structure RCTFoundationPackage {C : CompartmentModelPackage} {P : PharmacokineticsPackage C} {D : DiagnosticInferencePackage P} {S : SurvivalAnalysisPackage D} where
  blinding : Prop
  randomization : Prop
  outcomeMeasurement : Prop
  statisticalAnalysis : Prop
  informedConsent : Prop

structure RCTFoundationEvidence {C : CompartmentModelPackage} {P : PharmacokineticsPackage C} {D : DiagnosticInferencePackage P} {S : SurvivalAnalysisPackage D} (R : RCTFoundationPackage S) where
  blindingClosed : R.blinding
  randomizationClosed : R.randomization
  outcomeMeasurementClosed : R.outcomeMeasurement
  statisticalAnalysisClosed : R.statisticalAnalysis
  informedConsentClosed : R.informedConsent

def RCTFoundationClosed {C : CompartmentModelPackage} {P : PharmacokineticsPackage C} {D : DiagnosticInferencePackage P} {S : SurvivalAnalysisPackage D} (R : RCTFoundationPackage S) : Prop :=
  R.blinding ∧ R.randomization ∧ R.outcomeMeasurement ∧ R.statisticalAnalysis ∧ R.informedConsent

theorem rct_foundation_closed_from_evidence {C : CompartmentModelPackage} {P : PharmacokineticsPackage C} {D : DiagnosticInferencePackage P} {S : SurvivalAnalysisPackage D} (R : RCTFoundationPackage S) (E : RCTFoundationEvidence R) :
    RCTFoundationClosed R := by
  exact And.intro E.blindingClosed (And.intro E.randomizationClosed (And.intro E.outcomeMeasurementClosed (And.intro E.statisticalAnalysisClosed E.informedConsentClosed)))

end ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean
end HautevilleHouse