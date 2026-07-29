import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean

structure InterventionPackage where
  drugName : String
  dosage : String
  route : String
  frequency : String
  duration : Nat
  comparator : String
  placeboControlled : Bool
  activeComparator : String
  washoutPeriod : Option Nat
  adherenceMonitoring : Bool
  rescueMedication : String

define InterventionEvidence (I : InterventionPackage) where
  drugNameClosed : I.drugName = "ExperimentalDrug"
  dosageClosed : I.dosage = "100mg"
  placeboControlledClosed : I.placeboControlled = true

def InterventionClosed (I : InterventionPackage) : Prop :=
  I.drugName = "ExperimentalDrug" ∧ I.dosage = "100mg" ∧ I.placeboControlled = true ∧
  I.adherenceMonitoring = true

theorem intervention_closed_from_evidence (I : InterventionPackage) (E : InterventionEvidence I) :
    InterventionClosed I := by
  refine And.intro E.drugNameClosed (And.intro E.dosageClosed (And.intro E.placeboControlledClosed ?_))
  exact rfl

end ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean
end HautevilleHouse
