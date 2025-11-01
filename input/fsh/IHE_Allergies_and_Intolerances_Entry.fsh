Profile: IHE_Allergies_And_Intolerances_Entry
Parent: IHE_PCC_Problem_Entry
Id: IHE.Allergies.And.Intolerances.Entry
Title: "IHE Allergies and Intolerances Entry"
Description: """
Allergies and intolerances are special kinds of problems, and so are also recorded in the CDA <observation> element, with classCode='OBS'. They follow the same pattern as the problem entry, with exceptions noted.

TBD Still needs to be finished building
"""
//* ^identifier.system = "urn:ietf:rfc:3986"
//* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.4.3:2024-05-01"
* ^status = #draft

* templateId contains ihe-prob-concern-entry 1..1
* templateId[ihe-prob-concern-entry].root 1..1
* templateId[ihe-prob-concern-entry].root = "1.3.6.1.4.1.19376.1.5.3.1.4.6"

* participant MS 
* participant.typeCode.code = #CSM
* participant.participantRole.classCode.code = #MANU
* participant.participantRole.playingEntity.classCode.code = #MMAT

* code 1..1 
* code.code 1..1 MS 
* code from ObservationIntoleranceType (preferred)

* negationInd ^short = "Use negationInd=\"true\" to indicate that the allergy was not observed."
* negationInd ^comment = "MAY contain zero or one [0..1] @negationInd (CONF:1098-31526)."



* entryRelationship contains 
    reactions 0..* and 
    comment 0..* 
* entryRelationship[reactions].typeCode = #MFST (exactly)
* entryRelationship[comment].inversionInd = false (exactly)
* entryRelationship[reactions].observation 1..1
* entryRelationship[reactions].observation only IHE_PCC_Problem_Entry
* entryRelationship[reactions].observation ^comment = "with this entry an additional OID of (2.16.840.1.113883.10.20.1.54) SHALL be used, indicating that this problem is a reaction."

* entryRelationship[comment].typeCode = #SUBJ (exactly)
* entryRelationship[comment].typeCode ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-31531)."
* entryRelationship[comment].inversionInd = true (exactly)
* entryRelationship[comment].observation 1..1
* entryRelationship[comment].observation only IHE_PCC_Comment_Entry
* entryRelationship[comment].observation ^comment = "with this entry an additional OID of (2.16.840.1.113883.10.20.1.54) SHALL be used, indicating that this problem is a reaction."
