Profile: IHE_Health_Status_Observation
Parent: $Observation
Id: IHE.Health.Status.Observation
Title: "Health Status"
Description: """
A problem observation may reference a health status observation. This structure is included in the target observation using the <entryRelationship> element defined in the CDA Schema. The health status observation records information about the current health status of the patient. The example below shows the recording the health status, and is used as the context for the following sections.
"""

* ^status = #draft
* obeys should-text-ref-value

* classCode = #OBS (exactly)
* classCode ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-9057)."

* moodCode = #EVN (exactly)
* moodCode ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-9072)."

* templateId 2..* MS 
* templateId ^slicing.discriminator[+].type = #value
* templateId ^slicing.discriminator[=].path = "root"
* templateId ^slicing.discriminator[+].type = #value
* templateId ^slicing.discriminator[=].path = "extension"
* templateId ^slicing.rules = #open
* templateId contains 
    prob-health-status-obs 1..1 and 
    health-status-obs 1..1
* templateId[prob-health-status-obs].root 1..1
* templateId[prob-health-status-obs].root = "2.16.840.1.113883.10.20.1.51"
* templateId[health-status-obs].root 1..1
* templateId[health-status-obs].root = "1.3.6.1.4.1.19376.1.5.3.1.4.1.2"

* id 1..* MS 
* id ^comment = "SHALL contain at least one [1..*] id (CONF:1098-32486)."

* code ^comment = "SHALL contain exactly one [1..1] code (CONF:1098-19143)."
* code.code 1..1
* code.code = #11323-3
* code.code ^comment = "This code SHALL contain exactly one [1..1] @code=\"11323-3\" Health status (CONF:1098-19144)."
* code.displayName = "Health Status"
* code.codeSystem 1..1
* code.codeSystem = "2.16.840.1.113883.6.1"
* code.codeSystem ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1098-32161)."
* code.codeSystemName = "LOINC"

* text ^short = "SHOULD reference the portion of section narrative text corresponding to this entry"
* text.reference MS 
* text.reference obeys value-starts-octothorpe

* statusCode 1..1 MS 
* statusCode ^comment = "The code attribute of <statusCode> for all clinical status observations shall be completed. While the <statusCode> element is required in all acts to record the status of the act, the only sensible value of this element in this context is completed."
* statusCode.code 1..1 MS 
* statusCode.code = #completed (exactly)
* statusCode.code ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1098-19103)."

* value 1..1
* value only $CD
* value from HealthStatus_Value_VS (required)
* value ^comment = "The value of @code SHALL be drawn from value set 1.3.6.1.4.1.19376.1.5.3.1.11.3 HealthStatus_value (2016‑09‑26 14:09:34)"
