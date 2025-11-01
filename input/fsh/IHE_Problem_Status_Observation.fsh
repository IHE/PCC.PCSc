Alias: $Observation = http://hl7.org/cda/stds/core/StructureDefinition/Observation
Alias: $CD = http://hl7.org/cda/stds/core/StructureDefinition/CD
Alias: $2.16.840.1.113883.3.88.12.80.68 = http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.88.12.80.68

Profile: IHE_Problem_Status_Observation
Parent: $Observation
Id: IHE.Problem.Status.Observation
Title: "Problem Status Observation"
Description: """
Any problem or allergy observation may reference a problem status observation. This structure is included in the target observation using the <entryRelationship> element defined in the CDA Schema. The clinical status observation records information about the current status of the problem or allergy, for example, whether it is active, in remission, resolved, et cetera. The example below shows the recording of clinical status of a condition or allergy, and is used as the context for the following sections.
"""
* ^status = #draft
* obeys should-text-ref-value

* classCode = #OBS (exactly)
* classCode ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-7357)."

* moodCode = #EVN (exactly)
* moodCode ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-7358)."

* templateId 3..* MS 
* templateId ^slicing.discriminator[+].type = #value
* templateId ^slicing.discriminator[=].path = "root"
* templateId ^slicing.discriminator[+].type = #value
* templateId ^slicing.discriminator[=].path = "extension"
* templateId ^slicing.rules = #open
* templateId contains 
    status-obs 1..1 and 
    problem-status-obs 1..1 and
    ihe-problem-status-obs 1..1   
* templateId[status-obs].root 1..1
* templateId[status-obs].root = "2.16.840.1.113883.10.20.1.57"
* templateId[severity-entry].root 1..1
* templateId[severity-entry].root = "2.16.840.1.113883.10.20.1.50"
* templateId[ihe-problem-status-obs].root 1..1
* templateId[ihe-problem-status-obs].root = "1.3.6.1.4.1.19376.1.5.3.1.4.1.1"

* code 1..1 MS 
* code ^short = "Diagnosis status"
* code ^comment = "This observation is of clinical status, as indicated by the <code> element. This element must be present."
* code.code 1..1
* code.code = #33999-4
* code.codeSystem 1..1
* code.codeSystem = "2.16.840.1.113883.6.1"
* code.displayName = "Status"
* code.codeSystem ^short = "LOINC"

* text ^short = "The <text> element is required and points to the text describing the problem being recorded; including any dates, comments, et cetera. The <reference> contains a URI in value attribute. This URI points to the free text description of the problem in the document that is being described."
* text.reference 1..1 MS 
* text.reference obeys value-starts-octothorpe

* statusCode 1..1 MS 
* statusCode ^comment = "The code attribute of <statusCode> for all clinical status observations shall be completed. While the <statusCode> element is required in all acts to record the status of the act, the only sensible value of this element in this context is completed."
* statusCode.code 1..1
* statusCode.code = #completed (exactly)
* statusCode.code ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1198-19113)."

* value 1..1
* value only $CD
* value from ProblemStatusObservation_Value_VS (required)
* value ^comment = "The value of @code SHALL be drawn from value set 1.3.6.1.4.1.19376.1.5.3.1.11.2 ProblemStatusObservation_value (2016‑09‑26 13:58:58)"