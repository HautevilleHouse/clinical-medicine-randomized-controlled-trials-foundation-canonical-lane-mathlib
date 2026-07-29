import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean

structure PopulationPackage where
  inclusionCriteria : Prop
  exclusionCriteria : Prop
  sampleSize : Nat
  powerCalculation : Prop
  randomAllocation : Prop
  stratificationFactors : List String
  randomizationMethod : String
  allocationConcealment : Bool
  blinding : String
  groupAllocation : Nat -> Prop

structure PopulationEvidence (P : PopulationPackage) where
  inclusionCriteriaClosed : P.inclusionCriteria
  exclusionCriteriaClosed : P.exclusionCriteria
  sampleSizeClosed : P.sampleSize = 1000
  powerCalculationClosed : P.powerCalculation
  randomAllocationClosed : P.randomAllocation
  allocationConcealmentClosed : P.allocationConcealment = true

def PopulationClosed (P : PopulationPackage) : Prop :=
  P.inclusionCriteria ∧ P.exclusionCriteria ∧ (P.sampleSize = 1000) ∧
  P.powerCalculation ∧ P.randomAllocation ∧ (P.allocationConcealment = true)

theorem population_closed_from_evidence (P : PopulationPackage) (E : PopulationEvidence P) :
    PopulationClosed P := by
  refine And.intro E.inclusionCriteriaClosed (And.intro E.exclusionCriteriaClosed
    (And.intro E.sampleSizeClosed (And.intro E.powerCalculationClosed
      (And.intro E.randomAllocationClosed E.allocationConcealmentClosed))))

end ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean
end HautevilleHouse
