Profile:        IHE_PCC_PSC_CS_ClinicalDocument
Parent:         ClinicalDocument
Id:             IHE.PCC.PSC.CS.ClinicalDocument
Title:          "IHE Paramedicine Summary of Care Clinical Subset Document"
Description:    """
The Paramedicine Summary of Care – Clinical Subset contains the patient’s medical history, paramedicine care information and interventions that are relevant to clinical care.
"""

* templateId[+] = #1.3.6.1.4.1.19376.1.5.3.1.1.31.1
* templateId[+] = #1.3.6.1.4.1.19376.1.5.3.1.1.2
* templateId[+] = #1.3.6.1.4.1.19376.1.5.3.1.1.1
* code = $loinc#77596-5
// TBD update 

* component.structuredBody 1..1 MS 

//* component.structuredBody.component ^slicing.discriminator.type = #pattern
//* component.structuredBody.component ^slicing.discriminator.path = "code"
//* component.structuredBody.component ^slicing.rules = #open
//* component.structuredBody.component ^slicing.description = "Paramedicine Summary of Care CDA Clinical Subset Sections"
//* component.structuredBody.component ^slicing.ordered = false
//* component.structuredBody.component contains 
//  sectionDetailedChiefComplaint  1..1 MS and
//  sectionDetailedChiefComplaint  1..1 MS and
