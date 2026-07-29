import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean

def ConstrainedClinicalTrialClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_clinical_trial_endgame (A : AdmissibleClass) :
    ConstrainedClinicalTrialClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean
end HautevilleHouse
