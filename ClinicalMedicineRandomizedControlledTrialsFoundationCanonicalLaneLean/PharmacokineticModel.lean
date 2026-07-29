import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRCTFoundation

structure PharmacokineticModelPackage where
  absorptionRate : ℝ
  distributionVolume : ℝ
  eliminationRate : ℝ
  bioavailability : ℝ
  plasmaConcentrationCurve : Prop
  areaUnderCurve : Prop
  halfLife : Prop

structure PharmacokineticModelEvidence (P : PharmacokineticModelPackage) where
  plasmaConcentrationCurveClosed : P.plasmaConcentrationCurve
  areaUnderCurveClosed : P.areaUnderCurve
  halfLifeClosed : P.halfLife

def PharmacokineticModelClosed (P : PharmacokineticModelPackage) : Prop :=
  P.plasmaConcentrationCurve ∧ P.areaUnderCurve ∧ P.halfLife

theorem pharmacokinetic_model_closed_from_evidence (P : PharmacokineticModelPackage)
    (E : PharmacokineticModelEvidence P) : PharmacokineticModelClosed P := by
  exact And.intro E.plasmaConcentrationCurveClosed
    (And.intro E.areaUnderCurveClosed E.halfLifeClosed)

end ClinicalMedicineRCTFoundation
end HautevilleHouse