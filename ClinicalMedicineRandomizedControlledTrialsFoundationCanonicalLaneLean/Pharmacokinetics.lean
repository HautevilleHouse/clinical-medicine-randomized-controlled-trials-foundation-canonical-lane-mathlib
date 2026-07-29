import clinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean.CompartmentModel

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean

structure PharmacokineticsPackage {C : CompartmentModelPackage} where
  absorptionRate : Prop
  distributionVolume : Prop
  eliminationRate : Prop
  concentrationTimeCurve : Prop

def PharmacokineticsClosed {C : CompartmentModelPackage} (P : PharmacokineticsPackage C) : Prop :=
  P.absorptionRate ∧ P.distributionVolume ∧ P.eliminationRate ∧ P.concentrationTimeCurve

structure PharmacokineticsEvidence {C : CompartmentModelPackage} (P : PharmacokineticsPackage C) where
  absorptionRateClosed : P.absorptionRate
  distributionVolumeClosed : P.distributionVolume
  eliminationRateClosed : P.eliminationRate
  concentrationTimeCurveClosed : P.concentrationTimeCurve

theorem pharmacokinetics_closed_from_evidence {C : CompartmentModelPackage} (P : PharmacokineticsPackage C) (E : PharmacokineticsEvidence P) :
    PharmacokineticsClosed P := by
  exact And.intro E.absorptionRateClosed (And.intro E.distributionVolumeClosed (And.intro E.eliminationRateClosed E.concentrationTimeCurveClosed))

end ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean
end HautevilleHouse