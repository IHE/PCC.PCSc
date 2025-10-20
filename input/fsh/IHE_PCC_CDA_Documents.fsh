//Profile:        IHE_PCC_PSC_CS_ClinicalDocument_MedicalSummary
//Parent:         http://hl7.org/cda/stds/core/StructureDefinition/ClinicalDocument
//Id:             IHE.PCC.PSC.CS.ClinicalDocument.MedicalSummary
//Title:          "IHE Paramedicine Summary of Care CDA Clinical Subset Document"
//Description:    """
//The Paramedicine Summary of Care – Clinical Subset contains the patient’s medical history, paramedicine care information and interventions that are relevant to clinical care.
//"""

//* templateId[+] = "1.3.6.1.4.1.19376.1.5.3.1.1.31.1"
//* templateId[+] = "1.3.6.1.4.1.19376.1.5.3.1.1.2"
//* templateId[+] = "1.3.6.1.4.1.19376.1.5.3.1.1.1"
//* code = $loinc#18842-5
// TBD update 

//* component.structuredBody 1..1 MS 

//* component.structuredBody.component ^slicing.discriminator.type = #pattern
//* component.structuredBody.component ^slicing.discriminator.path = "code"
//* component.structuredBody.component ^slicing.rules = #open
//* component.structuredBody.component ^slicing.description = "Paramedicine Summary of Care CDA Clinical Subset Sections"
//* component.structuredBody.component ^slicing.ordered = false
//* component.structuredBody.component contains 
//  sectionDetailedChiefComplaint  1..1 MS and
//  sectionDetailedChiefComplaint  1..1 MS and



Profile:        IHE_PCC_MedicalDocument_ClinicalDocument
Parent:         http://hl7.org/cda/stds/core/StructureDefinition/ClinicalDocument
Id:             IHE.PCC.MD.ClinicalDocument.MedicalDocument 
Title:          "IHE Medical Document CDA"
Description:    """
This section defines the base set of constraints used by almost all medical document profiles described in the PCC Technical Framework.
"""
// Class ode R
* @classCode MS 
// Class code diplay name R
* typeId MS
* templateId MS 
//uniqueId Required 
* id MS
// The uniqueId can be formatted using the following XPath expression, where $docID in the expression below represents the identifier. concat($docID/@root,"^", $docID/@extension)
// typeCode Required 
* code MS 
// The typeCode should be mapped from the ClinicalDocument/code element to a set of document type codes configured in the affinity domain. One suggested coding system to use for typeCode is LOINC, in which case the mapping step can be omitted.
// typeCodeDisplay Name Required
* code.@displayName 1..1 MS 
//Title Optional
* sdtcStatusCode 1..1 MS
// is this the same as availability status?
//creation time R
* effectiveTime MS
// COnfidentiality code R
* confidentialityCode MS
* languageCode MS
//* setId
//* versionNumber 	
//* copyTime

// sourcePatientInfo Required
* recordTarget MS
// The sourcePatientInfo metadata element can be assembled from various components of the patientRole element in the clinical document.
// sourcePatientId Required
* recordTarget.patientRole MS
* recordTarget.patientRole.id MS
// The patientId can be formatted using the following XPath expression, where $patID in the expression below represents the appropriate identifier. concat($patID/@extension,"^^^&", $patID/@root, "&ISO")

// Author Insititution is required If nown IHE R2
* author MS
* author.assignedAuthor.representedOrganization.name MS 
// how do we model down to that level?
// Author Person is required If nown IHE R2
* author.assignedAuthor.assignedPerson MS 
// Author Role R2
// Author Specialty R2
// how do we model down to that level?

//* dataEnterer
//* informant
//* custodian
//* informationRecipient 	
//* legalAuthenticator
//* authenticator
//* participant
//* inFulfillmentOf

// serviceStopTime R2 
* documentationOf MS 
// Times specified in clinical documents may be specified with a precision in fractional sections, and may contain a time zone offset. In the XDS Metadata, it can be precise to the second, and is always given in UTC, so the timezone offset if present must be added to the current time to obtain the UTC time.
* documentationOf.serviceEvent MS 
* documentationOf.serviceEvent.effectiveTime MS 

//* relatedDocument
//* authorization
//* componentOf
//* component
// where does Entry uuid go? (required)

// clinical docuent Header elements
// * @classCode
//* @moodCode
//* realmCode
//* typeId
//* templateId
//* id
//* sdtcCategory
//* code
//* title
//* sdtcStatusCode
//* effectiveTime
//* confidentialityCode
//* languageCode
//* setId
//* versionNumber 	
//* copyTime
//* recordTarget
//* author
//* dataEnterer
//* informant
//* custodian
//* informationRecipient 	
//* legalAuthenticator
//* authenticator
//* participant
//* inFulfillmentOf
//* documentationOf
//* relatedDocument
//* authorization
//* componentOf
//* component




* templateId[+] = "1.3.6.1.4.1.19376.1.5.3.1.1.1"
// US Realm * templateId[+] = "2.16.840.1.113883.10.20.3"
//* typeId = $loinc#2.16.840.1.113883.6.1



* confidentialityCode MS
  * codeSystem = "2.16.840.1.113883.5.25"
  * codeSystemName = "Confidentiality"
// TODO FInish metadata requirements if needed. need to figure out if the item is 1..1 do we need to make it MS? 
//* author 


//Profile:        IHE_PCC_MedicalSummary_ClinicalDocument
//Parent:         IHE.PCC.MD.ClinicalDocument.MedicalDocument
//Id:             IHE.PCC.MedicalSummary
//Title:          "IHE Medical Summary CDA"
//Description:    """
//TBD Pull from Profile 
//"""

//* templateId[+] = "1.3.6.1.4.1.19376.1.5.3.1.1.2"
//* typeId = $loinc#2.16.840.1.113883.6.1

//* componentOf 1..1 MS
//* component 1..1 MS
 // * structuredBody 1..1 MS 
  //  * component 3..*
   //   * ^slicing.discriminator[0].type = #profile
   //   * ^slicing.discriminator[=].path = "section"
   //   * ^slicing.rules = #open
   // * component contains
   //     allergies 1..1 MS and
   //     Medications 1..1 MS and 
    //    problems 1..1 MS and 
   //     payers 0..1
   // * component[allergies] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-30519)"
   //   * section only IHEAllergiesAndOtherAdverseReactionsSection
        //* ^comment = "This component SHALL contain exactly one [1..1] Allergies and Intolerances Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.6.1:2024-05-01) (CONF:1198-30520)."
   // * component[Medications] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-30519)"
   //   * section only IHEMedicationsSection
        //* ^comment = "This component SHALL contain exactly one [1..1] Allergies and Intolerances Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.6.1:2024-05-01) (CONF:1198-30520)."
  //  * component[problems] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-30519)"
  //    * section only IHEActiveProbelmsSection
 //       //* ^comment = "This component SHALL contain exactly one [1..1] Allergies and Intolerances Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.6.1:2024-05-01) (CONF:1198-30520)."
 //   * component[payers] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-30519)"
 //     * section only IHEPayersSection
        //* ^comment = "This component MAY contain one [1..1] Allergies and Intolerances Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.6.1:2024-05-01) (CONF:1198-30520)."




//Profile:        IHE_PCC_DischargeSummary
//Parent:         IHE.PCC.MedicalSummary
//Id:             IHE.PCC.DischargeSummary
//Title:          "IHE Medical Summary CDA"
//Description:    """
//TBD Pull from Profile 
//"""

//* templateId[+] = "1.3.6.1.4.1.19376.1.5.3.1.1.2"

 //   * component 4..
 //   * component contains









//Invariant: 1198-8469
//Description: "When participant/@typeCode is IND, associatedEntity/@classCode **SHALL** be selected from ValueSet 2.16.840.1.113883.11.20.9.33 INDRoleclassCodes STATIC 2011-09-30 (CONF:1198-8469)."
//Severity: #error
//Expression: "typeCode = 'IND' implies associatedEntity.classCode.memberOf('http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.11.20.9.33')"

//Invariant: 1198-32898
//Description: "This assignedEntity **SHALL** contain an assignedPerson or a representedOrganization or both (CONF:1198-32898)."
//Severity: #error
//Expression: "assignedPerson.exists() or representedOrganization.exists()"

//Invariant: 1198-32899
//Description: "This assignedEntity **SHALL** contain an assignedPerson or a representedOrganization or both (CONF:1198-32899)."
//Severity: #error
//Expression: "assignedPerson.exists() or representedOrganization.exists()"
