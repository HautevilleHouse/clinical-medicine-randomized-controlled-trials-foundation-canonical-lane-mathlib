import clinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean

structure AdmissibleClass where
  object : ClinicalAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ClinicalWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean
end HautevilleHouse