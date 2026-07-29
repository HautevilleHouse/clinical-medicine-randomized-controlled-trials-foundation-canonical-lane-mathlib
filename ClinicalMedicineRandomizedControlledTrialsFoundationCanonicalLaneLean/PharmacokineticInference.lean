import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean.CompartmentModel

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean

structure PharmacokineticModel (m : CompartmentModel) where
  clearance : ℝ
  absorptionRate : ℝ
  eliminationRate : ℝ

def validPK (m : CompartmentModel) (pk : PharmacokineticModel m) : Prop :=
  pk.clearance > 0 ∧ pk.absorptionRate > 0 ∧ pk.eliminationRate > 0

structure PharmacokineticEvidence (m : CompartmentModel) (pk : PharmacokineticModel m) where
  validPKClosed : validPK m pk
  steadyStateConcentrationClosed : ∃ c : ℝ, c > 0 ∧ (∀ t, t ≥ 0 → concentration m pk t = c)

def PharmacokineticClosed (m : CompartmentModel) (pk : PharmacokineticModel m) : Prop :=
  validPK m pk ∧ ∃ c : ℝ, c > 0 ∧ (∀ t, t ≥ 0 → concentration m pk t = c)

theorem pharmacokinetic_closed_from_evidence (m : CompartmentModel) (pk : PharmacokineticModel m) (e : PharmacokineticEvidence m pk) :
    PharmacokineticClosed m pk := by
  exact And.intro e.validPKClosed e.steadyStateConcentrationClosed

end ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean
end HautevilleHouse
