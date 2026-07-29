import clinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean

structure CompartmentModelPackage where
  compartments : Nat
  transferRates : Nat -> Nat -> Prop
  initialConcentrations : Prop
  differentialEquations : Prop
  solutionCurves : Prop

structure CompartmentModelEvidence (C : CompartmentModelPackage) where
  compartmentsClosed : C.compartments = 2
  transferRatesClosed : C.transferRates 0 1
  initialConcentrationsClosed : C.initialConcentrations
  differentialEquationsClosed : C.differentialEquations
  solutionCurvesClosed : C.solutionCurves

def CompartmentModelClosed (C : CompartmentModelPackage) : Prop :=
  C.compartments = 2 ∧ C.transferRates 0 1 ∧ C.initialConcentrations ∧ C.differentialEquations ∧ C.solutionCurves

theorem compartment_model_closed_from_evidence (C : CompartmentModelPackage) (E : CompartmentModelEvidence C) :
    CompartmentModelClosed C := by
  exact And.intro E.compartmentsClosed (And.intro E.transferRatesClosed (And.intro E.initialConcentrationsClosed (And.intro E.differentialEquationsClosed E.solutionCurvesClosed)))

end ClinicalMedicineRandomizedControlledTrialsFoundationCanonicalLaneLean
end HautevilleHouse