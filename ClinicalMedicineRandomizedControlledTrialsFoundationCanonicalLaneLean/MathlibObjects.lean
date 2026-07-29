import clinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean

structure ClinicalSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure ClinicalAdmittedObject where
  space : ClinicalSpace
  closedThreeManifold : Prop
  simplyConnected : Prop
  conclusion : closedThreeManifold

def ClinicalWitnessClosed (O : ClinicalAdmittedObject) : Prop :=
  O.closedThreeManifold

end ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean
end HautevilleHouse