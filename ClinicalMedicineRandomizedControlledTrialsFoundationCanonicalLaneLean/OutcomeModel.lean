import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean

structure OutcomePackage where
  primaryEndpoint : String
  secondaryEndpoints : List String
  measurementMethod : String
  timePoints : List Nat
  compositeEndpoint : Bool
  responderDefinition : String

structure OutcomeEvidence (O : OutcomePackage) where
  primaryEndpointClosed : O.primaryEndpoint = "Overall Survival"
  compositeEndpointClosed : O.compositeEndpoint = false

def OutcomeClosed (O : OutcomePackage) : Prop :=
  O.primaryEndpoint = "Overall Survival" ∧ O.compositeEndpoint = false ∧
  O.responderDefinition ≠ ""

theorem outcome_closed_from_evidence (O : OutcomePackage) (E : OutcomeEvidence O) :
    OutcomeClosed O := by
  refine And.intro E.primaryEndpointClosed (And.intro E.compositeEndpointClosed ?_)
  intro h
  exact h (rfl)

end ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean
end HautevilleHouse