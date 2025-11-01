Profile: IHE_PCC_Concern_Entry
Parent: $Act
Id: IHE.PCC.Concern.Entry
Title: "IHE Concern Entry"
Description: """
This event (moodCode='EVN') represents an act (<act classCode='ACT') of being concerned about a problem, allergy or other issue. The <effectiveTime> element describes the period of concern. The subject of concern is one or more observations about related problems (see 1.3.6.1.4.1.19376.1.5.3.1.4.5.2) or allergies and intolerances (see 1.3.6.1.4.1.19376.1.5.3.1.4.5.3). Additional references can be provided having additional information related to the concern. The concern entry allows related acts to be grouped. This4415 allows representing the history of a problem as a series of observation over time, for example.
"""
//* ^identifier.system = "urn:ietf:rfc:3986"
//* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.4.3:2024-05-01"
* ^status = #draft
* obeys should-text-ref-value and should-author

* classCode = #ACT (exactly)
* classCode ^comment = "SHALL contain exactly one [1..1] @classCode=\"ACT\" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-9024)."

* moodCode = #EVN (exactly)
* moodCode ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-9025)."

* templateId 2..* MS 
* templateId ^slicing.discriminator[+].type = #value
* templateId ^slicing.discriminator[=].path = "root"
* templateId ^slicing.discriminator[+].type = #value
* templateId ^slicing.discriminator[=].path = "extension"
* templateId ^slicing.rules = #open
* templateId contains 
    problem-act 1..1 and 
    ihe-concern-entry 1..1 
* templateId[problem-act].root 1..1
* templateId[problem-act].root = "2.16.840.1.113883.10.20.1.27"
* templateId[ihe-concern-entry].root 1..1
* templateId[ihe-concern-entry].root = "1.3.6.1.4.1.19376.1.5.3.1.4.5.1"

* id 1..* MS 
* id ^comment = "MUST contain at least one [1..*] id (CONF:1198-9026)."

* code MS 
* code ^comment = "SHALL contain exactly one [1..1] code (CONF:1198-9027)."
* code.nullFlavor 1..1 
* code.nullFlavor = #NA 

* statusCode 1..1 MS 
* statusCode ^short = "The statusCode of the Concern Entry is the definitive indication of the status of the concern, whereas the effectiveTime of the nested Problem Observation is the definitive indication of whether or not the underlying condition is resolved."
* statusCode.nullFlavor 0..0

* text ^short = "SHOULD reference the portion of section narrative text corresponding to this entry"
* text.reference obeys value-starts-octothorpe

* effectiveTime 1..1 MS 
* effectiveTime ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:1198-9030)."
* effectiveTime.low 1..1 MS 
* effectiveTime.low ^short = "The effectiveTime/low of the Concern Entry asserts when the concern became active."
* effectiveTime.low ^comment = "This effectiveTime SHALL contain exactly one [1..1] low (CONF:1198-9032)."
* effectiveTime.high MS 
* effectiveTime.high ^short = "The effectiveTime/high asserts when the concern was completed (e.g., when the clinician deemed there is no longer any need to track the underlying condition)."
* effectiveTime.high ^comment = "This effectiveTime MAY contain zero or one [0..1] high (CONF:1198-9033)."
* effectiveTime.high obeys ihe-shall-time-high
// Invarient The <high> element shall be present for concerns in the completed or aborted state, and shall not be present otherwise.

//* author only $AuthorParticipation
//* author ^comment = "SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1198-31146)."
// Is this ^ us specifict contraint? 

* entryRelationship 1..* MS 
* entryRelationship ^slicing.discriminator[+].type = #profile
* entryRelationship ^slicing.discriminator[=].path = "observation"
* entryRelationship ^slicing.rules = #open
* entryRelationship ^short = "The following entryRelationships represent identifying problems of concern and providing more information about the concern."
* entryRelationship contains 
    problem-entry 0..* MS and 
    allergies-and-ntolerances-entry 0..* MS
* entryRelationship[problem-entry] ^comment = "SHALL contain exactly one [1..1] entryRelationship (CONF:1198-9034) such that it"
* entryRelationship[problem-entry].typeCode = #SUBJ (exactly)
* entryRelationship[problem-entry].typeCode ^comment = "SHALL contain exactly one [1..1] @typeCode=\"SUBJ\" Has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1198-9035)."
* entryRelationship[problem-entry].inversionInd 1..
* entryRelationship[problem-entry].inversionInd = false (exactly)
* entryRelationship[problem-entry].observation 1..1
* entryRelationship[problem-entry].observation only IHE_PCC_Problem_Entry

* entryRelationship[allergies-and-ntolerances-entry] ^comment = "SHALL contain exactly one [1..1] entryRelationship (CONF:1198-9034) such that it"
* entryRelationship[allergies-and-ntolerances-entry].typeCode = #SUBJ (exactly)
* entryRelationship[allergies-and-ntolerances-entry].typeCode ^comment = "SHALL contain exactly one [1..1] @typeCode=\"SUBJ\" Has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1198-9035)."
* entryRelationship[allergies-and-ntolerances-entry].inversionInd 1..
* entryRelationship[allergies-and-ntolerances-entry].inversionInd = false (exactly)
* entryRelationship[allergies-and-ntolerances-entry].observation 1..1
* entryRelationship[allergies-and-ntolerances-entry].observation only IHE_Allergies_And_Intolerances_Entry


