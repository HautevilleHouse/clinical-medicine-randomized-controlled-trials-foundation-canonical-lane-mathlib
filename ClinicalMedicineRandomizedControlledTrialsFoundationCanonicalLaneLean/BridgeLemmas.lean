import clinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.closedThreeManifold

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean
end HautevilleHouse