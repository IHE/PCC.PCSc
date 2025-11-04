Profile:        IHE_PCC_MedicalSummary_CDA
Parent:         IHE_PCC_MedicalDocument_CDA
Id:             IHE.PCC.MS.CDA
Title:          "IHE Medical Summary CDA"
Description:    """
TBD
"""

//* ^identifier.system = "urn:ietf:rfc:3986"
//* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.1.1:2024-05-01"
//* ^status = #draft
* obeys should-sdtcCategory
* templateId 1..
* templateId contains medical-summary 1..1 MS 
* templateId[medical-summary].root 1..1
* templateId[medical-summary].root = "1.3.6.1.4.1.19376.1.5.3.1.1.2"

* component MS 
* component ^comment = "SHALL contain exactly one [1..1] component (CONF:1198-8349)."
* component.structuredBody 1..1 MS
//* component.structuredBody obeys ihe-ap-combo and ihe-cc-rfv-combo
// Note: remove comented out line ^ when invarients are completed 
* component.structuredBody.component MS 
// Question: does Medical summary actually require the Medications allergies, problems and payers section, or does it only require the entries, the specification is not clear on this... 
* component.structuredBody.component ^slicing.discriminator[+].type = #profile
* component.structuredBody.component ^slicing.discriminator[=].path = "section"
* component.structuredBody.component ^slicing.rules = #open
* component.structuredBody.component contains 
//     medications 0..1 and
     active-problems 0..1 MS and 
     allergies 0..1 MS and
     payers 0..1 
//* component.structuredBody.component[medications] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-30571)."
//* component.structuredBody.component[medications].section only $IHEMedicationsSection
//* component.structuredBody.component[medications].section ^comment = "SHALL contain exactly one [1..1] Medications Section (identifier: urn:oid:1.3.6.1.4.1.19376.1.5.3.1.3.19:2007‑04‑01) (CONF:1198-30572)."

* component.structuredBody.component[active-problems].section only IHE_PCC_Active_Problems_Section
* component.structuredBody.component[active-problems].section ^comment = "SHALL Contain at least 1..* problem entries Otherwise a Null value SHALL be present"


* component.structuredBody.component[allergies].section only IHE_PCC_CDA_AllergiesAndOtherAdverseReactions_Section
* component.structuredBody.component[allergies].section ^comment = "SHALL contain at least 1 Allergry concernt entry otherwise a NUll Value SHALL be present."

* component.structuredBody.component[payers] ^comment = "This structuredBody MAY contain zero or one Payers Section"
* component.structuredBody.component[payers].section only IHE_PCC_CDA_Payers_Section

