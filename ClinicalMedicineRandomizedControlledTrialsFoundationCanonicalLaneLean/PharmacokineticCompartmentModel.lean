import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean

structure PharmacokineticCompartmentPackage where
  compartmentCount : ℕ
  volumeDistribution : ℕ → ℝ
  eliminationRate : ℕ → ℝ
  absorptionRate : ℕ → ℝ
  drugConcentration : ℕ → ℝ → ℝ
  linearKinetics : Prop
  steadyStateReached : Prop

structure PharmacokineticCompartmentEvidence (P : PharmacokineticCompartmentPackage) where
  linearKineticsClosed : P.linearKinetics
  steadyStateReachedClosed : P.steadyStateReached

def PharmacokineticCompartmentClosed (P : PharmacokineticCompartmentPackage) : Prop :=
  P.linearKinetics ∧ P.steadyStateReached

theorem pharmacokinetic_compartment_closed_from_evidence
    (P : PharmacokineticCompartmentPackage)
    (E : PharmacokineticCompartmentEvidence P) : PharmacokineticCompartmentClosed P := by
  exact And.intro E.linearKineticsClosed E.steadyStateReachedClosed

end ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean
end HautevilleHouse
