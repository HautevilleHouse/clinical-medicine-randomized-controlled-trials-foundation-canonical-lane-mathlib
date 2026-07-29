import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean

structure RandomizationBlindingPackage where
  allocationConcealment : Prop
  sequenceGeneration : Prop
  maskingProcedure : Prop
  blindingOutcome : Prop
  balanceAssessed : Prop

structure RandomizationBlindingEvidence (R : RandomizationBlindingPackage) where
  allocationConcealmentClosed : R.allocationConcealment
  sequenceGenerationClosed : R.sequenceGeneration
  maskingProcedureClosed : R.maskingProcedure
  blindingOutcomeClosed : R.blindingOutcome
  balanceAssessedClosed : R.balanceAssessed

def RandomizationBlindingClosed (R : RandomizationBlindingPackage) : Prop :=
  R.allocationConcealment ∧ R.sequenceGeneration ∧ R.maskingProcedure ∧ R.blindingOutcome ∧ R.balanceAssessed

theorem randomization_blinding_closed_from_evidence (R : RandomizationBlindingPackage) 
    (E : RandomizationBlindingEvidence R) : RandomizationBlindingClosed R := by
  exact And.intro E.allocationConcealmentClosed
    (And.intro E.sequenceGenerationClosed
      (And.intro E.maskingProcedureClosed
        (And.intro E.blindingOutcomeClosed E.balanceAssessedClosed)))

end ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean
end HautevilleHouse