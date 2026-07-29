import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean

structure CompartmentModelPKPackage where
  nCompartment : Nat
  volumeDistribution : Prop
  rateConstants : Prop
  initialDose : Prop
  concentrationCurve : Prop

structure CompartmentModelPKEvidence (P : CompartmentModelPKPackage) where
  volumeDistributionClosed : P.volumeDistribution
  rateConstantsClosed : P.rateConstants
  initialDoseClosed : P.initialDose
  concentrationCurveClosed : P.concentrationCurve

def CompartmentModelPKClosed (P : CompartmentModelPKPackage) : Prop :=
  P.volumeDistribution ∧ P.rateConstants ∧ P.initialDose ∧ P.concentrationCurve

theorem compartment_model_pk_closed_from_evidence (P : CompartmentModelPKPackage) 
    (E : CompartmentModelPKEvidence P) : CompartmentModelPKClosed P := by
  exact And.intro E.volumeDistributionClosed
    (And.intro E.rateConstantsClosed
      (And.intro E.initialDoseClosed E.concentrationCurveClosed))

end ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean
end HautevilleHouse